/*
 * Copyright (c) 2001-2003 Swedish Institute of Computer Science.
 * All rights reserved. 
 * 
 * Redistribution and use in source and binary forms, with or without modification, 
 * are permitted provided that the following conditions are met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright notice,
 *    this list of conditions and the following disclaimer in the documentation
 *    and/or other materials provided with the distribution.
 * 3. The name of the author may not be used to endorse or promote products
 *    derived from this software without specific prior written permission. 
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR ``AS IS'' AND ANY EXPRESS OR IMPLIED 
 * WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF 
 * MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT 
 * SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT 
 * OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS 
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN 
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING 
 * IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY 
 * OF SUCH DAMAGE.
 *
 * This file is part of the lwIP TCP/IP stack.
 * 
 * Author: Adam Dunkels <adam@sics.se>
 * RT timer modifications by Christiaan Simons
 */

#include "lwipopts.h"

#include <unistd.h>
#include <getopt.h>
#include <string.h>

#include "lwip/init.h"
#include "lwip/debug.h"

#include "lwip/mem.h"
#include "lwip/memp.h"
#include "lwip/sys.h"
#include "lwip/timeouts.h"
#include "lwip/stats.h"

#include "lwip/ip.h"
#include "lwip/ip4_frag.h"
#include "lwip/udp.h"
#include "lwip/tcp.h"

#if 0
#include "tapif.h"
#else
#include "axisif.h"
#endif
#include "lwip/etharp.h"
#include "netif/ethernet.h"

#include "apps/udpecho_raw/udpecho_raw.h"
#include "apps/tcpecho_raw/tcpecho_raw.h"

#include "../wg.h"

/* (manual) host IP configuration */
static ip4_addr_t ipaddr, netmask, gw;

/* nonstatic debug cmd option, exported in lwipopts.h */
unsigned char debug_flags;

#if LWIP_SNMP
/* enable == 1, disable == 2 */
u8_t snmpauthentraps_set = 2;
#endif

static struct option longopts[] = {
  /* turn on debugging output (if build with LWIP_DEBUG) */
  {"debug", no_argument,        NULL, 'd'},
  /* help */
  {"help", no_argument, NULL, 'h'},

  /* IP address of our TAP interface */
  {"tap0-ipaddr", required_argument, NULL, 't'},
  /* Netmask of our TAP interface */
  {"tap0-netmask", required_argument, NULL, 'n'},
  /* Gateway for our TAP interface */
  {"tap0-gateway", required_argument, NULL, 'w'},

  /* IP address of our Wireguard interface */
  {"wg0-ipaddr", required_argument, NULL, 'i'},
  /* Netmask of our Wireguard interface */
  {"wg0-netmask", required_argument, NULL, 'm'},
  /* Gateway for our Wireguard interface */
  {"wg0-gateway", required_argument, NULL, 'g'},
  /* Secret private key of our Wireguard interface */
  {"wg0-private-key", required_argument, NULL, 's'},

  /* Public key of one remote Wireguard peer */
  {"peer-public", required_argument, NULL, 'p'},
  /* Endpoint IP addres of one remote Wireguard peer */
  /* @TODO this is actually NOT required - Wireguard can learn remote endpoint IP address */
  /* This is only required if we are the Wireguard session initiator */
  {"peer-ipaddr", required_argument, NULL, 'e'},
  /* new command line options go here! */
  {NULL,   0,                 NULL,  0}
};
#define NUM_OPTS ((sizeof(longopts) / sizeof(struct option)) - 1)

static void
usage(void)
{
  unsigned char i;

  printf("options:\n");
  for (i = 0; i < NUM_OPTS; i++) {
    printf("-%c --%s\n",longopts[i].val, longopts[i].name);
  }
}

