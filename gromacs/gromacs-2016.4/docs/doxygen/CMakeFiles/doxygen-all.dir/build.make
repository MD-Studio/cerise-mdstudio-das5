# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/fzapata/gromacs-2016.4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/fzapata/gromacs-2016.4/build

# Utility rule file for doxygen-all.

# Include the progress variables for this target.
include docs/doxygen/CMakeFiles/doxygen-all.dir/progress.make

docs/doxygen/CMakeFiles/doxygen-all:

doxygen-all: docs/doxygen/CMakeFiles/doxygen-all
doxygen-all: docs/doxygen/CMakeFiles/doxygen-all.dir/build.make
.PHONY : doxygen-all

# Rule to build all files generated by this target.
docs/doxygen/CMakeFiles/doxygen-all.dir/build: doxygen-all
.PHONY : docs/doxygen/CMakeFiles/doxygen-all.dir/build

docs/doxygen/CMakeFiles/doxygen-all.dir/clean:
	cd /home/fzapata/gromacs-2016.4/build/docs/doxygen && $(CMAKE_COMMAND) -P CMakeFiles/doxygen-all.dir/cmake_clean.cmake
.PHONY : docs/doxygen/CMakeFiles/doxygen-all.dir/clean

docs/doxygen/CMakeFiles/doxygen-all.dir/depend:
	cd /home/fzapata/gromacs-2016.4/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/fzapata/gromacs-2016.4 /home/fzapata/gromacs-2016.4/docs/doxygen /home/fzapata/gromacs-2016.4/build /home/fzapata/gromacs-2016.4/build/docs/doxygen /home/fzapata/gromacs-2016.4/build/docs/doxygen/CMakeFiles/doxygen-all.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : docs/doxygen/CMakeFiles/doxygen-all.dir/depend

