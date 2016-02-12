cmake_minimum_required(VERSION 2.8.11)

SET(CMAKE_SYSTEM_NAME Generic)

include(arm-compiler.cmake)


Project(led-example C ASM)

include(arm-compiler.cmake)

add_subdirectory(src)