int
main(int argc, char **argv)
{
  err_t err;
  struct netif netif;
  struct netif wg_netif;
  struct wg_init_data wg_init_params;
  int ch;
  int success;

  /* startup defaults (may be overridden by one or more opts) */
  IP4_ADDR(&ipaddr, 192, 168, 1, 20);
  IP4_ADDR(&netmask, 255, 255, 255, 0);
  IP4_ADDR(&gw, 192, 168, 1, 254);

#if LWIP_SNMP
  trap_flag = 0;
#endif
  /* use debug flags defined by debug.h */
  debug_flags = LWIP_DBG_ON;

  while ((ch = getopt_long(argc, argv, "dht:n:w:i:m:g:e:p:s:", longopts, NULL)) != -1) {
    switch (ch) {
      case 'd':
        debug_flags |= (LWIP_DBG_ON|LWIP_DBG_TRACE|LWIP_DBG_STATE|LWIP_DBG_FRESH|LWIP_DBG_HALT);
        break;
      case 'h':
        usage();
        exit(0);
        break;

      // our host (tap0)
      case 't':
        success = ip4addr_aton(optarg, &ipaddr);
        if (!success) exit(1);
        break;
      case 'n':
        success = ip4addr_aton(optarg, &netmask);
        if (!success) exit(1);
        break;
      case 'w':
        success = ip4addr_aton(optarg, &gw);
        if (!success) exit(1);
        break;

      // our side of tunnel (wg0)
      case 'i':
        success = ip4addr_aton(optarg, &wg_init_params.ip);
        if (!success) exit(1);
        break;
      case 'm':
        success = ip4addr_aton(optarg, &wg_init_params.netmask);
        if (!success) exit(1);
        break;
      case 'g':
        success = ip4addr_aton(optarg, &wg_init_params.gateway);
        if (!success) exit(1);
        break;
      // wireguard secret private key
      case 's':
        /* TODO: add checking for char string param */
        wg_init_params.private_key = optarg;
        break;

      // peer public endpoint
      case 'e':
        success = ip4addr_aton(optarg, &wg_init_params.peer_ip);
        break;
      // peer public key
      case 'p':
        /* TODO: add checking for char string param */
        wg_init_params.peer_public_key = optarg;
        break;

      default:
        usage();
        break;
    }
  }
  argc -= optind;
  argv += optind;

  {
    char ip_str[16] = {0}, nm_str[16] = {0}, gw_str[16] = {0};
    strncpy(ip_str, ip4addr_ntoa(&ipaddr), sizeof(ip_str));
    strncpy(nm_str, ip4addr_ntoa(&netmask), sizeof(nm_str));
    strncpy(gw_str, ip4addr_ntoa(&gw), sizeof(gw_str));
    printf("This host TAP (our Wireguard endpoint) at %s mask %s with gateway %s\n", ip_str, nm_str, gw_str);
  }

  {
    char ip_str[16] = {0};
    strncpy(ip_str, ip4addr_ntoa(&wg_init_params.peer_ip), sizeof(ip_str));
    printf("Wireguard peer endpoint is %s.\n", ip_str);
  }

  {
    char ip_str[16] = {0}, nm_str[16] = {0}, gw_str[16] = {0};
    strncpy(ip_str, ip4addr_ntoa(&wg_init_params.ip), sizeof(ip_str));
    strncpy(nm_str, ip4addr_ntoa(&wg_init_params.netmask), sizeof(nm_str));
    strncpy(gw_str, ip4addr_ntoa(&wg_init_params.gateway), sizeof(gw_str));
    printf("Wireguard host at %s mask %s with gateway %s\n", ip_str, nm_str, gw_str);
  }

#ifdef PERF
  perf_init("/tmp/minimal.perf");
#endif /* PERF */

  lwip_init();

  printf("TCP/IP initialized.\n");

  netif_add(&netif, &ipaddr, &netmask, &gw, NULL, axisif_init, ethernet_input);

  netif_set_up(&netif);
#if LWIP_IPV6
  netif_create_ip6_linklocal_address(&netif, 1);
#endif

  udpecho_raw_init();
  tcpecho_raw_init();

  err = wireguard_setup(wg_init_params, &wg_netif);
  LWIP_ERROR("wireguard_setup failed\n", err == ERR_OK, return ERR_ABRT);
  netif_set_default(&netif);
  printf("Applications started.\n");
  while (1) {
    /* poll netif, pass packet to lwIP */
    axisif_select(&netif);

    sys_check_timeouts();
  }

  return 0;
}
