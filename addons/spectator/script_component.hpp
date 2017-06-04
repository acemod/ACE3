#define COMPONENT spectator
#define COMPONENT_BEAUTIFIED Spectator
#include "\z\ace\addons\main\script_mod.hpp"

// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#ifdef DEBUG_ENABLED_SPECTATOR
    #define DEBUG_MODE_FULL
#endif

#ifdef DEBUG_SETTINGS_SPECTATOR
    #define DEBUG_SETTINGS DEBUG_SETTINGS_SPECTATOR
#endif

#include "\z\ace\addons\main\script_macros.hpp"

// UI grid
#define SIZEX ((safezoneW / safezoneH) min 1.2)
#define SIZEY (SIZEX / 1.2)
#define W_PART(num) (num * (SIZEX / 40))
#define H_PART(num) (num * (SIZEY / 25))
#define X_PART(num) (W_PART(num) + (safezoneX + (safezoneW - SIZEX)/2))
#define Y_PART(num) (H_PART(num) + (safezoneY + (safezoneH - SIZEY)/2))

// UI/Camera related values
#define SPEED_SLOW      0.1
#define SPEED_DEFAULT   1
#define SPEED_FAST      2 // Seems to be some form of multiplier (but using 1 stil makes it faster...?)

#define MODE_FREE   0
#define MODE_FPS    1
#define MODE_FOLLOW 2
#define ALL_MODES   [MODE_FREE,MODE_FPS,MODE_FOLLOW]

#define VISION_NORM -2
#define VISION_NVG  -1

#define MAX_VIEW_DISTANCE       2500
#define MIN_VIEW_DISTANCE       500
#define DEFAULT_VIEW_DISTANCE   1200

#define FIRE_HIGHLIGHT_TIME 0.05
#define MAX_GRENADES 15
#define MAX_PROJECTILES 50
#define MAX_PROJECTILE_SEGMENTS 50

#define DISTANCE_ICONS_SQR 9000000 // Icons are rendered within 3000m, squared for `distanceSqr` speed
#define DISTANCE_NAMES_SQR 30625 // Names are rendered within 175m, squared for `distanceSqr` speed
#define NAME_MAX_CHARACTERS 17

#define LIST_ENTITIES localize "STR_A3_Spectator_Entities"
#define LIST_LOCATIONS localize "STR_A3_Spectator_Locations"
#define LIST_UPDATE_RATE 1

// Revive variables
#define BIS_REVIVE "BIS_revive_incapacitated"
#define ACE_REVIVE "ACE_isUnconscious"
#define NEEDS_REVIVE(unit) (unit getVariable [ACE_REVIVE,false]) || {unit getVariable [BIS_REVIVE,false]}

// Icons used in the UI/drawing
#define ICON_DEAD                       "a3\Ui_F_Curator\Data\CfgMarkers\kia_ca.paa"
#define ICON_GRENADE                    "A3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_connect_ca.paa"
#define ICON_UNIT                       "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitIcon_ca.paa"
#define ICON_REVIVE                     "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\ReviveIcon_ca.paa"
#define ICON_BACKGROUND_UNIT            "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\UnitName_ca.paa"
#define ICON_CAMERA                     "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\cameraTexture_ca.paa"
#define CAM_ICON_FREE                   "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\FreeSelected.paa"
#define CAM_ICON_FREE_SELECTED          "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Free.paa"
#define CAM_ICON_FOLLOW                 "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\FollowSelected.paa"
#define CAM_ICON_FOLLOW_SELECTED        "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Follow.paa"
#define CAM_ICON_FPS                    "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\FpsSelected.paa"
#define CAM_ICON_FPS_SELECTED           "a3\Ui_f\data\GUI\Rsc\RscDisplayEGSpectator\Fps.paa"

// IDCs
#define MAIN_DISPLAY ([] call BIS_fnc_displayMission)

#define IDD_SPEC_DISPLAY 60000
#define SPEC_DISPLAY (findDisplay IDD_SPEC_DISPLAY)

#define IDC_MOUSE 60001
#define CTRL_MOUSE (SPEC_DISPLAY displayCtrl IDC_MOUSE)

