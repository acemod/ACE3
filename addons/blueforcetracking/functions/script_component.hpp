#include "\z\ace\addons\blueforcetracking\script_component.hpp"

// bft data addon macros
#define     BFT_DATA_ADDON              bft

// I use them as constant getters so indexes won't get messed up
#define     DEV_GETDEVICEID(element)    (element select 0)
#define     DEV_GETCALLSIGN(element)    (element select 1)
#define     DEV_GETTYPEICON(element)    (element select 2)
#define     DEV_GETSIZEICON(element)    (element select 3)
#define     DEV_GETPOSITION(element)    (element select 4)
#define     DEV_GETENCRYPTION(element)  (element select 5)
#define     DEV_GETID(element)          (element select 6)
#define     DEV_GETDEVICE(element)      (element select 7)
#define     DEV_GETTYPE(element)        ("type name not implemented jet")
#define     DEV_GETSIZE(element)        ("size name not implemented jet")

// data for blueforce tracking icons
#define     STRINGXMLFORMAT(token)      ace_##COMPONENT##_##token
#define     LOCALIZESTR(myStr)          localize #STRINGXMLFORMAT(myStr)
#define     CTRL                        (_display displayCtrl _idc)

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
#define     IDC_TOOLTIP_TITLE           335000
#define     IDC_TOOLTIP_SUBTITLE        335001
#define     IDC_TOOLTIP_INFORMATION     335002

#define     DIK_LCONTROL                0x1D

#define     MAPANIMZOOM                 0.05
