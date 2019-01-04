IC_CONFIG                           = mt7697
BOARD_CONFIG                        = mt7697_hdk
MTK_FW_VERSION                      = mt7697_fw_
MTK_HAL_LOWPOWER_ENABLE             = n
MTK_BSPEXT_ENABLE                   = n
MTK_IPERF_ENABLE                    = n
MTK_PING_OUT_ENABLE                 = n
MTK_MINISUPP_ENABLE                 = y
MTK_WIFI_TGN_VERIFY_ENABLE          = n
MTK_MINICLI_ENABLE                  = n
MTK_CLI_TEST_MODE_ENABLE            = n
MTK_CLI_EXAMPLE_MODE_ENABLE         = n
MTK_SMTCN_ENABLE                    = n
MTK_BLE_SMTCN_ENABLE                = n
MTK_WIFI_WPS_ENABLE                 = n
MTK_WIFI_DIRECT_ENABLE              = n
MTK_WIFI_REPEATER_ENABLE            = n
MTK_WIFI_CONFIGURE_FREE_ENABLE      = n
MTK_WIFI_PROFILE_ENABLE             = n
MTK_WIFI_PRIVILEGE_ENABLE           = n
MTK_SINGLE_SKU_SUPPORT              = n
MTK_ANT_DIV_ENABLE                  = DMTK_DEBUG_LEVEL_NONE

MTK_AP_STA_MCC_ENABLE               = n

MTK_MBEDTLS_CONFIG_FILE             = config-mtk-basic.h
MTK_FOTA_ENABLE                     = n
MTK_FOTA_CLI_ENABLE                 = n
MTK_LED_ENABLE                      = n

# debug level: none, error, warning, and info
MTK_DEBUG_LEVEL                     = info
MTK_CLI_FORK_ENABLE                 = n
MTK_SEC_FLASH_SCRAMBLE_ENABLE       = n

# System service debug feature for internal use
MTK_SUPPORT_HEAP_DEBUG              = n
MTK_HEAP_SIZE_GUARD_ENABLE          = n
MTK_OS_CPU_UTILIZATION_ENABLE       = n
MTK_MULTI_SMART_CONFIG_ENABLE       = n
MTK_ALINK_ENABLE                    = n
MTK_HTTPCLIENT_SSL_ENABLE           = n

MTK_HCI_CONSOLE_MIX_ENABLE          = n
MTK_BLE_BQB_TEST_ENABLE             = n
MTK_BLE_CLI_ENABLE                  = n
MTK_BLE_BQB_CLI_ENABLE              = n
MTK_BLE_ONLY_ENABLE                 = n
MTK_BT_HFP_ENABLE                   = n
MTK_BT_SPP_ENABLE                   = n
MTK_BT_HID_ENABLE                   = n
MTK_NVDM_ENABLE                     = n

MTK_SECURE_BOOT_ENABLE              = n
MTK_HAL_DFS_ENABLE                  = y

MTK_SAVE_LOG_AND_CONTEXT_DUMP_ENABLE =n

# bt module enable
MTK_BT_ENABLE                       = n
MTK_BLE_ONLY_ENABLE                 = n
MTK_BT_HFP_ENABLE                   = n
MTK_BT_AVRCP_ENABLE                 = n
MTK_BT_AVRCP_ENH_ENABLE             = n
MTK_BT_A2DP_ENABLE                  = n
MTK_BT_PBAP_ENABLE                  = n
MTK_BT_SPP_ENABLE                   = n
MT76X7_E3_SUPPORT                   = n


PRODUCT_VERSION                     = 7697

#
# Disable MTK SDK log system
#

#C_FLAGS                            += -DMTK_DEBUG_LEVEL_NONE
C_FLAGS                            += -DMTK_HAL_PLAIN_LOG_ENABLE
