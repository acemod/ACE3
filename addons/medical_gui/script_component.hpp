#define COMPONENT medical_gui
#define COMPONENT_BEAUTIFIED Medical GUI
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_MEDICAL_GUI
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_MEDICAL_GUI
    #define DEBUG_SETTINGS DEBUG_SETTINGS_MEDICAL_GUI
#endif

#include "\z\ace\addons\medical_engine\script_macros_medical.hpp"
#include "\z\ace\addons\main\script_macros.hpp"

#include "\a3\ui_f\hpp\defineResincl.inc"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineCommonColors.inc"

#define POS_X(N) ((N) * GUI_GRID_W + GUI_GRID_CENTER_X)
#define POS_Y(N) ((N) * GUI_GRID_H + GUI_GRID_CENTER_Y)
#define POS_W(N) ((N) * GUI_GRID_W)
#define POS_H(N) ((N) * GUI_GRID_H)

#define IDD_MEDICAL_MENU 38580

#define IDC_TITLE 1200
#define IDC_TRIAGE 1300
#define IDC_EXAMINE 1310
#define IDC_BANDAGE 1320
#define IDC_MEDICATION 1330
#define IDC_AIRWAY 1340
#define IDC_ADVANCED 1350
#define IDC_DRAG 1360
#define IDC_TOGGLE 1370

#define IDC_TRIAGE_CARD 1400
#define IDC_INJURIES 1410
#define IDC_ACTIVITY 1420
#define IDC_QUICKVIEW 1430

#define IDC_ACTION_1 1500
#define IDC_ACTION_2 1510
#define IDC_ACTION_3 1520
#define IDC_ACTION_4 1530
#define IDC_ACTION_5 1540
#define IDC_ACTION_6 1550
#define IDC_ACTION_7 1560
#define IDC_ACTION_8 1570
#define IDC_ACTION_9 1580

#define IDCS_ACTION_BUTTONS [IDC_ACTION_1, IDC_ACTION_2, IDC_ACTION_3, IDC_ACTION_4, IDC_ACTION_5, IDC_ACTION_6, IDC_ACTION_7, IDC_ACTION_8, IDC_ACTION_9]

#define IDC_BODY_GROUP      6000
#define IDC_BODY_HEAD       6005
#define IDC_BODY_TORSO      6010
#define IDC_BODY_ARMLEFT    6015
#define IDC_BODY_ARMRIGHT   6020
#define IDC_BODY_LEGLEFT    6025
#define IDC_BODY_LEGRIGHT   6030
#define IDC_BODY_ARMLEFT_T  6035
#define IDC_BODY_ARMRIGHT_T 6040
#define IDC_BODY_LEGLEFT_T  6045
#define IDC_BODY_LEGRIGHT_T 6050
#define IDC_BODY_ARMLEFT_B  6055
#define IDC_BODY_ARMRIGHT_B 6060
#define IDC_BODY_LEGLEFT_B  6065
#define IDC_BODY_LEGRIGHT_B 6070

#define IDC_TRIAGE_STATUS 7000
#define IDC_TRIAGE_SELECT 7100
