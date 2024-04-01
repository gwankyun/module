# install.cmake
include(CMakePrintHelpers) # cmake_print_variables
# cmake_print_variables(CMAKE_CURRENT_BINARY_DIR)

file(GLOB_RECURSE ifc_src ${CMAKE_CURRENT_BINARY_DIR}/*.ixx.ifc)

set(ifc_dest ${CMAKE_CURRENT_BINARY_DIR}/ifc)

if(NOT EXISTS ${ifc_dest})
  file(MAKE_DIRECTORY ${ifc_dest})
endif()

foreach(item ${ifc_src})
  cmake_path(GET item EXTENSION LAST_ONLY last_ext) # src/m.ixx.ifc -> .ifc
  cmake_path(GET item STEM name_we)                 # src/m.ixx.ifc -> m
  set(newname ${ifc_dest}/${name_we}${last_ext})    # -> dest/m.ifc REMOVE
  file(COPY_FILE ${item} ${newname})                # src/m.ixx.ifc -> dest/m.ifc
endforeach()
