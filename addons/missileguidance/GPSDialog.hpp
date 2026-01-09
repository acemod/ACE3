#include "\a3\ui_f\hpp\defineCommonGrids.inc"
#include "\a3\ui_f\hpp\defineCommonColors.inc"
#include "idc_defines.hpp"

class GVAR(gpsAttackOptionsUI) {
    idd = -1;
    movingEnable = 1;
    enableSimulation = 1;
    onLoad = QUOTE(call FUNC(gps_onLoad));
    onUnload = QUOTE(call FUNC(gps_onUnload));
    class controlsBackground {
        class Header: RscText {
            idc = -1;
            text = CSTRING(GPS_ui_header);
            x = QUOTE(13.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(18 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorBackground[] = GUI_BCG_COLOR;
            moving = 1;
        };
        class Background: RscText {
            idd = -1;
            x = QUOTE(13.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(6.1 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(18 * GUI_GRID_W);
            h = QUOTE(8.0 * GUI_GRID_H);
            colorBackground[] = {0, 0, 0, 0.8};
        };
    };
    class controls {
        class TOOButton: RscButton {
            idc = GPS_UI_TOO;
            text = CSTRING(GPS_ui_too);
            onButtonClick = QUOTE([GPS_UI_TOO] call FUNC(gps_modeSelect));
            x = QUOTE(14 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(6.3 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(10 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = GUI_BCG_COLOR;
            colorFocused[] = {0, 0, 0, 0.8};
        };

        class PPButton: RscButton {
            idc = GPS_UI_PB;
            text = CSTRING(GPS_ui_pp);
            onButtonClick = QUOTE([GPS_UI_PB] call FUNC(gps_modeSelect));
            x = QUOTE(26 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(6.3 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(5 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = GUI_BCG_COLOR;
            colorFocused[] = {0, 0, 0, 0.8};
        };

        class PPMission: RscText {
            idc = GPS_UI_PB_MISSION;
            text = CSTRING(GPS_ui_pp_short);
            onButtonClick = "";
            x = QUOTE(27.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(7.5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(2 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 1};
            colorFocused[] = {0, 0, 0, 0.8};
            align = QUOTE(CENTER);
            style = 2;
        };

        class PPMissionBackward: RscButton {
            idc = GPS_UI_PB_MISSION_BACKWARD;
            text = "<<";
            onButtonClick = QUOTE([-1] call FUNC(gps_pbModeCycle));
            x = QUOTE(26 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(7.5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(1 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
        };

        class PPMissionForward: RscButton {
            idc = GPS_UI_PB_MISSION_FORWARD;
            text = ">>";
            onButtonClick = QUOTE([1] call FUNC(gps_pbModeCycle));
            x = QUOTE(30 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(7.5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(1 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
        };

        class TargetPosXText: RscText {
            idc = -1;
            text = CSTRING(GPS_ui_easting);
            x = QUOTE(14 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(8.5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(3 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
            maxChars = 10;
        };
        class TargetPosX: RscEdit {
            idc = GPS_UI_EASTING;
            text = "";
            x = QUOTE(17.3 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(8.5 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(2.5 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
            maxChars = 5;
        };

        class TargetPosYText: RscText {
            idc = -1;
            text = CSTRING(GPS_ui_northing);
            x = QUOTE(14 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(3 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
            maxChars = 5;
        };
        class TargetPosY: TargetPosX {
            idc = GPS_UI_NORTHING;
            x = QUOTE(17.3 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
        };

        class TargetPosHeightText: RscText {
            idc = -1;
            text = CSTRING(GPS_ui_altitude);
            x = QUOTE(14 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(11.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(3 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
            maxChars = 5;
        };
        class TargetPosHeight: TargetPosX {
            idc = GPS_UI_HEIGHT;
            x = QUOTE(17.3 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(11.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
        };
        class TargetPosHeightUnits: RscText {
            idc = -1;
            text = "m";
            x = QUOTE(19.6 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(11.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(1 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
            maxChars = 5;
        };

        class ImpactAngleText: RscText {
            idc = -1;
            text = CSTRING(GPS_ui_impact_angle);
            x = QUOTE(21 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(4 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
            maxChars = 5;
        };
        class ImpactAngle: RscEdit {
            idc = GPS_UI_ANGLE;
            x = QUOTE(26.3 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(9.7 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(2 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            text = "";
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
            maxChars = 2;
        };

        class AttackHeadingText: RscText {
            idc = -1;
            text = CSTRING(GPS_ui_attack_heading);
            x = QUOTE(21 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(11 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(5 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0};
            colorFocused[] = {0, 0, 0, 0.8};
            maxChars = 5;
        };
        class AttackHeading: RscEdit {
            idc = GPS_UI_HEADING;
            x = QUOTE(26.3 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(11 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(2 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            text = "";
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
            maxChars = 3;
        };

        class CancelButton: RscButton {
            idc = -1;
            text = ECSTRING(common,cancel);
            onButtonClick = QUOTE(closeDialog 0);
            x = QUOTE(13.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(14.2 * GUI_GRID_H + GUI_GRID_CENTER_Y);
            w = QUOTE(5 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            colorActive[] = {0, 0, 0, 1};
            colorBackground[] = {0, 0, 0, 0.8};
            colorFocused[] = {0, 0, 0, 0.8};
        };
        class ConfirmButton: CancelButton {
            idc = IDC_TIMER_CONFIRM;
            text = ECSTRING(common,confirm);
            onButtonClick = QUOTE([] call FUNC(gps_confirm));
            x = QUOTE(27.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
        };
    };
};
