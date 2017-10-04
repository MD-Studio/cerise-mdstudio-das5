#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libgromacs" for configuration "Release"
set_property(TARGET libgromacs APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libgromacs PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "C;CXX"
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/cm/shared/apps/cuda75/toolkit/7.5.18/lib64/libcudart.so;/cm/shared/apps/openmpi/gcc/64/1.10.1/lib64/libmpi.so;/usr/lib64/libz.so;rt;m;/usr/lib64/libfftw3f.so;/usr/lib64/libblas.so;/usr/lib64/liblapack.so;/usr/lib64/libblas.so;-lpthread;-fopenmp"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libgromacs.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS libgromacs )
list(APPEND _IMPORT_CHECK_FILES_FOR_libgromacs "${_IMPORT_PREFIX}/lib64/libgromacs.a" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
