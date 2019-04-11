set(wicedsdk_dir "${AFR_3RDPARTY_DIR}/mcu_vendor/cypress/WICED_SDK")
set(board_demos_dir "${AFR_ROOT_DIR}/demos/cypress/CYW943907AEVAL1F/common")
set(board_tests_dir "${AFR_ROOT_DIR}/tests/cypress/CYW943907AEVAL1F/common")
if(AFR_IS_TESTING)
    set(board_dir "${board_tests_dir}")
else()
    set(board_dir "${board_demos_dir}")
endif()

# -------------------------------------------------------------------------------------------------
# Amazon FreeRTOS Console metadata
# -------------------------------------------------------------------------------------------------
afr_set_board_metadata(ID "CYW943907AEVAL1F")
afr_set_board_metadata(DISPLAY_NAME "Cypress CYW943907AEVAL1F Development Kit")
afr_set_board_metadata(DESCRIPTION "The Cypress CYW943907AEVAL1F Evaluation Kit")
afr_set_board_metadata(VENDOR_NAME "Cypress")
afr_set_board_metadata(FAMILY_NAME "CYW43907")
afr_set_board_metadata(IS_ACTIVE "TRUE")
afr_set_board_metadata(DATA_RAM_MEMORY "640KB")
afr_set_board_metadata(PROGRAM_MEMORY "2MB")
afr_set_board_metadata(CODE_SIGNER "AmazonFreeRTOS-Default")
afr_set_board_metadata(SUPPORTED_IDE "WICED-Studio6.2.1")
afr_set_board_metadata(RECOMMENDED_IDE "WICED-Studio6.2.1")
afr_set_board_metadata(IDE_WicedStudio_NAME "WICED Studio by Cypress")
afr_set_board_metadata(IDE_WicedStudio_COMPILER "GCC")
afr_set_board_metadata(IDE_WicedStudio_RECOMMENDED "TRUE")

afr_set_board_metadata(IDE_WicedStudio_PROJECT_LOCATION "${AFR_ROOT_DIR}/demos/cypress/CYW943907AEVAL1F/wicedstudio")
afr_set_board_metadata(DEMO_COMMON_LOCATION "${AFR_ROOT_DIR}/demos/cypress/CYW943907AEVAL1F/common")
afr_set_board_metadata(THIRD_PARTY_LIB_LOCATION "${AFR_ROOT_DIR}/lib/third_party/mcu_vendor/cypress")

# -------------------------------------------------------------------------------------------------
# Compiler settings
# -------------------------------------------------------------------------------------------------
afr_mcu_port(compiler)

# Compile definitions/macros
target_compile_definitions(
     AFR::compiler::mcu_port
     INTERFACE AmazonFreeRTOS
)

# Compiler flags
# target_compile_options(
#     AFR::compiler::mcu_port
#     INTERFACE
#         -std=c11
# )
set(
    defined_symbols
    SFLASH_APPS_HEADER_LOC=0x00010000 
    PLATFORM_NO_DDR=1 
    PLATFORM_NO_GMAC=1 
    OTP_WORD_NUM_SHA_KEY=258 
    OTP_WORD_NUM_SHA_KEY_R=242 
    OTP_WORD_NUM_AES_KEY=282 
    OTP_WORD_NUM_AES_KEY_R=274 
    SECUREBOOT_SHA_KEY_SIZE=32 
    GSIO_I2C_REPEATED_START_NEEDS_GPIO=1 
    PLATFORM_HIB_WAKE_CTRL_FREQ_BITS_FLIPPED 
    CRLF_STDIO_REPLACEMENT 
    WICED_DISABLE_CONFIG_TLS 
    PLATFORM_SECURESFLASH_ENABLED=0 
    PLATFORM_SECUREDCT_ENABLED=0 
    NORMAL_IMAGE_DCT_1_AREA_BASE=0x00008000 
    MIN_WM8533_DB_LEVEL=-53.0 
    MAX_WM8533_DB_LEVEL=6.0 
    PLATFORM_ALP_CLOCK_RES_FIXUP=0 
    MAX_WATCHDOG_TIMEOUT_SECONDS=22 
    MAX_WAKE_FROM_SLEEP_DELAY_TICKS=500 
    PLATFORM_L1_CACHE_SHIFT=5 
    PLATFORM_SUPPORTS_LOW_POWER_MODES
    BCM43909 
    ENABLE_ARM_DSP_INSTRUCTIONS
    PLAT_NOTIFY_FREE
    USING_WICEDFS
    wifi_firmware_image=resources_firmware_DIR_43909_DIR_43909B0_bin
    WWD_STARTUP_DELAY=10
    BOOTLOADER_MAGIC_NUMBER=0x4d435242
    NETWORK_LwIP=1 
    LwIP_VERSION=\"v2.0.3\"
    RTOS_FreeRTOS=1 
    configUSE_MUTEXES 
    configUSE_RECURSIVE_MUTEXES 
    FreeRTOS_VERSION=\"v10.0.0\" 
    SFLASH_SUPPORT_MACRONIX_PARTS 
    USING_EXTERNAL_ADC 
    WICED_AMAZON_FREERTOS_SDK 
    WICED_SDK_WIFI_CONFIG_DCT_H=\"./include/default_wifi_config_dct.h\"
    WICED_SDK_BT_CONFIG_DCT_H=\"./include/default_bt_config_dct.h\" 
)

