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
CMAKE_SOURCE_DIR = /home/yw/share/source/baremetal

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/yw/share/source/baremetal/build

# Utility rule file for bin.

# Include the progress variables for this target.
include CMakeFiles/bin.dir/progress.make

CMakeFiles/bin: baremetal.bin


baremetal.bin: baremetal
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/home/yw/share/source/baremetal/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating baremetal.bin"
	/usr/bin/arm-none-eabi-objcopy -Obinary baremetal baremetal.bin

bin: CMakeFiles/bin
bin: baremetal.bin
bin: CMakeFiles/bin.dir/build.make

.PHONY : bin

# Rule to build all files generated by this target.
CMakeFiles/bin.dir/build: bin

.PHONY : CMakeFiles/bin.dir/build

CMakeFiles/bin.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/bin.dir/cmake_clean.cmake
.PHONY : CMakeFiles/bin.dir/clean

CMakeFiles/bin.dir/depend:
	cd /home/yw/share/source/baremetal/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/yw/share/source/baremetal /home/yw/share/source/baremetal /home/yw/share/source/baremetal/build /home/yw/share/source/baremetal/build /home/yw/share/source/baremetal/build/CMakeFiles/bin.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/bin.dir/depend
