class IGUIBack;
class RscCheckBox;
class RscListBox;
class RscEdit;
class RscButtonMenu;
class RscText;
class RscPicture;

class GVAR(DialogLoadout) {
    idd = 654654;
    name = QGVAR(DialogLoadout);
    enableSimulation = 1;

    class Controls {
        class TextTitlebar: RscText {
            idc = 100;
            text = CSTRING(AircraftLoadoutTitle);
            x = 0.158349 * safezoneW + safezoneX;
            y = 0.262 * safezoneH + safezoneY;
            w = 0.683039 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R',0.69])","(profileNamespace getVariable ['GUI_BCG_RGB_G',0.75])","(profileNamespace getVariable ['GUI_BCG_RGB_B',0.5])",1};
        };
        class BackgroundIGUIBack: IGUIBack {
            idc = 110;
            x = 0.15848 * safezoneW + safezoneX;
            y = 0.29 * safezoneH + safezoneY;
            w = 0.683039 * safezoneW;
            h = 0.448 * safezoneH;
            colorBackground[] = {0,0,0,0.3};
        };
        class BackgroundPicture: IGUIBack {
            idc = 111;
            x = 0.171616 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.440035 * safezoneW;
            h = 0.392 * safezoneH;
            colorBackground[] = {0.3,0.3,0.3,1};
        };
        class PictureAircraft: RscPicture {
            idc = 120;
            x = 0.245174 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.294231 * safezoneW;
            h = 0.392 * safezoneH;
        };
        class CheckboxMirror: RscCheckBox {
            idc = 130;
            x = 0.171616 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.0131354 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class TextMirror: RscText {
            idc = 140;
            text = CSTRING(Mirror);
            x = 0.184751 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.0656768 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };
        class TextListTitle: RscText {
            idc = 150;
            x = 0.624786 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.203437 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };
        class ListLoadouts: RscListBox {
            idc = 160;
            x = 0.624786 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.203437 * safezoneW;
            h = 0.294 * safezoneH;
        };
        class EditLoadoutName: RscEdit {
            idc = 170;
            x = 0.624786 * safezoneW + safezoneX;
            y = 0.64 * safezoneH + safezoneY;
            w = 0.203437 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class ButtonSave: RscButtonMenu {
            idc = 180;
            action = QUOTE(call FUNC(onButtonSave));
            text = "$STR_disp_int_save";
            x = 0.624786 * safezoneW + safezoneX;
            y = 0.682 * safezoneH + safezoneY;
            w = 0.0590625 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class ButtonLoad: RscButtonMenu {
            idc = 190;
            action = QUOTE(call FUNC(onButtonLoad));
            text = "$STR_disp_int_load";
            x = 0.69703 * safezoneW + safezoneX;
            y = 0.682 * safezoneH + safezoneY;
            w = 0.0590625 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class ButtonDelete: RscButtonMenu {
            idc = 200;
            action = QUOTE(call FUNC(onButtonDelete));
            text = "$STR_disp_delete";
            x = 0.769275 * safezoneW + safezoneX;
            y = 0.682 * safezoneH + safezoneY;
            w = 0.0590625 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class ButtonApply: RscButtonMenu {
            idc = 210;
            action = QUOTE(call FUNC(onButtonApply));
            text = "$STR_ui_debug_but_apply";
            x = 0.683895 * safezoneW + safezoneX;
            y = 0.738 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class ButtonClose: RscButtonMenu {
            text = "$STR_disp_cancel";
            action = QUOTE(call FUNC(onButtonClose));
            x = 0.769275 * safezoneW + safezoneX;
            y = 0.738 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class TextBanner: RscText {
            idc = 220;
            text = CSTRING(BannerText);
            x = 0.171616 * safezoneW + safezoneX;
            y = 0.738 * safezoneH + safezoneY;
            w = 0.440035 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {0.5,0,0,0.5};
        };
        class PictureRearm: RscPicture {
            idc = 230;
            text = "a3\ui_f\data\IGUI\Cfg\simpleTasks\types\rearm_ca.paa";
            x = 0.171616 * safezoneW + safezoneX;
            y = 0.738 * safezoneH + safezoneY;
            w = 0.0131354 * safezoneW;
            h = 0.028 * safezoneH;
        };
    };
};
