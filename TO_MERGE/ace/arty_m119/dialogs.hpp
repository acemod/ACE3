//dialogs.hpp
#include "script_component.hpp"
#include "\x\ace\addons\main\script_dialog_defines.hpp"
#define FontM	"Zeppelin32"
#define ClrWhite 1,1,1
#define ClrBlack 0,0,0
#define ClrGray 0.5,0.5,0.5
#define ClrBlue 0.2,0.5,1
class acex_arty_m137_RscText 
{
	idc = -1;
	type = CT_STATIC;
	style = ST_CENTER;
	font = FontM;
	colorText[] = {1,1,1,1};
	colorBackground[] = {0, 0, 0, 0};
	sizeEx = 0.03;
	w = 0.2;
	h = 0.03;
};

class acex_arty_m137_RscButton 
{
	type = CT_BUTTON;
	idc = -1;
	style = ST_CENTER;

	x = 0.0;
	y = 0.0;
	w = 0.1;
	h = 0.03;
	sizeEx = 0.0325;
	offsetX = 0;
	offsetY = 0.002;
	offsetPressedX = 0;
	offsetPressedY = 0.002;
	borderSize = 0;

	

	colorText[] = {ClrWhite,1};
	colorBackground[] = {ClrGray, 0.75};
	colorFocused[] = {ClrGray,0};

	colorShadow[] = {ClrBlack,0};
	colorBorder[] = {ClrWhite,0};
	colorBackgroundActive[] = {ClrGray,0};
	colorDisabled[] = {ClrGray, 0};
	colorBackgroundDisabled[] = {ClrGray,0};
	font = FontM;

	soundEnter[] = {"", 0.2, 1};
	soundPush[] = {"", 0.2, 1};
	soundClick[] = {"", 0.2, 1};
	soundEscape[] = {"", 0.2, 1};

	default = false;
	text = "";
	action = "";
};

class acex_arty_m137_RscPicture : acex_arty_m137_RscButton
{
	type = CT_STATIC;
	idc = -1;
	style = ST_PICTURE;
	text = "";
};

class acex_arty_m137_dialog {
	idd = 137137;
	MovingEnable = 0;
	onLoad = QUOTE([] spawn FUNC(m137_monitorSight));
	onUnload = QUOTE([] spawn FUNC(m137_stopMonitorSight));
	
	controlsBackground[] = {};
	objects[] = {};
	onKeyDown = QUOTE(_this call FUNC(m137_keyDown));
	onKeyUp = QUOTE(_this call FUNC(m137_keyUp));
	class controls {
		class GVAR(m137Background) : acex_arty_m137_RscText {
			__SX(0);
			__SY(0);
			__SW(0.25);
			__SH(0.6);
			colorBackground[] = {ClrGray, 0.25};
			text = "";
		};
		
		class GVAR(m137Title) : acex_arty_m137_RscText {
			__SX(0);
			__SY(0);
			__SW(0.25);
			colorBackground[] = {ClrGray, 0.25};
			text = "M137 Sight Unit";
		};
		
		class GVAR(m137AzimuthLabel) : acex_arty_m137_RscText {
			__SX(0);
			__SY(0.035);
			__SW(0.125);
			colorBackground[] = {ClrGray, 0.25};
			text = "Azimuth:";
		};
		
		class GVAR(m137Azimuth) : acex_arty_m137_RscText {
			idc = 137001;
			__SX(0.125);
			__SY(0.035);
			__SW(0.125);
			colorBackground[] = {ClrGray, 0.25};
			text = "0000";
		};
		
		class GVAR(m137DeflectionLabel) : acex_arty_m137_RscText {
			__SX(0);
			__SY(0.07);
			__SW(0.125);
			colorBackground[] = {ClrGray, 0.25};
			text = "Deflection:";
		};
		
		class GVAR(m137Deflection) : acex_arty_m137_RscText {
			idc = 137002;
			__SX(0.125);
			__SY(0.07);
			__SW(0.125);
			colorBackground[] = {ClrGray, 0.25};
			text = "3200";
		};
		
		class GVAR(m187title) : acex_arty_m137_RscText {
			__SX(0);
			__SY(0.105);
			__SW(0.25);
			colorBackground[] = {ClrGray, 0.25};
			text = "M187 Sight Mount";
		};
		
