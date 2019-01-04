cmake_minimum_required(VERSION 3.13)

set(mt7697hx-dev-kit_dir "${AFR_3RDPARTY_DIR}/mcu_vendor/mediatek/mt7697hx-dev-kit")
set(board_demos_dir "${AFR_ROOT_DIR}/demos/mediatek/mt7697hx-dev-kit/common")
set(board_tests_dir "${AFR_ROOT_DIR}/tests/mediatek/mt7697hx-dev-kit/common")
if(AFR_IS_TESTING)
    set(board_dir "${board_tests_dir}")
else()
    set(board_dir "${board_demos_dir}")
endif()

# -------------------------------------------------------------------------------------------------
# Amazon FreeRTOS Console metadata
# -------------------------------------------------------------------------------------------------
afr_set_board_metadata(NAME "MT7697Hx-Dev-Kit")
afr_set_board_metadata(DISPLAY_NAME "MT7697Hx-Dev-Kit")
afr_set_board_metadata(DESCRIPTION "Development kit for USI MT7697Hx")
afr_set_board_metadata(VENDOR_NAME "MediaTek")
afr_set_board_metadata(FAMILY_NAME "MT7697Hx")
afr_set_board_metadata(DATA_RAM_MEMORY "352KB")
afr_set_board_metadata(PROGRAM_MEMORY "4MB")
afr_set_board_metadata(CODE_SIGNER "AmazonFreeRTOS-Default")
afr_set_board_metadata(SUPPORTED_IDE "Keil uVision")
afr_set_board_metadata(IDE_SystemWorkbench_NAME "Keil uVision")
afr_set_board_metadata(IDE_SystemWorkbench_COMPILERS "ARMCC")

# -------------------------------------------------------------------------------------------------
# Compiler settings
# -------------------------------------------------------------------------------------------------
afr_mcu_port(compiler)
target_sources(
    AFR::compiler::mcu_port
    INTERFACE 
        "${board_dir}/../gnu/startup_mt7687.s"
        "${board_dir}/../gnu/syscalls.c"
)
set(
    defined_symbols
    _REENT_SMALL
    PCFG_OS=2
    MTK_MINISUPP_ENABLE
    MTK_DEBUG_LEVEL=info
    PRODUCT_VERSION=7697
    MTK_HAL_PLAIN_LOG_ENABLE
    DMTK_WIFI_OS_MM_OPTION=1
    DUNITY_INCLUDE_CONFIG_H
    DAMAZON_FREERTOS_ENABLE_UNIT_TESTS
)
target_compile_definitions(
    AFR::compiler::mcu_port
    INTERFACE $<$<NOT:$<COMPILE_LANGUAGE:ASM>>:${defined_symbols}>
)

set(cpu_flags "-mlittle-endian" "-mthumb" "-mcpu=cortex-m4")
set(fpu_flags "-fsingle-precision-constant" "-Wdouble-promotion" "-mfpu=fpv4-sp-d16" "-mfloat-abi=hard")
set(c_flags1 "-gdwarf-2" "-Os" "-Wall" "-fno-strict-aliasing" "-fno-common")
set(c_flags2 "-Wimplicit-function-declaration" "-Werror=uninitialized" "-Wno-error=maybe-uninitialized" "-Werror=return-type")
set(c_flags3 "-DPCFG_OS=2" "-D_REENT_SMALL" "-Wno-error" "-Wno-switch" "-std=c99")
set(c_flags ${c_flags1} ${c_flags2} ${c_flags3} "-Wall" "-fmessage-length=0" "-ffunction-sections" "-fdata-sections" "-fno-builtin" "-Wimplicit-function-declaration")
set(linker_flags "--specs=nano.specs" "-lnosys" "-nostartfiles" "-Wl,-wrap=malloc" "-Wl,-wrap=calloc" "-Wl,-wrap=realloc" "-Wl,-wrap=free" "-Xlinker" "-Map=aws_tests.map" )

