#include "\z\ace\addons\blueforcetracking\script_component.hpp"

#define     BFT_DATA_ADDON              bft

// script like macro
#define     STRINGXMLFORMAT(token)      ace_##COMPONENT##_##token
#define     LOCALIZESTR(myStr)          localize #STRINGXMLFORMAT(myStr)
#define     CONTROL                     (_display displayCtrl _idc)

// colors
#define     COLOR_ALLIED                0,0.3,0.6,1
#define     COLOR_ENEMY                 0.5,0,0,1

#define     COLOR_BLACK                 0.035,0.035,0.035,1
#define     COLOR_BLACK_LIGHT           0.135,0.135,0.135,1
#define     COLOR_DARKGREY              0.3,0.3,0.3,1
#define     COLOR_DARKGREY_LIGHT        0.4,0.4,0.4,1
#define     COLOR_GREY                  0.5,0.5,0.5,1
#define     COLOR_INVISIBLE             0,0,0,0

#define     COLOR_WEST                  0,0.3,0.6,1
#define     COLOR_WEST_DARK             0,0.1,0.2,1
#define     COLOR_EAST                  0.5,0,0,1
#define     COLOR_EAST_DARK             0.2,0,0,1
#define     COLOR_GUER                  0,0.5,0,1
#define     COLOR_GUER_DARK             0,0.2,0,1
#define     COLOR_CIV                   0.4,0,0.5,1
#define     COLOR_CIV_DARK              0.4,0,0.5,1

// sizes
#define     MAP_ICON_SIZE               40

// data for blueforce tracking icons
#define     STRINGXMLFORMAT(token)      ace_##COMPONENT##_##token
#define     LOCALIZESTR(myStr)          localize #STRINGXMLFORMAT(myStr)
#define     CONTROL                     (_display displayCtrl _idc)

// colors
#define     COLOR_ALLIED                0,0.3,0.6,1
#define     COLOR_ENEMY                 0.5,0,0,1

#define     COLOR_BLACK                 0.035,0.035,0.035,1
#define     COLOR_BLACK_LIGHT           0.135,0.135,0.135,1
#define     COLOR_DARKGREY              0.3,0.3,0.3,1
#define     COLOR_DARKGREY_LIGHT        0.4,0.4,0.4,1
#define     COLOR_GREY                  0.5,0.5,0.5,1
#define     COLOR_INVISIBLE             0,0,0,0

#define     COLOR_WEST                  0,0.3,0.6,1
#define     COLOR_WEST_DARK             0,0.1,0.2,1
#define     COLOR_EAST                  0.5,0,0,1
#define     COLOR_EAST_DARK             0.2,0,0,1
#define     COLOR_GUER                  0,0.5,0,1
#define     COLOR_GUER_DARK             0,0.2,0,1
#define     COLOR_CIV                   0.4,0,0.5,1
#define     COLOR_CIV_DARK              0.4,0,0.5,1

// sizes
#define     MAP_ICON_SIZE               40

// --- GUI --- //
// tooltip macros
#define     W_TO_H(Y)                   (4/3 * Y)

#define     TT_W                        0.35
#define     TT_MARGIN                   0.005
#define     TT_TEXT_H                   0.04

// --- IDDs & IDCs --- //
// define gui idd
#define     IDC_TOOLTIP                 3350
#define     IDC_TOOLTIP_MAIN            335000
#define     IDC_TOOLTIP_TITLE_TEXT      335001
#define     IDC_TOOLTIP_SUBTITLE_TEXT   335002
#define     IDC_TOOLTIP_LEFT_GRP        335007
#define     IDC_TOOLTIP_LEFT_TEXT       335008
#define     IDC_TOOLTIP_LEFT_BACK       335009
#define     IDC_TOOLTIP_LEFT_HOVER      335010
#define     IDC_TOOLTIP_RIGHT_GRP       335003
#define     IDC_TOOLTIP_RIGHT_TEXT      335004
#define     IDC_TOOLTIP_RIGHT_BACK      335005
#define     IDC_TOOLTIP_RIGHT_HOVER     335006
#define     W_TO_H(Y)                   (4/3 * Y)

#define     TT_W                        0.35
#define     TT_MARGIN                   0.005
#define     TT_TEXT_H                   0.04
