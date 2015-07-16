#define COMPONENT spectator
#include "\z\ace\addons\main\script_mod.hpp"

#ifdef DEBUG_ENABLED_SPECTATOR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SPECTATOR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SPECTATOR
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// Interface grid
#define SIZEX ((safezoneW / safezoneH) min 1.2)
#define SIZEY (SIZEX / 1.2)
#define W_PART(num) (num * (SIZEX / 40))
#define H_PART(num) (num * (SIZEY / 25))
#define X_PART(num) (W_PART(num) + (safezoneX + (safezoneW - SIZEX)/2))
#define Y_PART(num) (H_PART(num) + (safezoneY + (safezoneH - SIZEY)/2))

// Interface tools
#define TOOL_H H_PART(1)
#define TOOL_W W_PART(5)
#define MARGIN TOOL_W * 0.05

// Interface compass
#define COMPASS_W (TOOL_W * 4)
#define COMPASS_X (safeZoneW * 0.5 - (COMPASS_W * 0.5))

// IDCs
#define IDC_TOOL 3000
#define IDC_COMP 4490
#define IDC_TREE 6187
#define IDC_MAP 6791
#define IDC_HELP 7631

#define IDC_TOOL_CLOCK 3003
#define IDC_TOOL_FOCUS 3004
#define IDC_TOOL_FOV 3005
#define IDC_TOOL_NAME 3001
#define IDC_TOOL_SPEED 3006
#define IDC_TOOL_VIEW 3002

#define IDC_COMP_0 5000
#define IDC_COMP_90 5090
#define IDC_COMP_180 5180
#define IDC_COMP_270 5270
