#define COMPONENT particles
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_PARTICLES
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_PARTICLES
    #define DEBUG_SETTINGS DEBUG_SETTINGS_PARTICLES
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#define SMOKE_COLOR_RED    {0.9528, 0.0438, 0.0410, 0.8}
#define SMOKE_COLOR_GREEN  {0.0328, 0.1626, 0.1023, 0.8}
#define SMOKE_COLOR_YELLOW {0.9610, 0.4505, 0.0109, 0.8}
#define SMOKE_COLOR_PURPLE {0.4622, 0.0578, 0.3154, 0.8}
#define SMOKE_COLOR_BLUE   {0.0355, 0.1863, 1.0000, 0.8}
#define SMOKE_COLOR_ORANGE {0.9132, 0.1763, 0.0070, 0.8}

#define EFFECT_HANDGRENADE(color) class SmokeShell##color##Effect: SmokeShellWhiteEffect { \
    class SmokeShell: SmokeShell { \
        type = "ACE_SmokeBaseMedium"; \
    }; \
}
#define EFFECT_40MM(color) class ACE_40mmSmokeShell##color##Effect: ACE_40mmSmokeShellWhiteEffect { \
    class SmokeShellUW { \
        simulation = "particles"; \
        type = QUOTE(SmokeShell##color##UW); \
        position[] = {0, 0, 0}; \
        intensity = 1; \
        interval = 1; \
    }; \
    class SmokeShell2UW { \
        simulation = "particles"; \
        type = QUOTE(SmokeShell##color##2UW); \
        position[] = {0, 0, 0}; \
        intensity = 1; \
        interval = 1; \
    }; \
}
#define EFFECT_AFTER_WATER(color) class ACE_SmokeAfterWater##color: ACE_SmokeAfterWaterWhite { \
    class SmokeAfterWater: SmokeAfterWater { \
        type = QUOTE(ACE_SmokeAfterWater##color); \
    }; \
}

#define CLOUDLET_UNDERWATER(color) class SmokeShell##color##UW; \
class SmokeShell##color##2UW: SmokeShell##color##UW { \
    postEffects = QUOTE(ACE_SmokeAfterWater##color); \
}
