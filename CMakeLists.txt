cmake_minimum_required(VERSION 3.0)

# project name
project(baremetal)

# select linker script
set(LINKER_SCRIPT "ld/gd32e23x.ld")

# define CPU OPTIONS
set(CPU_OPTIONS -mthumb -mcpu=cortex-m23)

# optimizations (-O0 -O1 -O2 -O3 -Os -Ofast -Og -flto)
set(CMAKE_C_FLAGS_DEBUG "-Og -g")
set(CMAKE_CXX_FLAGS_DEBUG "-Og -g")
set(CMAKE_C_FLAGS_RELEASE "-O0 -flto -DGD32E230")
set(CMAKE_CXX_FLAGS_RELEASE "-O0 -flto -DGD32E230")

add_compile_options(
    ${CPU_OPTIONS}
    $<$<COMPILE_LANGUAGE:C>:-std=c11>
    $<$<COMPILE_LANGUAGE:CXX>:-std=c++17>
    $<$<COMPILE_LANGUAGE:CXX>:-fms-extensions>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-exceptions>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-rtti>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-use-cxa-atexit>
    $<$<COMPILE_LANGUAGE:CXX>:-fno-threadsafe-statics>
    -fstrict-volatile-bitfields
    -ffunction-sections
    -fno-threadsafe-statics

#    -Werror
    -Wall
    -Wextra
    -Wcast-align
    -Wconversion
    -Wsign-conversion
    -Wold-style-cast
    -Wshadow
    -Wlogical-op
    -Wsuggest-override
    -Wsuggest-final-types
    -Wsuggest-final-methods
    -pedantic
)

include_directories(
    ${CMAKE_SOURCE_DIR}
    src/
    src/GD32E23x_standard_peripheral/Include
    src/SYSTEM/GD/GD32E23x/Include
    src/CMSIS/Core/Include
)

link_directories(
    ${CMAKE_SOURCE_DIR}
)

file(GLOB SRC_STD_LIB 
    "src/GD32E23x_standard_peripheral/Source/*.c"
)

# list of modules to build final firmware
add_executable(${PROJECT_NAME}
    src/main.cpp
    src/systick.c
    src/gd32e23x_it.c
    src/startup/startup.cpp
    src/startup/stack.cpp
    src/startup/handlers_cm.cpp
    ${SRC_STD_LIB}
    src/SYSTEM/GD/GD32E23x/Source/system_gd32e23x.c
)

target_link_libraries(${PROJECT_NAME}
    ${CPU_OPTIONS}
    -T${LINKER_SCRIPT}
    -nostartfiles
    m
    # -nostdlib
)

set_property(TARGET ${PROJECT_NAME} PROPERTY LINK_DEPENDS ${CMAKE_SOURCE_DIR}/${LINKER_SCRIPT})

include("cmake/flash.cmake")