set(
    kernel_inc_dirs
    "${wicedsdk_dir}/WICED/platform/MCU/BCM4390x/peripherals/spi_flash"
    "${wicedsdk_dir}/libraries/utilities/ring_buffer 
    "${wicedsdk_dir}/WICED/platform/GCC/" 
    "${wicedsdk_dir}/libraries/utilities/crc/."
    "${wicedsdk_dir}/libraries/utilities/TLV/."
    "${wicedsdk_dir}/WICED/network/LwIP/WWD/FreeRTOS/."
    "${wicedsdk_dir}/WICED/platform/MCU/BCM4390x/."
    "${wicedsdk_dir}/WICED/platform/MCU/."
    "${wicedsdk_dir}/WICED/platform/ARM_CR4"
    "${wicedsdk_dir}/WICED/platform/MCU/BCM4390x/WAF"
    "${wicedsdk_dir}/WICED/platform/MCU/BCM4390x/peripherals"
    "${wicedsdk_dir}/WICED/platform/MCU/BCM4390x/peripherals/include"
    "${wicedsdk_dir}/WICED/platform/MCU/BCM4390x/peripherals/tlsf"
    "${wicedsdk_dir}/WICED/platform/MCU/BCM4390x/./Library/drivers/spi_flash" 
    "${wicedsdk_dir}/WICED/platform/MCU/BCM4390x/./platforms/CYW943907AEVAL1F"
    "${wicedsdk_dir}/WICED/platform/MCU/BCM4390x/./platforms/CYW943907AEVAL1F/" 
    "${wicedsdk_dir}/WICED/platform/include"
    "${wicedsdk_dir}/WICED/platform/MCU/BCM4390x/./libraries/bluetooth/include"
    "${wicedsdk_dir}/libraries/filesystems/wicedfs/src"
    "${wicedsdk_dir}/WICED/WWD/"
    "${wicedsdk_dir}/WICED/WWD/include" 
    "${wicedsdk_dir}/WICED/WWD/include/network" 
    "${wicedsdk_dir}/WICED/WWD/include/RTOS"
    "${wicedsdk_dir}/WICED/WWD/internal/bus_protocols/SoC/43909"
    "${wicedsdk_dir}/WICED/WWD/internal/chips/4390x" 
    "${wicedsdk_dir}/libraries/utilities/linked_list" 
    "${wicedsdk_dir}/WICED/RTOS/FreeRTOS/WICED" 
    "${wicedsdk_dir}/WICED/network/LwIP/WICED/."
    "${wicedsdk_dir}/WICED/network/LwIP/WWD/." 
    "${wicedsdk_dir}/WICED/RTOS/FreeRTOS/WICED/."
    "${wicedsdk_dir}/WICED/RTOS/FreeRTOS/WWD/."
    "${wicedsdk_dir}/WICED/RTOS/FreeRTOS/WWD/./CYW943907AEVAL1F"
    "${wicedsdk_dir}/WICED/RTOS/FreeRTOS/WWD/./ARM_CR4"
    "${wicedsdk_dir}/libraries/utilities/wifi/."
    "${wicedsdk_dir}/WICED/."
    "${wicedsdk_dir}/WICED/platform/include"
    "${wicedsdk_dir}/WICED/platform/include"
    "${wicedsdk_dir}/WICED/libraries/test/wl_tool/43909B0/include"
    "${wicedsdk_dir}/libraries/utilities/wifi"
    "${wicedsdk_dir}/WICED/network/LwIP/WICED"
    "${wicedsdk_dir}/platforms/CYW943907AEVAL1F/."
    "${wicedsdk_dir}/platforms/CYW943907AEVAL1F/./board_revision/P103"
    "${AFR_3RDPARTY_DIR}/jsmn"
    "${AFR_3RDPARTY_DIR}/pkcs11"
    "${AFR_3RDPARTY_DIR}/lwip/src/include"
    "${AFR_3RDPARTY_DIR}/lwip/src/include/lwip"
    "${AFR_3RDPARTY_DIR}/lwip/src/portable"
    "${AFR_3RDPARTY_DIR}/lwip/src/portable/cypress/CYW943907AEVAL1F"
    "${AFR_3RDPARTY_DIR}/lwip/src/portable/cypress/CYW943907AEVAL1F/include"
    "${AFR_3RDPARTY_DIR}/lwip/src/portable/cypress/arch"
    "${AFR_3RDPARTY_DIR}/mbedtls/include"
    "${board_dir}/application_code/cypress_code/include"
    "${board_dir}/config_files"
    "${AFR_ROOT_DIR}/demos/common/include"
    "${AFR_ROOT_DIR}/lib/include"
    "${AFR_ROOT_DIR}/lib/include/private"
)

