//dialogs.hpp

#define __X SafeZoneX
#define __Y SafeZoneY
#define __W SafeZoneW
#define __H SafeZoneH

#define __SX(var1) x = ((var1 * safeZoneW) + safeZoneX)
#define __SY(var1) y = ((var1 * safeZoneH) + safeZoneY)
#define __SW(var1) w = (var1 * safeZoneW)
#define __SH(var1) h = (var1 * safeZoneH)

// Control types
#define CT_STATIC           0
#define CT_BUTTON           1
#define CT_EDIT             2
#define CT_SLIDER           3
#define CT_COMBO            4
#define CT_LISTBOX          5
#define CT_LISTNBOX          102
#define CT_TOOLBOX          6
#define CT_CHECKBOXES       7
#define CT_PROGRESS         8
#define CT_HTML             9
#define CT_STATIC_SKEW      10
#define CT_ACTIVETEXT       11
#define CT_TREE             12
#define CT_STRUCTURED_TEXT  13
#define CT_CONTEXT_MENU     14
#define CT_CONTROLS_GROUP   15
#define CT_SHORTCUTBUTTON   16
#define CT_XKEYDESC         40
#define CT_XBUTTON          41
#define CT_XLISTBOX         42
#define CT_XSLIDER          43
#define CT_XCOMBO           44
#define CT_ANIMATED_TEXTURE 45
#define CT_OBJECT           80
#define CT_OBJECT_ZOOM      81
#define CT_OBJECT_CONTAINER 82
#define CT_OBJECT_CONT_ANIM 83
#define CT_LINEBREAK        98
#define CT_USER             99
#define CT_MAP              100
#define CT_MAP_MAIN         101

// Static styles
#define ST_POS            0x0F
#define ST_HPOS           0x03
#define ST_VPOS           0x0C
#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02
#define ST_DOWN           0x04
#define ST_UP             0x08
#define ST_VCENTER        0x0c

#define ST_TYPE           0xF0
#define ST_SINGLE         0
#define ST_MULTI          16
#define ST_TITLE_BAR      32
#define ST_PICTURE        48
#define ST_FRAME          64
#define ST_BACKGROUND     80
#define ST_GROUP_BOX      96
#define ST_GROUP_BOX2     112
#define ST_HUD_BACKGROUND 128
#define ST_TILE_PICTURE   144
#define ST_WITH_RECT      160
#define ST_LINE           176

#define ST_SHADOW         0x100
#define ST_NO_RECT        0x200
#define ST_KEEP_ASPECT_RATIO  0x800

#define Mainback_IDC 1104
//MP Menu
#define Paused_Title_IDC 523
#define CA_B_SAVE_IDC 103
#define CA_B_Skip_IDC 1002
#define CA_B_REVERT_IDC 119
#define CA_B_Respawn_IDC 1010
#define CA_B_Options_IDC 101
#define CA_B_Abort_IDC 104
//SP Menu
#define CA_PGTitle_IDC 523
#define PG_Save_IDC 103
#define PG_Skip_IDC 1002
#define PG_Revert_IDC 119
#define PG_Again_IDC 1003
#define PG_Options_IDC 101
#define PG_Abort_IDC 104

#define ACE_SETTINGS_IDC 113801
#define ACE_LOGO_IDC 113805

#define FontM	"Zeppelin32"
#define ClrWhite 1,1,1
#define ClrBlack 0,0,0
#define ClrGray 0.5,0.5,0.5
#define ClrBlue 0.2,0.5,1



class ace_sys_aimingpoints_aimingCircleDisplay {
    idd = 7832;
	movingEnable = 0;
	name = "ace_sys_aimingpoints_aimingCircleDisplay";
	onLoad = "_this call ace_sys_arty_aimingpoints_fnc_aimingCircleInitDisplay";
	onUnload = "_this call ace_sys_arty_aimingpoints_fnc_aimingCircleCloseDisplay";
    onKeyDown = "_this call ace_sys_arty_aimingpoints_fnc_aimingCircleHandleKey";
	class controlsBackground { 
	};
	class objects { 
		// define controls here
	};
	class controls {
		
	};
};