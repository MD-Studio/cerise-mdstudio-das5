#----------------------------------------------------------------
# Generated CMake target import file for configuration "Release".
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "libgromacs" for configuration "Release"
set_property(TARGET libgromacs APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(libgromacs PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "/cm/shared/apps/cuda90/toolkit/9.0.176/lib64/libcudart.so;/cm/shared/apps/cuda90/toolkit/9.0.176/lib64/stubs/libnvidia-ml.so;/cm/shared/apps/openmpi/gcc/64/1.8.1/lib64/libmpi.so;/usr/lib64/libz.so;dl;rt;m;gmxfftw;/usr/lib64/libblas.so;/usr/lib64/liblapack.so;/usr/lib64/libblas.so;-lpthread;-fopenmp"
  IMPORTED_LOCATION_RELEASE "${_IMPORT_PREFIX}/lib64/libgromacs_mpi.so.2.4.0"
  IMPORTED_SONAME_RELEASE "libgromacs_mpi.so.2"
  )

list(APPEND _IMPORT_CHECK_TARGETS libgromacs )
list(APPEND _IMPORT_CHECK_FILES_FOR_libgromacs "${_IMPORT_PREFIX}/lib64/libgromacs_mpi.so.2.4.0" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
