afr_module(lwip KERNEL)

afr_module_sources(
    lwip
    PRIVATE
        "${AFR_MODULES_DIR}/lwip/portable/arch/cc.h"
        "${AFR_MODULES_DIR}/lwip/portable/arch/lwipopts_freertos.h"
        "${AFR_MODULES_DIR}/lwip/portable/arch/sys_arch.h"
        "${AFR_MODULES_DIR}/lwip/portable/arch/sys_arch.c"
)

afr_module_include_dirs(
    lwip
    PUBLIC
        "${AFR_MODULES_DIR}/lwip/portable"
        "${AFR_MODULES_DIR}/include"
        "${AFR_MODULES_DIR}/include/private"
        $<TARGET_PROPERTY:AFR::kernel::mcu_port,INTERFACE_INCLUDE_DIRECTORIES>
        $<${AFR_IS_TESTING}:${AFR_3RDPARTY_DIR}/unity/src>
)

afr_module_dependencies(
    lwip
    PRIVATE
        3rdparty::lwip
        AFR::compiler::mcu_port
)