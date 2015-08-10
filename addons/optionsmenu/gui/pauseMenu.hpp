
class ACE_Open_SettingsMenu_BtnBase : ACE_gui_buttonBase {
    class Attributes {
        font = "PuristaMedium";
        color = "#E5E5E5";
        align = "left";
        shadow = "true";
    };
    class AttributesImage {
        font = "PuristaMedium";
        color = "#E5E5E5";
        align = "left";
    };
    class HitZone {
        left = 0.0;
        top = 0.0;
        right = 0.0;
        bottom = 0.0;
    };
    class ShortcutPos {
        left = 0;
        top = 0;
        w = 0;
        h = 0;
    };
    class TextPos {
        left = 0.01;
        top = 0;
        right = 0;
        bottom = 0;
    };
    animTextureDefault = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureDisabled = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureFocused = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureNormal = "#(argb,8,8,3)color(1,1,1,1)";
    animTextureOver = "#(argb,8,8,3)color(1,1,1,1)";
    animTexturePressed = "#(argb,8,8,3)color(1,1,1,1)";
    color2[] = {0,0,0,1};
    color[] = {1,1,1,1};
    //colorBackground2[] = {0.75,0.75,0.75,1};
    //colorBackground[] = {0,0,0,0.8};
    colorBackground[] = {1, 0.647, 0, 0.5};
    colorBackground2[] = {1, 0.647, 0, 0.5};
    colorBackgroundFocused[] = {1, 1, 1, 0};
    colorDisabled[] = {1,1,1,0.25};
    colorFocused[] = {0,0,0,1};
    colorText[] = {1,1,1,1};
    default = 0;
    font = "PuristaMedium";
    idc = -1;
    period = 1.2;
    periodFocus = 1.2;
    periodOver = 1.2;
    shadow = 0;
    shortcuts[] = {};
    size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    soundClick[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundClick",0.09,1};
    soundEnter[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEnter",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundEscape",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButtonMenu\soundPush",0.09,1};
    style = "0x02 + 0xC0";
    text = CSTRING(OpenConfigMenu);
    textureNoShortcut = "#(argb,8,8,3)color(0,0,0,0)";
    tooltip = "";
    tooltipColorBox[] = {1,1,1,1};
    tooltipColorShade[] = {0,0,0,0.65};
    tooltipColorText[] = {1,1,1,1};
    type = 16;
    x = "1 * (((safezoneW / safezoneH) min 1.2) / 40) + (safezoneX)";
    y = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
    w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    action = "(findDisplay 49) closeDisplay 0; createDialog 'ACE_settingsMenu';";
};

class RscStandardDisplay;
class RscDisplayMPInterrupt: RscStandardDisplay {
    class controls {
        class ACE_Open_settingsMenu_Btn : ACE_Open_SettingsMenu_BtnBase {};
    };
};
class RscDisplayInterruptEditorPreview: RscStandardDisplay {
    class controls {
        class ACE_Open_settingsMenu_Btn : ACE_Open_SettingsMenu_BtnBase {};
    };
};
class RscDisplayInterrupt: RscStandardDisplay {
    class controls {
        class ACE_Open_settingsMenu_Btn : ACE_Open_SettingsMenu_BtnBase {};
    };
};
class RscDisplayInterruptEditor3D: RscStandardDisplay {
    class controls {
        class ACE_Open_settingsMenu_Btn : ACE_Open_SettingsMenu_BtnBase {};
    };
};
class RscDisplayMovieInterrupt: RscStandardDisplay {
    class controls {
        class ACE_Open_settingsMenu_Btn : ACE_Open_SettingsMenu_BtnBase {};
    };
};
class RscDisplayMain: RscStandardDisplay {
    //Hide the button if there is no world (-world=empty)
    //Seems odd to use onMouseMoving, but I don't want to overload onLoad
    onMouseMoving = QUOTE(((_this select 0) displayCtrl 80085) ctrlShow (missionName != '');  _this execVM QUOTE(QUOTE(PATHTOF(script_loadMainMenuBox.sqf))););

    class controls {
        class ACE_Open_settingsMenu_Btn : ACE_Open_SettingsMenu_BtnBase {
            action = "if (missionName != '') then {createDialog 'ACE_settingsMenu';};";
            y = "4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + safezoneY";
            idc = 80085;
        };

        class ACE_news: RscControlsGroupNoScrollbars {
            idc = 80086;
            x = "safezoneX + safezoneW - (16 *(((safezoneW / safezoneH) min 1.2) / 40))";
            y = "safezoneY + (18.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))";
            w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
            h = "4.95 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
            class controls {
                class ACE_NewsTitle: RscText {
                    text = CSTRING(aceNews);
                    colorBackground[] = {(162/255),(28/255),(28/255),0.8};
                    idc = -1;
                    x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "0 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "15 *(((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                };
                class ACE_VersionInfo: RscText {
                    idc = 68;
                    x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "1.1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    colorBackground[] = {0,0,0,0.5};
                };
                class ACE_NewsBackground: RscText {
                    idc = -1;
                    x = "0 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "2.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "15 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "5.75 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    colorBackground[] = {0,0,0,0.5};
                };
                class ACE_NewsText: RscHTML {
                    idc = 69;
                    x = "0.5 * (((safezoneW / safezoneH) min 1.2) / 40)";
                    y = "2.2 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
                    w = "14 *  (((safezoneW / safezoneH) min 1.2) / 40)";
                    h = "2.75 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";

                    shadow = 0;
                    class H1 {
                        font = "PuristaMedium";
                        fontBold = "PuristaLight";
                        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.4)";
                    };
                    class H2: H1 {
                        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1.2)";
                        font = "PuristaLight";
                    };
                    class P: H1 {
                        sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                        fontBold = "PuristaLight";
                    };
                    colorBold[] = {0.6,0.6,0.6,1};
                    colorLink[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
                    colorLinkActive[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.69])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.75])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.5])",1};
                };
            };
        };
    };
};
