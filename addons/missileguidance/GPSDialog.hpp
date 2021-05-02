#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineCommonColors.inc"

class RscText;
class RscEdit;
class RscPicture;
class RscButton;
class ctrlXSliderH;

class GVAR(gpsAttackOptionsUI) {
    idd = -1;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = QUOTE(_this call FUNC(gps_onLoad));
    onUnload = QUOTE(call FUNC(gps_onUnload));
    class controlsBackground {
        class Header: RscText {
            idc = -1;
            text = CSTRING(GPS_ui_header);
            x = 13.5 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 5 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 18 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorBackground[] = GUI_BCG_COLOR;
            moving = 1;
        };
        class Background: RscText {
            idd = -1;
            x = 13.5 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 6.1 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 18 * GUI_GRID_W;
            h = 8.0 * GUI_GRID_H;
            colorBackground[] = {0, 0, 0, 0.8};
        };
    };
    class controls {
		class TOOButton: RscButton {
			idc = GPS_UI_TOO;
            text = CSTRING(GPS_ui_too);
            onButtonClick = QUOTE([GPS_UI_TOO] call FUNC(gps_modeSelect));
            x = 14 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 6.3 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 10 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = GUI_BCG_COLOR;
            colorFocused[] = {0, 0, 0, 0.8};
		};

		class PPButton: RscButton {
			idc = GPS_UI_PB;
            text = CSTRING(GPS_ui_pp);
            onButtonClick = QUOTE([GPS_UI_PB] call FUNC(gps_modeSelect));
            x = 26 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 6.3 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 5 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = GUI_BCG_COLOR;
            colorFocused[] = {0, 0, 0, 0.8};
		};

		class PPMission: RscText {
			idc = GPS_UI_PB_MISSION;
            text = CSTRING(GPS_ui_pp_short);
            onButtonClick = "";
            x = 27.5 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 2 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 1};
            colorFocused[] = {0, 0, 0, 0.8};
			align = "CENTER";
  			style = 2;
		};

		class PPMissionBackward: RscButton {
			idc = GPS_UI_PB_MISSION_BACKWARD;
            text = "<<";
            onButtonClick = QUOTE([-1] call FUNC(gps_pbModeCycle));
            x = 26 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 1 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
		};

		class PPMissionForward: RscButton {
			idc = GPS_UI_PB_MISSION_FORWARD;
            text = ">>";
            onButtonClick = QUOTE([1] call FUNC(gps_pbModeCycle));
            x = 30 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 7.5 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 1 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
		};

		class TargetPosXText: RscText {
			idc = -1;
            text = CSTRING(GPS_ui_easting);
            x = 14 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 3 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
			maxChars = 10;
		};
		class TargetPosX: RscEdit {
			idc = GPS_UI_EASTING;
            text = "";
            x = 17.3 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 8.5 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 2.5 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
			maxChars = 5;
		};

		class TargetPosYText: RscText {
			idc = -1;
            text = CSTRING(GPS_ui_northing);
            x = 14 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 3 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
			maxChars = 5;
		};
		class TargetPosY: TargetPosX {
			idc = GPS_UI_NORTHING;
            x = 17.3 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y;
		};

		class TargetPosHeightText: RscText {
			idc = -1;
            text = CSTRING(GPS_ui_altitude);
            x = 14 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 11.7 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 3 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
			maxChars = 5;
		};
		class TargetPosHeight: TargetPosX {
			idc = GPS_UI_HEIGHT;
            x = 17.3 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 11.7 * GUI_GRID_H + GUI_GRID_CENTER_Y;
		};
		class TargetPosHeightUnits: RscText {
			idc = -1;
            text = "m";
            x = 19.6 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 11.7 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 1 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
			maxChars = 5;
		};

		class ImpactAngleText: RscText {
			idc = -1;
            text = CSTRING(GPS_ui_impact_angle);
            x = 21 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 4 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
			maxChars = 5;
		};
		class ImpactAngle: RscEdit {
			idc = GPS_UI_ANGLE;
            x = 26.3 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y;
			w = 2 * GUI_GRID_W;
            h = GUI_GRID_H;
            text = "";
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
			maxChars = 2;
		};

		class AttackHeadingText: RscText {
			idc = -1;
            text = CSTRING(GPS_ui_attack_heading);
            x = 21 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 11 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 5 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
			maxChars = 5;
		};
		class AttackHeading: RscEdit {
			idc = GPS_UI_HEADING;
            x = 26.3 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 11 * GUI_GRID_H + GUI_GRID_CENTER_Y;
			w = 2 * GUI_GRID_W;
            h = GUI_GRID_H;
            text = "";
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
			maxChars = 3;
		};

        class CancelButton: RscButton {
            idc = -1;
            text = CSTRING(GPS_ui_cancel);
            onButtonClick = QUOTE(closeDialog 0);
            x = 13.5 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 14.2 * GUI_GRID_H + GUI_GRID_CENTER_Y;
            w = 5 * GUI_GRID_W;
            h = GUI_GRID_H;
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
        };
        class ConfirmButton: CancelButton {
            idc = IDC_TIMER_CONFIRM;
            text = CSTRING(GPS_ui_confirm);
            onButtonClick = QUOTE([] call FUNC(gps_confirm));
            x = 26.5 * GUI_GRID_W + GUI_GRID_CENTER_X;
        };
    };
};
