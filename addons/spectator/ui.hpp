class RscButton;
class RscControlsGroup;
class RscControlsGroupNoScrollbars;
class RscListNBox {
    class ScrollBar;
};
class RscMapControl;
class RscPicture;
class RscPictureKeepAspect;
class RscText;
class RscToolbox;
class RscTree;

// Based on RscDisplayEGSpectator (sadly Arma doesn't like display inheritance)
class GVAR(display) {
    idd = IDD_SPEC_DISPLAY;
    enableSimulation = 1;
    movingEnable = 0;
    closeOnMissionEnd = 1;

    onKeyDown = QUOTE(_this call FUNC(ui_handleKeyDown));
    onKeyUp = QUOTE(_this call FUNC(ui_handleKeyUp));
    onMouseMoving = QUOTE(_this call FUNC(ui_handleMouseMoving));
    onChildDestroyed = QUOTE(_this call FUNC(ui_handleChildDestroyed));

    class ControlsBackground {
        class MouseHandler: RscText {
            idc = IDC_MOUSE;

            onMouseButtonDown = QUOTE(_this call FUNC(ui_handleMouseButtonDown));
            onMouseButtonUp = QUOTE(if ((_this select 1) == 1) then { GVAR(holdingRMB) = false; };);
            onMouseButtonDblClick = QUOTE(_this call FUNC(ui_handleMouseButtonDblClick));
            onMouseZChanged = QUOTE(_this call FUNC(ui_handleMouseZChanged));

            text = "";
            x = "safeZoneXAbs";
            y = "safeZoneY";
            w = "safeZoneWAbs";
            h = "safeZoneH";
            colorBackground[] = {1,1,1,0};
            style = 16;
        };
    };
    class Controls {
        class List: RscTree {
            idc = IDC_LIST;

            onMouseEnter = QUOTE([false] call FUNC(ui_fadeList));
            onMouseExit = QUOTE([true] call FUNC(ui_fadeList));
            onTreeSelChanged = QUOTE([ARR_2(false,_this)] call FUNC(ui_handleListClick));
            onTreeDblClick = QUOTE([ARR_2(true,_this)] call FUNC(ui_handleListClick));

            x = "safeZoneX";
            y = safeZoneY + H_PART(1.5);
            w = W_PART(13.5);
            h = safeZoneH - H_PART(1.5);

            disableKeyboardSearch = 1;
            multiselectEnabled = 0;
            colorBorder[] = {0,0,0,0};
            colorBackground[] = {0,0,0,0.75};
            expandOnDoubleclick = 1;
            fade = 0.8;
            shadow = 1;
            colorLines[] = {0,0,0,0};
            class ScrollBar {
                width = 0;
                height = 0;
                scrollSpeed = 0.1;
                color[] = {1,1,1,0};
            };
        };
        class Tabs: RscToolbox {
            idc = IDC_TABS;

            onToolBoxSelChanged = QUOTE(_this call FUNC(ui_handleTabSelected));
            onMouseEnter = QUOTE([false] call FUNC(ui_fadeList));
            onMouseExit = QUOTE([true] call FUNC(ui_fadeList));

            x = "safeZoneX";
            y = "safezoneY";
            w = W_PART(13.5);
            h = H_PART(1.5);

            fade = 0.8;
            rows = 1;
            columns = 2;
            strings[] = {"$STR_A3_Spectator_Entities","$STR_A3_Spectator_Locations"};
            values[] = {0,1};
            sizeEx = H_PART(1);
            colorBackground[] = {0,0,0,0.75};
            colorSelectedBg[] = {0,0,0,0.65};
        };
        class CameraTypesGroup: RscControlsGroupNoScrollbars {
            idc = IDC_CAM_TYPES;
            x = X_PART(15.5);
            y = safezoneY + safezoneH - H_PART(2.38);
            w = W_PART(8.6);
            h = 2.6;
            class controls {
                class CameraTypesBackground: RscText {
                    x = W_PART(0.6);
                    y = H_PART(0.4);
                    w = W_PART(7.5);
                    h = H_PART(2);
                    colorBackground[] = {0,0,0,0.75};
                };
                class Free: RscButton {
                    style = 48;
                    idc = IDC_FREE;

