class ACE_Interaction_Button_Base {
    tooltip = "";
    //action = "ACE_Interaction_isMousePressed = true;(findDisplay 1713999) closeDisplay 1;_action = ACE_Interaction_Buttons select ACE_Interaction_SelectedButton;ACE_Interaction_SelectedButton = -1; if (call (_action select 2)) then {call (_action select 1)};";
    action = "";

    idc = -1;
    type = 1;
    text = "";
    font = "RobotoCondensed";
    sizeEx = "0.8 / 40 / (getResolution select 5)";
    shadow = 2;

    style = 2;
    x = 0;
    y = 0;
    w = "2.0 / 16 * safeZoneW";
    h = "0.3 / 9 * safeZoneH";

    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;

    colorText[] = {1,1,1,1};
    colorDisabled[] = {0.5,0.5,0.5,1};
    colorBackground[] = {0,0,0,0.8};
    colorBackgroundDisabled[] = {0,0,0,0.8};
    colorBackgroundActive[] = {1,1,1,0};
    colorFocused[] = {1,1,1,1};
    colorShadow[] = {0,0,0,0};
    colorBorder[] = {1,1,1,0.8};

    soundEnter[] = {"\A3\ui_f\data\sound\RscButton\soundEnter",0.09,1};
    soundPush[] = {"\A3\ui_f\data\sound\RscButton\soundPush",0.09,1};
    soundClick[] = {"\A3\ui_f\data\sound\RscButton\soundClick",0.09,1};
    soundEscape[] = {"\A3\ui_f\data\sound\RscButton\soundEscape",0.09,1};
};

class RscText;
class RscStructuredText;
class RscPicture;
class RscControlsGroupNoScrollbars;

class RscTitles {
    class GVAR(RscMouseHint) {
        idd = IDD_MOUSEHINT;
        fadeIn = 0;
        fadeOut = 0;
        duration = 999999;
        enableSimulation = 1;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(mouseHint),_this select 0)]);
        class controls {
            class IconLMB: RscPicture {
                idc = IDC_MOUSEHINT_LMB;
                text = QPATHTOF(UI\mouse_left_ca.paa);
                x = QUOTE(20 * GUI_GRID_W + GUI_GRID_CENTER_X);
                y = QUOTE(17.5 * GUI_GRID_H);
                w = QUOTE(GUI_GRID_H);
                h = QUOTE(GUI_GRID_H);
            };
            class TextLMB: RscText {
                idc = IDC_MOUSEHINT_LMB_TEXT;
                text = "";
                x = QUOTE(21.1 * GUI_GRID_W + GUI_GRID_CENTER_X);
                y = QUOTE(17.45 * GUI_GRID_H);
                w = QUOTE(24 * GUI_GRID_W);
                h = QUOTE(GUI_GRID_H);
                sizeEx = QUOTE(GUI_GRID_H);
            };
            class IconMMB: IconLMB {
                idc = IDC_MOUSEHINT_MMB;
                text = QPATHTOF(UI\mouse_scroll_ca.paa);
                y = QUOTE(18.55 * GUI_GRID_H);
            };
            class TextMMB: TextLMB {
                idc = IDC_MOUSEHINT_MMB_TEXT;
                y = QUOTE(18.5 * GUI_GRID_H);
            };
            class IconRMB: IconLMB {
                idc = IDC_MOUSEHINT_RMB;
                text = QPATHTOF(UI\mouse_right_ca.paa);
                y = QUOTE(19.6 * GUI_GRID_H);
            };
            class TextRMB: TextLMB {
                idc = IDC_MOUSEHINT_RMB_TEXT;
                y = QUOTE(19.55 * GUI_GRID_H);
            };
        };
    };
};

class GVAR(RscExtraKey): RscControlsGroupNoScrollbars {
    idc = IDC_MOUSEHINT_EXTRA;
    x = 0;
    y = 0;
    w = QUOTE(40 * GUI_GRID_W);
    h = QUOTE(GUI_GRID_H);
    class controls {
        class Name: RscStructuredText {
            idc = IDC_MOUSEHINT_EXTRA_NAME;
            style = 1;
            x = 0;
            y = 0;
            w = QUOTE(21.5 * GUI_GRID_W + GUI_GRID_CENTER_X);
            h = QUOTE(GUI_GRID_H);
            sizeEx = QUOTE(GUI_GRID_H);
            size = QUOTE(GUI_GRID_H);
            class Attributes {
                font = "EtelkaMonospaceProBold";
                color = "#ffffff";
                align = "right";
                valign = "middle";
                shadow = 1;
                shadowColor = "#000000";
                size = 1;
            };
        };
        class Text: RscText {
            idc = IDC_MOUSEHINT_EXTRA_TEXT;
            x = QUOTE(21.1 * GUI_GRID_W + GUI_GRID_CENTER_X);
            y = QUOTE(0);
            w = QUOTE(24 * GUI_GRID_W);
            h = QUOTE(GUI_GRID_H);
            sizeEx = QUOTE(GUI_GRID_H);
        };
    };
};