# Global include directories
target_include_directories(
    AFR::compiler::mcu_port
    INTERFACE
        ${kernel_inc_dirs}
)

# Linker flags
# target_link_options(
#     AFR::compiler::mcu_port
#     INTERFACE
#         -mcpu=cortex-m4
# )

# Library search path for linker
# target_link_directories(
#     AFR::compiler::mcu_port
#     INTERFACE
#         "<lib_path_0>"
#         "<lib_path_1>"
# )

# Libraries to link
# target_link_libraries(
#     AFR::compiler::mcu_port
#     INTERFACE
#         "foo.a"
#         "/full/path/bar.a"
# )

# -------------------------------------------------------------------------------------------------
# Amazon FreeRTOS portable layers
# -------------------------------------------------------------------------------------------------
set(vendor "cypress")
set(board "CYW943907AEVAL1F")
set(portable_dir "portable/${vendor}/${board}")


# WiFi
afr_mcu_port(wifi)
target_sources(
    AFR::wifi::mcu_port
    INTERFACE "${AFR_MODULES_DIR}/wifi/${portable_dir}/aws_wifi.c"
)

# PKCS11
afr_mcu_port(pkcs11)
target_sources(
    AFR::pkcs11::mcu_port
    INTERFACE 
        "${AFR_MODULES_DIR}/pkcs11/${portable_dir}/aws_pkcs11_pal.c"
        "${AFR_MODULES_DIR}/pkcs11/${portable_dir}/hw_poll.c"
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
    INTERFACE AFR::tls
)
target_sources(
    AFR::secure_sockets::mcu_port
    INTERFACE "${AFR_MODULES_DIR}/secure_sockets/portable/lwip/aws_secure_sockets.c"
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

afr_glob_src(board_code_src DIRECTORY "${board_dir}/application_code/st_code")
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
        -T"${board_dir}/../ac6/STM32L475VGTx_FLASH.ld"
)

if(AFR_NON_BUILD_MODE)
    return()
endif()

# -------------------------------------------------------------------------------------------------
# Additional build configurations
# -------------------------------------------------------------------------------------------------

find_program(gcc_objcopy arm-none-eabi-objcopy)
find_program(gcc_size arm-none-eabi-size)
if(NOT gcc_objcopy)
    message(FATAL_ERROR "Cannot find arm-none-eabi-objcopy.")
endif()

set(output_file "$<TARGET_FILE_DIR:${exe_target}>/${exe_target}.hex")
add_custom_command(
    TARGET ${exe_target} POST_BUILD
    COMMAND "${gcc_objcopy}" -O ihex "$<TARGET_FILE:${exe_target}>" "${output_file}"
    COMMAND "${gcc_size}" "$<TARGET_FILE:${exe_target}>"
)
add_custom_command(
    TARGET ${exe_target} POST_BUILD
    COMMAND "${CMAKE_COMMAND}" -E copy "${output_file}" "${CMAKE_BINARY_DIR}"
)