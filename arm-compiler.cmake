
#set(TOOLCHAIN arm-elf)
#please see for ubuntu: https://launchpad.net/~terry.guo/+archive/ubuntu/gcc-arm-embedded
set(TOOLCHAIN arm-none-eabi)
#set(TOOLCHAIN arm-linux-gnueabi)

SET(CMAKE_C_COMPILER ${TOOLCHAIN}-gcc)
SET(CMAKE_CXX_COMPILER ${TOOLCHAIN}-g++)

#cmake compiler test bypass
INCLUDE(CMakeForceCompiler)
CMAKE_FORCE_C_COMPILER(${CMAKE_C_COMPILER} GNU)
CMAKE_FORCE_CXX_COMPILER(${CMAKE_CXX_COMPILER} GNU)

#eclipse:
#arm-none-eabi-gcc -mcpu=arm926ej-s -marm -mthumb-interwork -O0 -fmessage-length=0 
# -fsigned-char -ffunction-sections -fdata-sections -Wall  
# -g3 -I"/home/stawel/Cypress/cyfx3sdk/boot_lib/1_3_3/include" -std=gnu11 -MMD -MP -MF"main.d" -MT"main.o" -c -o "main.o" "../main.c"


SET(CTUNING "-fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections")
SET(CPU_FLAGS "-mcpu=arm926ej-s -marm -mthumb-interwork")
SET(OTHER_FLAGS "-O0 -Wall -g3")

SET(CFLAGS "${CPU_FLAGS}  ${CTUNING} ${OTHER_FLAGS} -std=c11")
SET(CXXFLAGS "${CPU_FLAGS}  ${CTUNING} ${OTHER_FLAGS} -fno-rtti -fno-exceptions -std=c++11")
SET(CMAKE_C_FLAGS   "${CMAKE_C_FLAGS}   ${CFLAGS}   -ffunction-sections -fdata-sections")
SET(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${CXXFLAGS} -ffunction-sections -fdata-sections")

#TODO: remove CoIDE dependency
set(CMAKE_EXE_LINKER_FLAGS "-Wl,--gc-sections -Wl,-T${CMAKE_SOURCE_DIR}/CoIDE/arm-gcc-link.ld")