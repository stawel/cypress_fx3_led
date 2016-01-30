
set(SRC cyfx_gcc_startup.S  defines.h  main.c)

set_source_files_properties(cyfx_gcc_startup.S PROPERTIES COMPILE_FLAGS "-x assembler-with-cpp")

add_executable(led ${SRC})
TARGET_LINK_LIBRARIES(led cyfx3boot c gcc)
