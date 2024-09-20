/*
    Usage:

    #include "\z\ace\addons\laserpointer\script_macros_config.hpp"

    class CfgWeapons {
        class My_AwesomePointer_base;
        class My_AwesomePointer: My_AwesomePointer_base {
            class ItemInfo {
                POINTER_VISIBLE_GREEN;
            };
        };
    };
*/

#define POINTER_VISIBLE_RED \
    class Pointer { \
        irLaserPos = "laser pos"; \
        irLaserEnd = "laser dir"; \
        irDistance = 5; \
        isIR = 0; \
        irDotSize = QUOTE(0.1/4); \
        beamThickness = 0; \
        beamMaxLength = 50; \
        dotColor[] = {16384, 0, 0}; \
        beamColor[] = {0, 0, 0}; \
    }
#define POINTER_VISIBLE_GREEN \
    class Pointer { \
        irLaserPos = "laser pos"; \
        irLaserEnd = "laser dir"; \
        irDistance = 5; \
        isIR = 0; \
        irDotSize = QUOTE(0.1/4); \
        beamThickness = 0; \
        beamMaxLength = 75; \
        dotColor[] = {0, 16384, 0}; \
        beamColor[] = {0, 0, 0}; \
    }
