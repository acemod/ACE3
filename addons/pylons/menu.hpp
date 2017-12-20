// combo box that looks good + doesn't get cut off
class RscCombo;
class GVAR(CtrlCombo): RscCombo {
    arrowEmpty = "\a3\3DEN\Data\Controls\ctrlCombo\arrowEmpty_ca.paa";
    arrowFull = "\a3\3DEN\Data\Controls\ctrlCombo\arrowFull_ca.paa";
    colorSelectBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.13])","(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.54])","(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.21])",1};
};

class IGUIBack;
class RscCheckBox;
class RscListBox;
class RscEdit;
class RscButtonMenu;
class RscText;
class RscPictureKeepAspect;

class GVAR(DialogLoadout) {
    idd = ID_DIALOG;
    name = QGVAR(DialogLoadout);
    enableSimulation = 1;

    class Controls {
        class TextTitlebar: RscText {
            idc = ID_TEXT_TITLEBAR;
            text = CSTRING(AircraftLoadoutTitle);
            x = 0.15835 * safezoneW + safezoneX;
            y = 0.262 * safezoneH + safezoneY;
            w = 0.68304 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {"(profileNamespace getVariable ['GUI_BCG_RGB_R', 0.13])","(profileNamespace getVariable ['GUI_BCG_RGB_G', 0.54])","(profileNamespace getVariable ['GUI_BCG_RGB_B', 0.21])",1};
        };
        class BackgroundDialog: IGUIBack {
            idc = ID_BACKGROUND_DIALOG;
            x = 0.15835 * safezoneW + safezoneX;
            y = 0.29 * safezoneH + safezoneY;
            w = 0.68304 * safezoneW;
            h = 0.448 * safezoneH;
            colorBackground[] = {0,0,0,0.3};
        };
        class BackgroundPicture: IGUIBack {
            idc = ID_BACKGROUND_PICTURE;
            x = 0.171616 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.440035 * safezoneW;
            h = 0.392 * safezoneH;
            colorBackground[] = {0.3,0.3,0.3,1};
        };
        class PictureAircraft: RscPictureKeepAspect {
            idc = ID_PICTURE_AIRCRAFT;
            x = 0.171616 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.440035 * safezoneW;
            h = 0.392 * safezoneH;
        };
        class CheckboxMirror: RscCheckBox {
            idc = ID_CHECKBOX_MIRROR;
            x = 0.171616 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.0165 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class TextMirror: RscText {
            idc = ID_TEXT_MIRROR;
            text = "$STR_3DEN_Object_Attribute_PylonsMirror_displayName";
            tooltip="$STR_3DEN_Object_Attribute_PylonsMirror_tooltip";
            x = 0.188116 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.0656768 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };
        class CheckboxFRIES: RscCheckBox {
            idc = ID_CHECKBOX_FRIES;
            x = 0.171616 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.0165 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class TextFRIES: RscText {
            idc = ID_TEXT_FRIES;
            text = "FRIES";
            x = 0.188116 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.0656768 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };
        class TextListTitle: RscText {
            idc = ID_TEXT_LISTTITLE;
            x = 0.624786 * safezoneW + safezoneX;
            y = 0.318 * safezoneH + safezoneY;
            w = 0.203437 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {0,0,0,0.5};
        };
        class ListLoadouts: RscListBox {
            idc = ID_LIST_LOADOUTS;
            x = 0.624786 * safezoneW + safezoneX;
            y = 0.346 * safezoneH + safezoneY;
            w = 0.203437 * safezoneW;
            h = 0.294 * safezoneH;
        };
        class EditLoadoutName: RscEdit {
            idc = ID_EDIT_LOADOUTNAME;
            x = 0.624786 * safezoneW + safezoneX;
            y = 0.64 * safezoneH + safezoneY;
            w = 0.203437 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {0,0,0,0.7};
        };
        class ButtonSave: RscButtonMenu {
            idc = ID_BUTTON_SAVE;
            action = QUOTE(call FUNC(onButtonSave));
            text = "$STR_disp_int_save";
            x = 0.624786 * safezoneW + safezoneX;
            y = 0.682 * safezoneH + safezoneY;
            w = 0.0590625 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class ButtonLoad: RscButtonMenu {
            idc = ID_BUTTON_LOAD;
            action = QUOTE(call FUNC(onButtonLoad));
            text = "$STR_disp_int_load";
            x = 0.69703 * safezoneW + safezoneX;
            y = 0.682 * safezoneH + safezoneY;
            w = 0.0590625 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class ButtonDelete: RscButtonMenu {
            idc = ID_BUTTON_DELETE;
            action = QUOTE(call FUNC(onButtonDelete));
            text = "$STR_disp_delete";
            x = 0.769275 * safezoneW + safezoneX;
            y = 0.682 * safezoneH + safezoneY;
            w = 0.0590625 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class ButtonApply: RscButtonMenu {
            idc = ID_BUTTON_APPLY;
            action = QUOTE(call FUNC(onButtonApply));
            text = "$STR_ui_debug_but_apply";
            x = 0.683895 * safezoneW + safezoneX;
            y = 0.738 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class ButtonClose: RscButtonMenu {
            idc = ID_BUTTON_CLOSE;
            text = "$STR_disp_cancel";
            action = QUOTE(call FUNC(onButtonClose));
            x = 0.769275 * safezoneW + safezoneX;
            y = 0.738 * safezoneH + safezoneY;
            w = 0.0721875 * safezoneW;
            h = 0.028 * safezoneH;
        };
        class TextBanner: RscText {
            idc = ID_TEXT_BANNER;
            text = CSTRING(BannerText);
            x = 0.171616 * safezoneW + safezoneX;
            y = 0.738 * safezoneH + safezoneY;
            w = 0.440035 * safezoneW;
            h = 0.028 * safezoneH;
            colorBackground[] = {0.5,0,0,0.5};
        };
    };
};
