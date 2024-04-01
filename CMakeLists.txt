# CMakeLists.txt
cmake_minimum_required(VERSION 3.29)

set(project module)
project(${project})

include(CMakePrintHelpers) # cmake_print_variables
# cmake_print_variables(CMAKE_CURRENT_SOURCE_DIR)
# cmake_print_variables(CMAKE_CURRENT_BINARY_DIR)

set(msvc_options)
list(APPEND msvc_options
  "/W4" "/MP" "/Zc:__cplusplus" "/experimental:module"
  "/ifcSearchDir\"${CMAKE_CURRENT_SOURCE_DIR}/build/ifc\""
  )

add_compile_options("$<$<CXX_COMPILER_ID:MSVC>:${msvc_options}>")

set(main main)
add_executable(${main})
target_sources(${main}
  PRIVATE
    src/main.cpp
    src/a.cpp
  PRIVATE FILE_SET CXX_MODULES FILES
    src/main.ixx
    src/a.ixx
    )
target_compile_features(${main} PRIVATE cxx_std_23)

install(SCRIPT install.cmake)

# add_custom_command(
#   TARGET ${main}
#   POST_BUILD COMMAND
#     ${CMAKE_COMMAND} --install ${CMAKE_BINARY_DIR} --config $<CONFIG>
#     )
