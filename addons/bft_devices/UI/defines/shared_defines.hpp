#define IDD_TAD_DLG          155424
#define IDD_TAD_DSP          175134
#define IDD_DK10_DLG         175154
#define IDD_JV5_DLG          175144
#define IDD_GD300_DLG        177382
#define IDD_GD300_DSP        177383

#define IDC_LOADINGTXT       1000
#define IDC_ACTBFTTXT        1001
#define IDC_ACTUAVTXT        1002
#define IDC_ACTVIDTXT        1003
#define IDC_ACTMSGTXT        1004
#define IDC_BRIGHTNESS        1005
#define IDC_BACKGROUND       1200
#define IDC_SCREEN           1201
#define IDC_SCREEN_TOPO      1202
#define IDC_SCREEN_BLACK     1203
#define IDC_WIN_BACK         1210
#define IDC_WIN_TASKBAR      1211
#define IDC_MINIMAPBG        1218
#define IDC_HCAMMAP          1220
#define IDC_HCAMLIST         1230
#define IDC_HCAMDISPLAY      1240
#define IDC_HCAM_FULL        1245
#define IDC_BTNF1            1600
#define IDC_BTNF2            1601
#define IDC_BTNF3            1602
#define IDC_BTNF4            1603
#define IDC_BTNF5            1604
#define IDC_BTNF6            1605
#define IDC_BTNMAIN          1606
#define IDC_BTNFN            1607
#define IDC_BTNOFF           1608
#define IDC_BTNUP            1609
#define IDC_BTNDWN           1610
#define IDC_BTNACT           1611
#define IDC_NOTIFICATION     1620

#define IDC_UAVDISPLAY       1773
#define IDC_UAVMAP           1774
#define IDC_UAV2NDDISPLAY    1775
#define IDC_UAVLIST          1776

/*
#define IDC_USRMN_OP4BTN        2000
#define IDC_USRMN_MEDBTN        2001
#define IDC_USRMN_GENBTN        2002
#define IDC_USRMN_INFBTN        2003
#define IDC_USRMN_MECINFBTN     2004
#define IDC_USRMN_AMRBTN        2005
#define IDC_USRMN_HELIBTN       2006
#define IDC_USRMN_PLNBTN        2007
#define IDC_USRMN_UKNBTN        2008
#define IDC_USRMN_FTBTN         2009
#define IDC_USRMN_PATBTN        2010
#define IDC_USRMN_SQDBTN        2011
#define IDC_USRMN_SCTBTN        2012
#define IDC_USRMN_PLTNBTN       2013
#define IDC_USRMN_CPNYBTN       2014
#define IDC_USRMN_NTHBTN        2015
#define IDC_USRMN_NEBTN         2016
#define IDC_USRMN_EBTN          2017
#define IDC_USRMN_SEBTN         2018
#define IDC_USRMN_SBTN          2019
#define IDC_USRMN_SWBTN         2020
#define IDC_USRMN_WBTN          2021
#define IDC_USRMN_RSCTEXT_1022  2022
#define IDC_USRMN_RSCTEXT_1023  2023
#define IDC_USRMN_CASLTYBTN     2024
#define IDC_USRMN_CCPBTN        2025
#define IDC_USRMN_BASBTN        2026
#define IDC_USRMN_HQBTN         2027
#define IDC_USRMN_LZBTN         2028
#define IDC_USRMN_STNBTN        2029
#define IDC_USRMN_MCIBTN        2031
#define IDC_USRMN_MOTRINFBTN    2032
#define IDC_USRMN_MAINBG        2200
#define IDC_USRMN_IGUIBACK_2201 2201
#define IDC_USRMN_IGUIBACK_2202 2202
#define IDC_USRMN_IGUIBACK_2203 2203
#define IDC_USRMN_IGUIBACK_2204 2204
#define IDC_USRMN_IGUIBACK_2205 2205
*/

#define IDC_OSD_TXT_TGGL 2610
#define IDC_OSD_MAP_TGGL 2611
#define IDC_OSD_GRID     2612
#define IDC_OSD_TIME     2613
#define IDC_OSD_MAP_SCALE    2614
#define IDC_OSD_DIR_DEGREE   2615
#define IDC_OSD_DIR_OCTANT   2616
#define IDC_OSD_HOOK_GRID    2617
#define IDC_OSD_HOOK_DIR 2618
#define IDC_OSD_HOOK_DST 2619
#define IDC_OSD_HOOK_ELEVATION 2620
#define IDC_OSD_HOOK_TGGL1   2621
#define IDC_OSD_HOOK_TGGL2   2622
#define IDC_OSD_ELEVATION    2623

#define IDC_GROUP_DESKTOP    4610
#define IDC_GROUP_BFT        4620
#define IDC_GROUP_UAV        4630
#define IDC_GROUP_HCAM       4640
#define IDC_GROUP_MESSAGE    4650
#define IDC_GROUP_COMPOSE    4655
#define IDC_GROUP_MENU       4660

#define IDC_MSG_LIST     15000
#define IDC_MSG_CONTENT  18510
#define IDC_MSG_RECIPIENTS   15010
#define IDC_MSG_COMPOSE  14000
#define IDC_MSG_BTNDELETE    16120
#define IDC_MSG_BTNSEND  16130

// onMouseMoving
#define onMM QUOTE(GVAR(cursorOnMap) = _this select 3; GVAR(mapCursorPos) = _this select 0 ctrlMapScreenToWorld [ARR_2(_this select 1,_this select 2)];)

// Colors
#define COLOR_NEON_GREEN {57/255,255/255,20/255,1}
#define COLOR_NEON_GREEN_ARR [57/255,255/255,20/255,1]
#define COLOR_NEON_YELLOW {243/255,243/255,21/255,1}
#define COLOR_NEON_YELLOW_ARR [243/255,243/255,21/255,1]
#define COLOR_BLACK {0,0,0,1}
#define COLOR_BLACK_ARR [0,0,0,1]
#define COLOR_WHITE {1,1,1,1}
#define COLOR_WHITE_ARR [1,1,1,1]
#define COLOR_LIGHT_BLUE {0.2,0.431,0.647,1}
#define COLOR_LIGHT_BLUE_ARR [0.2,0.431,0.647,1]
#define COLOR_PURPLE {255/255,0/255,255/255,1}
#define COLOR_PURPLE_ARR [255/255,0/255,255/255,1]
#define COLOR_TRANSPARENT {0,0,0,0}
#define COLOR_TRANSPARENT_ARR [0,0,0,0]
#define COLOR_NAVYBLUE {0,0,128/255,1}
#define COLOR_NAVYBLUE_ARR [0,0,128/255,1]