		class GVAR(m137ElevationLabel) : acex_arty_m137_RscText {
			__SX(0);
			__SY(0.140);
			__SW(0.125);
			colorBackground[] = {ClrGray, 0.25};
			text = "Elevation:";
		};
		
		class GVAR(m137Elevation) : acex_arty_m137_RscText {
			idc = 137003;
			__SX(0.125);
			__SY(0.140);
			__SW(0.125);
			colorBackground[] = {ClrGray, 0.25};
			text = "0300";
		};
		
		class GVAR(m137ElevationBubbleLabel) : acex_arty_m137_RscText {
			__SX(0);
			__SY(0.175);
			__SW(0.125);
			colorBackground[] = {ClrGray, 0.25};
			text = "Level:";
		};
		
		class GVAR(m137ElevationBubble) : acex_arty_m137_RscText {
			idc = 137004;
			__SX(0.125);
			__SY(0.175);
			__SW(0.125);
			colorBackground[] = {ClrGray, 0.25};
			text = "|---|+|---|";
		};
		
		class GVAR(m137AzimuthLeftButton) : acex_arty_m137_RscButton {
			idc = 137004;
			__SX(0.0);
			__SY(0.210);
			__SW(0.062);
			text = "Def. -";
			action = QUOTE([-1] call FUNC(m137_adjustAzimuth));
		};
		
		class GVAR(m137AzimuthRightButton) : acex_arty_m137_RscButton {
			idc = 137005;
			__SX(0.0625);
			__SY(0.210);
			__SW(0.062);
			text = "Def. +";
			action = QUOTE([1] call FUNC(m137_adjustAzimuth));
		};
		
		class GVAR(m137ElevationUpButton) : acex_arty_m137_RscButton {
			idc = 137006;
			__SX(0.125);
			__SY(0.210);
			__SW(0.062);
			text = "El +";
			action = QUOTE([1] call FUNC(m137_adjustElevation));
		};
		
		class GVAR(m137ElevationDownButton) : acex_arty_m137_RscButton {
			idc = 137007;
			__SX(0.1875);
			__SY(0.210);
			__SW(0.062);
			text = "El -";
			action = QUOTE([-1] call FUNC(m137_adjustElevation));
		};
		
		class GVAR(m137OpticDownButton) : acex_arty_m137_RscButton {
			__SX(0.0);
			__SY(0.245);
			__SW(0.062);
			text = "Op. -";
			action = QUOTE([-1] call FUNC(m137_adjustOpticElevation));
		};
		
		class GVAR(m137OpticUpButton) : acex_arty_m137_RscButton {
			__SX(0.0625);
			__SY(0.245);
			__SW(0.062);
			text = "Op. +";
			action = QUOTE([1] call FUNC(m137_adjustOpticElevation));
		};
		
		class GVAR(m137ResetLeftButton) : acex_arty_m137_RscButton {
			__SX(0.125);
			__SY(0.245);
			__SW(0.062);
			text = "Re +";
			action = QUOTE([1] call FUNC(m137_adjustReset));
		};
		
		class GVAR(m137ResetRightButton) : acex_arty_m137_RscButton {
			__SX(0.1875);
			__SY(0.245);
			__SW(0.062);
			text = "Re -";
			action = QUOTE([-1] call FUNC(m137_adjustReset));
		};
		
		class GVAR(m137TraverseIndicatorLabel) : acex_arty_m137_RscText {
			__SX(0);
			__SY(0.280);
			__SW(0.125);
			colorBackground[] = {ClrGray, 0.25};
			text = "Traverse:";
		};
		
		class GVAR(m137TraverseIndicator) : acex_arty_m137_RscText {
			idc = 137008;
			__SX(0.125);
			__SY(0.280);
			__SW(0.125);
			colorBackground[] = {ClrGray, 0.25};
			text = "|-----|-----|";
		};
		
		class GVAR(m137ChangeViewButton) : acex_arty_m137_RscButton {
			__SX(0.0);
			__SY(0.315);
			__SW(0.25);
			text = "Change View";
			action = QUOTE([] call FUNC(m137_changeView));
		};
		
		class GVAR(m137LevelGun) : acex_arty_m137_RscButton {
			__SX(0.0);
			__SY(0.350);
			__SW(0.25);
			text = "Level Gun";
			action = QUOTE([] call FUNC(levelGun));
		};
	};
};