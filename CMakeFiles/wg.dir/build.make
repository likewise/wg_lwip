# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/strngr/Projects/wireguard-lwip

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/strngr/Projects/wireguard-lwip

# Include any dependencies generated for this target.
include CMakeFiles/wg.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/wg.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/wg.dir/flags.make

CMakeFiles/wg.dir/wg.c.o: CMakeFiles/wg.dir/flags.make
CMakeFiles/wg.dir/wg.c.o: wg.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strngr/Projects/wireguard-lwip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/wg.dir/wg.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wg.dir/wg.c.o   -c /home/strngr/Projects/wireguard-lwip/wg.c

CMakeFiles/wg.dir/wg.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wg.dir/wg.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/strngr/Projects/wireguard-lwip/wg.c > CMakeFiles/wg.dir/wg.c.i

CMakeFiles/wg.dir/wg.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wg.dir/wg.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/strngr/Projects/wireguard-lwip/wg.c -o CMakeFiles/wg.dir/wg.c.s

CMakeFiles/wg.dir/src/wireguard.c.o: CMakeFiles/wg.dir/flags.make
CMakeFiles/wg.dir/src/wireguard.c.o: src/wireguard.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strngr/Projects/wireguard-lwip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/wg.dir/src/wireguard.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wg.dir/src/wireguard.c.o   -c /home/strngr/Projects/wireguard-lwip/src/wireguard.c

CMakeFiles/wg.dir/src/wireguard.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wg.dir/src/wireguard.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/strngr/Projects/wireguard-lwip/src/wireguard.c > CMakeFiles/wg.dir/src/wireguard.c.i

CMakeFiles/wg.dir/src/wireguard.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wg.dir/src/wireguard.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/strngr/Projects/wireguard-lwip/src/wireguard.c -o CMakeFiles/wg.dir/src/wireguard.c.s

CMakeFiles/wg.dir/src/wireguardif.c.o: CMakeFiles/wg.dir/flags.make
CMakeFiles/wg.dir/src/wireguardif.c.o: src/wireguardif.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strngr/Projects/wireguard-lwip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/wg.dir/src/wireguardif.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wg.dir/src/wireguardif.c.o   -c /home/strngr/Projects/wireguard-lwip/src/wireguardif.c

CMakeFiles/wg.dir/src/wireguardif.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wg.dir/src/wireguardif.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/strngr/Projects/wireguard-lwip/src/wireguardif.c > CMakeFiles/wg.dir/src/wireguardif.c.i

CMakeFiles/wg.dir/src/wireguardif.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wg.dir/src/wireguardif.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/strngr/Projects/wireguard-lwip/src/wireguardif.c -o CMakeFiles/wg.dir/src/wireguardif.c.s

CMakeFiles/wg.dir/src/wireguard-platform.c.o: CMakeFiles/wg.dir/flags.make
CMakeFiles/wg.dir/src/wireguard-platform.c.o: src/wireguard-platform.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strngr/Projects/wireguard-lwip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/wg.dir/src/wireguard-platform.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wg.dir/src/wireguard-platform.c.o   -c /home/strngr/Projects/wireguard-lwip/src/wireguard-platform.c

CMakeFiles/wg.dir/src/wireguard-platform.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wg.dir/src/wireguard-platform.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/strngr/Projects/wireguard-lwip/src/wireguard-platform.c > CMakeFiles/wg.dir/src/wireguard-platform.c.i

CMakeFiles/wg.dir/src/wireguard-platform.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wg.dir/src/wireguard-platform.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/strngr/Projects/wireguard-lwip/src/wireguard-platform.c -o CMakeFiles/wg.dir/src/wireguard-platform.c.s

CMakeFiles/wg.dir/src/crypto.c.o: CMakeFiles/wg.dir/flags.make
CMakeFiles/wg.dir/src/crypto.c.o: src/crypto.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/strngr/Projects/wireguard-lwip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building C object CMakeFiles/wg.dir/src/crypto.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/wg.dir/src/crypto.c.o   -c /home/strngr/Projects/wireguard-lwip/src/crypto.c

CMakeFiles/wg.dir/src/crypto.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/wg.dir/src/crypto.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/strngr/Projects/wireguard-lwip/src/crypto.c > CMakeFiles/wg.dir/src/crypto.c.i

CMakeFiles/wg.dir/src/crypto.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/wg.dir/src/crypto.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/strngr/Projects/wireguard-lwip/src/crypto.c -o CMakeFiles/wg.dir/src/crypto.c.s

# Object files for target wg
wg_OBJECTS = \
"CMakeFiles/wg.dir/wg.c.o" \
"CMakeFiles/wg.dir/src/wireguard.c.o" \
"CMakeFiles/wg.dir/src/wireguardif.c.o" \
"CMakeFiles/wg.dir/src/wireguard-platform.c.o" \
"CMakeFiles/wg.dir/src/crypto.c.o"

# External object files for target wg
wg_EXTERNAL_OBJECTS =

wg: CMakeFiles/wg.dir/wg.c.o
wg: CMakeFiles/wg.dir/src/wireguard.c.o
wg: CMakeFiles/wg.dir/src/wireguardif.c.o
wg: CMakeFiles/wg.dir/src/wireguard-platform.c.o
wg: CMakeFiles/wg.dir/src/crypto.c.o
wg: CMakeFiles/wg.dir/build.make
wg: src/crypto/refc/libcrypto.a
wg: liblwipcore.a
wg: liblwipallapps.a
wg: liblwipcontribportunix.a
wg: /usr/lib/x86_64-linux-gnu/libutil.so
wg: /usr/lib/x86_64-linux-gnu/libpthread.so
wg: /usr/lib/x86_64-linux-gnu/librt.so
wg: CMakeFiles/wg.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/strngr/Projects/wireguard-lwip/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking C executable wg"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/wg.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/wg.dir/build: wg

.PHONY : CMakeFiles/wg.dir/build

CMakeFiles/wg.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/wg.dir/cmake_clean.cmake
.PHONY : CMakeFiles/wg.dir/clean

CMakeFiles/wg.dir/depend:
	cd /home/strngr/Projects/wireguard-lwip && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/strngr/Projects/wireguard-lwip /home/strngr/Projects/wireguard-lwip /home/strngr/Projects/wireguard-lwip /home/strngr/Projects/wireguard-lwip /home/strngr/Projects/wireguard-lwip/CMakeFiles/wg.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/wg.dir/depend