# Compiler flags
target_compile_options(
    AFR::compiler::mcu_port
    INTERFACE
        ${cpu_flags}
        ${fpu_flags}
        ${c_flags}
)

# Linker flags
target_link_options(
    AFR::compiler::mcu_port
    INTERFACE ${cpu_flags} ${fpu_flags} ${linker_flags}
)


# -------------------------------------------------------------------------------------------------
# Amazon FreeRTOS portable layers
# -------------------------------------------------------------------------------------------------
set(vendor "mediatek")
set(board "mt7697hx-dev-kit")
set(portable_dir "portable/${vendor}/${board}")
set(portable_vendor_dir "portable/${vendor}")

# Kernel
afr_mcu_port(kernel)
afr_glob_src(driver_src DIRECTORY "${mt7697hx-dev-kit_dir}" RECURSE)
list(FILTER driver_src EXCLUDE REGEX "/minicli*")
list(FILTER driver_src EXCLUDE REGEX "/RVDS*")
list(FILTER driver_src EXCLUDE REGEX "wrap_heap_xxx*")
message(${driver_src})

target_sources(
    AFR::kernel::mcu_port
    INTERFACE
        ${driver_src}
        "${AFR_MODULES_DIR}/FreeRTOS/portable/GCC/ARM_CM4F/portmacro.h"
)

set(
    kernel_inc_dirs
    "${AFR_MODULES_DIR}/FreeRTOS/portable/GCC/ARM_CM4F"
    "${AFR_MODULES_DIR}/third_party/lwip/src/include"
    "${AFR_MODULES_DIR}/third_party/lwip/src/include/lwip"
    "${AFR_MODULES_DIR}/third_party/lwip/src/include/netif"
    "${AFR_MODULES_DIR}/lwip/portable"
    "${AFR_MODULES_DIR}/lwip/portable/mediatek/include"
    "${mt7697hx-dev-kit_dir}/driver/chip/inc"
    "${mt7697hx-dev-kit_dir}/driver/chip/mt7687/inc"
    "${mt7697hx-dev-kit_dir}/driver/chip/mt7687/src/common/include"
    "${mt7697hx-dev-kit_dir}/driver/chip/mt7687/src/sdio_gen3/include"
    "${mt7697hx-dev-kit_dir}/driver/CMSIS/Include"
    "${mt7697hx-dev-kit_dir}/driver/CMSIS/Device/MTK/mt7687/Include"
    "${mt7697hx-dev-kit_dir}/driver/board/mt76x7_hdk/external_flash/inc"
    "${mt7697hx-dev-kit_dir}/driver/board/mt76x7_hdk/wifi/inc"
    "${mt7697hx-dev-kit_dir}/driver/board/mt76x7_hdk/util/inc"
    "${mt7697hx-dev-kit_dir}/driver/board/mt76x7_hdk/ept/inc"
    "${mt7697hx-dev-kit_dir}/kernel/service/inc"
    "${mt7697hx-dev-kit_dir}/kernel/extend/inc"
    "${mt7697hx-dev-kit_dir}/middleware/MTK/minisupp/inc"
    #"${mt7697hx-dev-kit_dir}/middleware/MTK/minisupp/src/wpa_supplicant_8.jb4_1/src"
    #"${mt7697hx-dev-kit_dir}/middleware/MTK/minisupp/src/wpa_supplicant_8.jb4_1/src/drivers"
    #"${mt7697hx-dev-kit_dir}/middleware/MTK/minisupp/src/wpa_supplicant_8.jb4_1/src/utils"
    "${mt7697hx-dev-kit_dir}/middleware/MTK/dhcpd/inc"
    "${mt7697hx-dev-kit_dir}/middleware/third_party/ping/inc"
    "${mt7697hx-dev-kit_dir}/middleware/MTK/minisupp/inc"
    "${board_dir}/config_files"
    "${board_dir}/application_code"
    "${board_dir}/application_code/mediatek_code/include"
    "$<IF:${AFR_IS_TESTING},${AFR_TESTS_DIR},${AFR_DEMOS_DIR}>/include"
)
target_include_directories(
    AFR::kernel::mcu_port
    INTERFACE $<$<NOT:$<COMPILE_LANGUAGE:ASM>>:${kernel_inc_dirs}>
)
target_link_libraries(
    AFR::kernel::mcu_port
    INTERFACE 
    "${mt7697hx-dev-kit_dir}/prebuilt/gcc/libhal_core_CM4_GCC.a"
    "${mt7697hx-dev-kit_dir}/prebuilt/gcc/libhal_protected_CM4_GCC.a"
    "${mt7697hx-dev-kit_dir}/prebuilt/gcc/libminisupp_CM4_GCC.a"
    "${mt7697hx-dev-kit_dir}/prebuilt/gcc/libwifi_CM4_GCC.a"
    AFR::lwip 
    3rdparty::tracealyzer
)

