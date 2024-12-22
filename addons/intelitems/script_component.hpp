#define COMPONENT intelitems
#define COMPONENT_BEAUTIFIED Intel Items
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_INTELITEMS
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_INTELITEMS
    #define DEBUG_SETTINGS DEBUG_SETTINGS_INTELITEMS
#endif

#include "\z\ace\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineResincl.inc"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"

#define POS_X(N) ((N) * GUI_GRID_W + GUI_GRID_CENTER_X)
#define POS_Y(N) ((N) * GUI_GRID_H + GUI_GRID_CENTER_Y)
#define POS_W(N) ((N) * GUI_GRID_W)
#define POS_H(N) ((N) * GUI_GRID_H)

#define IDC_BORDER     10
#define IDC_BACKGROUND 20
#define IDC_HEADER     30
#define IDC_CLOSE      40
#define IDC_CONTENT    50

#define IDC_ATTRIBUTE_GROUP 4800
#define IDC_ATTRIBUTE_LABEL 4801
#define IDC_ATTRIBUTE_EDIT  4802

#define SYS_DATA(index)      (format [QGVAR(%1), index])
#define SET_DATA(index,data) (GVAR(intelData) setVariable [SYS_DATA(index), data, true])
#define GET_DATA(index)      (GVAR(intelData) getVariable [SYS_DATA(index), ""])