                    onButtonClick = QUOTE([MODE_FREE] call FUNC(cam_setCameraMode));

                    x = W_PART(1.3);
                    y = H_PART(0.8);
                    w = W_PART(1.63);
                    h = H_PART(1.37);

                    colorBackground[] = {0,0,0,0};
                    colorBackgroundDisabled[] = {0,0,0,0};
                    colorBackgroundActive[] = {0,0,0,0};
                    colorFocused[] = {0,0,0,0};
                    text = CAM_ICON_FREE;
                    tooltip = "$STR_A3_Spectator_free_camera_tooltip";
                };
                class Follow: RscButton {
                    style = 48;
                    idc = IDC_FOLLOW;

                    onButtonClick = QUOTE([MODE_FOLLOW] call FUNC(cam_setCameraMode));

                    x = W_PART(3.6);
                    y = H_PART(0.8);
                    w = W_PART(1.63);
                    h = H_PART(1.37);

                    colorBackground[] = {0,0,0,0};
                    colorBackgroundDisabled[] = {0,0,0,0};
                    colorBackgroundActive[] = {0,0,0,0};
                    colorFocused[] = {0,0,0,0};
                    text = CAM_ICON_FOLLOW;
                    tooltip = "$STR_A3_Spectator_3pp_camera_tooltip";
                };
                class Fps: RscButton {
                    style = 48;
                    idc = IDC_FPS;

                    onButtonClick = QUOTE([MODE_FPS] call FUNC(cam_setCameraMode));

                    x = W_PART(5.8);
                    y = H_PART(0.8);
                    w = W_PART(1.63);
                    h = H_PART(1.37);

                    colorBackground[] = {0,0,0,0};
                    colorBackgroundDisabled[] = {0,0,0,0};
                    colorBackgroundActive[] = {0,0,0,0};
                    colorFocused[] = {0,0,0,0};
                    text = CAM_ICON_FPS;
                    tooltip = "$STR_A3_Spectator_1pp_camera_tooltip";

                };
            };
        };
        class MapGroup: RscControlsGroupNoScrollbars {
            idc = IDC_MAP_GROUP;
            x = 0;
            y = 0.1;
            w = 1;
            h = 0.8;
            class controls {
                class MapHeader: RscText {
                    x = 0;
                    y = 0;
                    w = 1;
                    h = 0.05;
                    colorBackground[] = {0,0,0,0.75};
                };
                class MapFooter: RscText {
                    idc = IDC_MAP_FOOTER;
                    x = 0;
                    y = 0.75;
                    w = 1;
                    h = 0.05;
                    text = "";
                    style = 2;
                    colorBackground[] = {0,0,0,0.75};
                    sizeEx = H_PART(1);
                };
                class GameTimeText: RscText {
                    idc = IDC_TIME;
                    x = 0.01;
                    y = 0.76;
                    w = 0.29;
                    h = 0.03;
                    text = "00:00:00";
                    sizeEx = H_PART(1);
                };
                class MapTitle: RscText {
                    idc = IDC_MAP_TITLE;
                    x = 0.01;
                    y = 0.01;
                    w = 0.69;
                    h = 0.03;
                    text = "";
                    colorText[] = {1,1,1,1};
                    sizeEx = H_PART(1);
                };
                class SpectatorsCount: RscText {
                    idc = IDC_MAP_SPEC_NUM;
                    x = 0.97;
                    y = 0.01;
                    w = 0.03;
                    h = 0.03;
                    text = "";
                    colorText[] = {1,1,1,1};
                    sizeEx = H_PART(1);
                };
                class SpectatorsIcon: RscPictureKeepAspect {
                    x = 0.94;
                    y = 0.01;
                    w = 0.03;
                    h = 0.03;
                    text = CAM_ICON_FPS_SELECTED;
                };
            };
        };
        class Map: RscMapControl {
            idc = IDC_MAP;