# lwIP
afr_mcu_port(lwip)
target_sources(
    AFR::lwip::mcu_port
    INTERFACE "${AFR_MODULES_DIR}/lwip/${portable_vendor_dir}/netif/ethernetif.c"
)
target_include_directories(
    AFR::lwip::mcu_port
    INTERFACE "${AFR_MODULES_DIR}/lwip/${portable_vendor_dir}/include"
)
target_link_libraries(
    AFR::lwip::mcu_port
    INTERFACE AFR::lwip
)

# WiFi
afr_mcu_port(wifi)
target_sources(
    AFR::wifi::mcu_port
    INTERFACE "${AFR_MODULES_DIR}/wifi/${portable_dir}/aws_wifi.c"
)
target_link_libraries(
    AFR::wifi::mcu_port
    INTERFACE AFR::lwip::mcu_port
)

# PKCS11
afr_mcu_port(pkcs11)
target_sources(
    AFR::pkcs11::mcu_port
    INTERFACE "${AFR_MODULES_DIR}/pkcs11/${portable_dir}/aws_pkcs11_pal.c"
)
# Link to AFR::pkcs11_mbedtls if you want to use default implementation based on mbedtls.
target_link_libraries(
    AFR::pkcs11::mcu_port
    INTERFACE AFR::pkcs11_mbedtls
)

# Secure sockets
afr_mcu_port(secure_sockets)
target_link_libraries(
    AFR::secure_sockets::mcu_port
    INTERFACE 
        AFR::secure_sockets_lwip
        AFR::lwip::mcu_port
)



# -------------------------------------------------------------------------------------------------
# Amazon FreeRTOS demos and tests
# -------------------------------------------------------------------------------------------------
set(CMAKE_EXECUTABLE_SUFFIX ".elf")
if(AFR_IS_TESTING)
    set(exe_target aws_tests)
else()
    set(exe_target aws_demos)
endif()

afr_glob_src(board_code_src DIRECTORY "${board_dir}/application_code/mediatek_code/source")
list(FILTER board_code_src EXCLUDE REGEX "/cli.c")

add_executable(
    ${exe_target}
    ${board_code_src}
    "${board_dir}/application_code/main.c"
)
target_link_libraries(
    ${exe_target}
    PRIVATE
        AFR::wifi
        AFR::utils
        -T"${board_dir}/../gnu/mt7687_flash.ld"
)

find_program(gcc_objcopy arm-none-eabi-objcopy)
find_program(gcc_size arm-none-eabi-size)
if(NOT gcc_objcopy)
    message(FATAL_ERROR "Cannot find arm-none-eabi-objcopy.")
endif()

set(output_file "$<TARGET_FILE_DIR:${exe_target}>/${exe_target}.bin")
add_custom_command(
    TARGET ${exe_target} POST_BUILD
    COMMAND "${gcc_objcopy}" -O binary "$<TARGET_FILE:${exe_target}>" "${output_file}"
    COMMAND "${gcc_size}" "$<TARGET_FILE:${exe_target}>"
)