#define IDC_TIME 60002
#define CTRL_TIME (SPEC_DISPLAY displayCtrl IDC_TIME)

#define IDC_LIST 60003
#define CTRL_LIST (SPEC_DISPLAY displayCtrl IDC_LIST)

#define IDC_TABS 60004
#define CTRL_TABS (SPEC_DISPLAY displayCtrl IDC_TABS)

#define IDC_CAM_TYPES 60005
#define CTRL_CAM_TYPES (SPEC_DISPLAY displayCtrl IDC_CAM_TYPES)
#define IDC_FREE 60006
#define IDC_FOLLOW 60007
#define IDC_FPS 60008

#define IDC_MAP_GROUP 60010
#define CTRL_MAP_GROUP (SPEC_DISPLAY displayCtrl IDC_MAP_GROUP)
#define IDC_MAP_TITLE 60011
#define CTRL_MAP_TITLE (SPEC_DISPLAY displayCtrl IDC_MAP_TITLE)
#define IDC_MAP_FOOTER 60012
#define CTRL_MAP_FOOTER (SPEC_DISPLAY displayCtrl IDC_MAP_FOOTER)
#define IDC_MAP_SPEC_NUM 60013
#define CTRL_MAP_SPEC_NUM (SPEC_DISPLAY displayCtrl IDC_MAP_SPEC_NUM)
#define IDC_MAP 60014
#define CTRL_MAP (SPEC_DISPLAY displayCtrl IDC_MAP)

#define IDC_HELP_BACK 60020
#define CTRL_HELP_BACK (SPEC_DISPLAY displayCtrl IDC_HELP_BACK)
#define IDC_HELP 60021
#define CTRL_HELP (SPEC_DISPLAY displayCtrl IDC_HELP)

#define IDC_WIDGET 60030
#define CTRL_WIDGET (SPEC_DISPLAY displayCtrl IDC_WIDGET)
#define IDC_WIDGET_VEHICLE 60031
#define CTRL_WIDGET_VEHICLE (SPEC_DISPLAY displayCtrl IDC_WIDGET_VEHICLE)
#define IDC_WIDGET_UNIT 60032
#define CTRL_WIDGET_UNIT (SPEC_DISPLAY displayCtrl IDC_WIDGET_UNIT)
#define IDC_WIDGET_NAME 60033
#define CTRL_WIDGET_NAME (SPEC_DISPLAY displayCtrl IDC_WIDGET_NAME)
#define IDC_WIDGET_AVATAR 60034
#define CTRL_WIDGET_AVATAR (SPEC_DISPLAY displayCtrl IDC_WIDGET_AVATAR)
#define IDC_WIDGET_KILLS 60035
#define CTRL_WIDGET_KILLS (SPEC_DISPLAY displayCtrl IDC_WIDGET_KILLS)
#define IDC_WIDGET_LAND 60036
#define CTRL_WIDGET_LAND (SPEC_DISPLAY displayCtrl IDC_WIDGET_LAND)
#define IDC_WIDGET_ARMORED 60037
#define CTRL_WIDGET_ARMORED (SPEC_DISPLAY displayCtrl IDC_WIDGET_ARMORED)
#define IDC_WIDGET_AIR 60038
#define CTRL_WIDGET_AIR (SPEC_DISPLAY displayCtrl IDC_WIDGET_AIR)
#define IDC_WIDGET_DEATHS 60039
#define CTRL_WIDGET_DEATHS (SPEC_DISPLAY displayCtrl IDC_WIDGET_DEATHS)
#define IDC_WIDGET_TOTAL 60040
#define CTRL_WIDGET_TOTAL (SPEC_DISPLAY displayCtrl IDC_WIDGET_TOTAL)
#define IDC_WIDGET_WEAPON 60041
#define CTRL_WIDGET_WEAPON (SPEC_DISPLAY displayCtrl IDC_WIDGET_WEAPON)
#define IDC_WIDGET_WEAPON_BACK 60042
#define CTRL_WIDGET_WEAPON_BACK (SPEC_DISPLAY displayCtrl IDC_WIDGET_WEAPON_BACK)