            onDraw = QUOTE(_this call FUNC(ui_handleMapDraw));
            onMouseButtonClick = QUOTE(_this call FUNC(ui_handleMapClick));

            x = 0;
            y = 0.15;
            w = 1;
            h = 0.7;

            maxSatelliteAlpha = 0.75;
            colorBackground[] = {1,1,1,1};
        };
        class HelpBackground: RscText {
            idc = IDC_HELP_BACK;
            x = safezoneX + safezoneW - W_PART(12);
            y = safezoneY + safezoneH - H_PART(8);
            w = W_PART(12);
            h = H_PART(8);
            colorBackground[] = {0,0,0,0.75};
        };
        class Help: RscListNBox {
            class ListScrollBar: ScrollBar {};
            disableOverflow = 0;
            rowHeight = H_PART(1);
            idc = IDC_HELP;
            x = safezoneX + safezoneW - W_PART(12);
            y = safezoneY + safezoneH - H_PART(12);
            w = W_PART(12);
            h = H_PART(12);
        };
        class FocusInfo: RscControlsGroupNoScrollbars {
            idc = IDC_WIDGET;
            x = X_PART(12.1);
            y = Y_PART(24);
            w = W_PART(16);
            h = H_PART(3.5);
            class controls {
                class UpperBackground: RscText {
                    x = W_PART(3.5);
                    y = 0;
                    w = W_PART(12.4);
                    h = H_PART(1.4);
                    colorBackground[] = {0,0,0,0.75};
                };
                class LowerLeftBackground: RscText {
                    idc = CTRL_WIDGET_WEAPON_BACK;
                    x = W_PART(9.8);
                    y = H_PART(1.5);
                    w = W_PART(6.1);
                    h = H_PART(2);
                    colorBackground[] = {1,1,1,0.4};
                };
                class LowerRightBackground: RscText {
                    x = W_PART(3.5);
                    y = H_PART(1.5);
                    w = W_PART(6.2);
                    h = H_PART(2);
                    colorBackground[] = {0,0,0,0.75};
                };
                class AvatarBackground: RscText {
                    x = W_PART(-0.2);
                    y = 0;
                    w = W_PART(3.6);
                    h = H_PART(3.5);
                    colorBackground[] = {0,0,0,0.75};
                };
                class VehicleType: RscPicture {
                    idc = IDC_WIDGET_VEHICLE;
                    text = "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa";
                    x = W_PART(13.5);
                    y = H_PART(0.3);
                    w = W_PART(2.1);
                    h = H_PART(1);
                };
                class UnitType: RscPictureKeepAspect {
                    idc = IDC_WIDGET_UNIT;
                    text = "\A3\ui_f\data\map\vehicleicons\iconMan_ca.paa";
                    x = W_PART(14.6);
                    y = H_PART(0.3);
                    w = W_PART(1);
                    h = H_PART(1);
                };
                class Name: RscText {
                    shadow = 0;
                    idc = IDC_WIDGET_NAME;
                    text = "";
                    x = W_PART(3.6);
                    y = 0;
                    w = W_PART(9.9);
                    h = H_PART(1.4);
                    sizeEx = H_PART(1);
                };
                class Avatar: RscPictureKeepAspect {
                    idc = IDC_WIDGET_AVATAR;
                    text = "a3\Ui_f\data\GUI\Cfg\UnitInsignia\bi_ca.paa";
                    x = 0;
                    y = H_PART(0.3);
                    w = W_PART(3.2);
                    h = H_PART(2.9);
                };
                class Kills: RscPictureKeepAspect {
                    text = "a3\Ui_f\data\IGUI\Cfg\MPTable\infantry_ca.paa";
                    x = W_PART(3.6);
                    y = H_PART(1.6);
                    w = W_PART(0.8);
                    h = H_PART(0.8);
                };
                class LandKills: RscPictureKeepAspect {
                    text = "a3\Ui_f\data\IGUI\Cfg\MPTable\soft_ca.paa";
                    x = W_PART(4.64);
                    y = H_PART(1.6);
                    w = W_PART(0.8);
                    h = H_PART(0.8);
                };
                class ArmoredKills: RscPictureKeepAspect {
                    text = "a3\Ui_f\data\IGUI\Cfg\MPTable\armored_ca.paa";
                    x = W_PART(5.76);
                    y = H_PART(1.6);
                    w = W_PART(0.8);
                    h = H_PART(0.8);
                };
                class AirKills: RscPictureKeepAspect {
                    text = "a3\Ui_f\data\IGUI\Cfg\MPTable\air_ca.paa";
                    x = W_PART(6.9);
                    y = H_PART(1.6);
                    w = W_PART(0.8);
                    h = H_PART(0.8);
                };
                class Deaths: RscPictureKeepAspect {
                    text = "a3\Ui_f\data\IGUI\Cfg\MPTable\killed_ca.paa";
                    x = W_PART(7.92);
                    y = H_PART(1.6);
                    w = W_PART(0.8);
                    h = H_PART(0.8);
                };
                class Total: RscPictureKeepAspect {
                    text = "a3\Ui_f\data\IGUI\Cfg\MPTable\total_ca.paa";
                    x = W_PART(8.86);
                    y = H_PART(1.6);
                    w = W_PART(0.8);
                    h = H_PART(0.8);
                };
                class Kills_Count: RscText {
                    style = 2;
                    shadow = 0;
                    idc = IDC_WIDGET_KILLS;
                    text = "";
                    x = W_PART(3.6);
                    y = H_PART(2.5);
                    w = W_PART(0.9);
                    h = H_PART(0.9);
                    sizeEx = H_PART(0.7);
                };
                class LandKills_Count: RscText {
                    style = 2;
                    shadow = 0;
                    idc = IDC_WIDGET_LAND;
                    text = "";
                    x = W_PART(4.6);
                    y = H_PART(2.5);
                    w = W_PART(0.8);
                    h = H_PART(0.9);
                    sizeEx = H_PART(0.7);
                };
                class ArmoredKills_Count: RscText {
                    style = 2;
                    shadow = 0;
                    idc = IDC_WIDGET_ARMORED;
                    text = "";
                    x = W_PART(5.7);
                    y = H_PART(2.5);
                    w = W_PART(0.8);
                    h = H_PART(0.9);
                    sizeEx = H_PART(0.7);
                };
                class AirKills_Count: RscText {
                    style = 2;
                    shadow = 0;
                    idc = IDC_WIDGET_AIR;
                    text = "";
                    x = W_PART(6.8);
                    y = H_PART(2.5);
                    w = W_PART(0.8);
                    h = H_PART(0.9);
                    sizeEx = H_PART(0.7);
                };
                class Deaths_Count: RscText {
                    style = 2;
                    shadow = 0;
                    idc = IDC_WIDGET_DEATHS;
                    text = "";
                    x = W_PART(7.9);
                    y = H_PART(2.5);
                    w = W_PART(0.8);
                    h = H_PART(0.9);
                    sizeEx = H_PART(0.7);
                };
                class Total_Count: RscText {
                    style = 2;
                    shadow = 0;
                    idc = IDC_WIDGET_TOTAL;
                    text = "";
                    x = W_PART(8.8);
                    y = H_PART(2.5);
                    w = W_PART(0.8);
                    h = H_PART(0.9);
                    sizeEx = H_PART(0.7);
                };
                class WeaponPicture: RscPictureKeepAspect {
                    idc = IDC_WIDGET_WEAPON;
                    text = "A3\weapons_F\Rifles\MX\data\UI\gear_mx_rifle_X_CA.paa";
                    x = W_PART(9.9);
                    y = H_PART(1.6);
                    w = W_PART(5.9);
                    h = H_PART(1.8);
                };
            };
        };
    };
};

