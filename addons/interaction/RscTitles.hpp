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
    w = 2.0 / 16 * safezoneW;
    h = 0.3 / 9 * safezoneH;

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

class IGUIBack;
class RscListbox;
class RscText;
class RscPicture;
class RscControlsGroupNoScrollbars;

#define X_OFFSET 0.2

class RscACE_SelectAnItem {
    idd = 8854;
    movingEnable = 0;

    class controls {
        class back: IGUIBack {
            x = X_OFFSET;
            y = 0;
            w = 0.6;
            h = 0.71;
            colorBackground[] = {0, 0, 0, 0.2};
        };
        class header: RscText{
            idc = 8870;
            x = X_OFFSET + 0.005;
            y = 0.005;
            w = 0.59;
            h = 0.05;
            style = 0x02;
            text = "";
        };
        class itemList: RscListBox {
            onMouseButtonDblClick = QUOTE(_this call DFUNC(onSelectMenuDblClick));
            idc = 8866;
            x = X_OFFSET + 0.005;
            w = 0.59;
            h = 0.54;
            y = 0.06;
        };

        class cancelBtnBackground: ACE_Interaction_Button_Base {
            type = 0;
            style = 2;
            idc = -1;
            colorBackground[] = {0,0,0,0.5};
            colorBackgroundDisabled[] = {0,0,0,0.5};
            x = X_OFFSET + 0.005;
            w = 0.15;
            h = 0.1;
            y = 0.605;
        };
        class approveBtnBackground: ACE_Interaction_Button_Base {
            type = 0;
            style = 2;
            idc = -1;
            colorBackground[] = {0,0,0,0.5};
            colorBackgroundDisabled[] = {0,0,0,0.5};
            x = X_OFFSET + 0.445;
            y = 0.605;
            h = 0.1;
            w = 0.15;
        };

        class cancelBtn: ACE_Interaction_Button_Base {
            idc = 8855;
            x = X_OFFSET + 0.005;
            w = 0.15;
            h = 0.1;
            y = 0.605;
            style = 2;
            text = CSTRING(Back);
            action = QUOTE(call DFUNC(hideMenu););   //'Default' call DFUNC(openMenu);    'Default' call DFUNC(openMenuSelf);
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {1,1,1,0.2};
            colorFocused[] = {0,0,0,0};
        };
        class approveBtn: ACE_Interaction_Button_Base {
            idc = 8860;
            x = X_OFFSET + 0.445;
            y = 0.605;
            h = 0.1;
            w = 0.15;
            style = 2;
            text = CSTRING(MakeSelection);
            action = QUOTE(call DFUNC(hideMenu););
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {1,1,1,0.2};
            colorFocused[] = {0,0,0,0};
        };
    };
};

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
                x = 20 * GUI_GRID_W + GUI_GRID_CENTER_X;
                y = 17.5 * GUI_GRID_H;
                w = GUI_GRID_H;
                h = GUI_GRID_H;
            };
            class TextLMB: RscText {
                idc = IDC_MOUSEHINT_LMB_TEXT;
                text = "";
                x = 21.1 * GUI_GRID_W + GUI_GRID_CENTER_X;
                y = 17.45 * GUI_GRID_H;
                w = 24 * GUI_GRID_W;
                h = GUI_GRID_H;
                sizeEx = GUI_GRID_H;
            };
            class IconMMB: IconLMB {
                idc = IDC_MOUSEHINT_MMB;
                text = QPATHTOF(UI\mouse_scroll_ca.paa);
                y = 18.55 * GUI_GRID_H;
            };
            class TextMMB: TextLMB {
                idc = IDC_MOUSEHINT_MMB_TEXT;
                y = 18.5 * GUI_GRID_H;
            };
            class IconRMB: IconLMB {
                idc = IDC_MOUSEHINT_RMB;
                text = QPATHTOF(UI\mouse_right_ca.paa);
                y = 19.6 * GUI_GRID_H;
            };
            class TextRMB: TextLMB {
                idc = IDC_MOUSEHINT_RMB_TEXT;
                y = 19.55 * GUI_GRID_H;
            };
        };
    };
};

class GVAR(RscExtraKey): RscControlsGroupNoScrollbars {
    idc = IDC_MOUSEHINT_EXTRA;
    x = 0;
    y = 0;
    w = 40 * GUI_GRID_W;
    h = GUI_GRID_H;
    class controls {
        class Name: RscText {
            idc = IDC_MOUSEHINT_EXTRA_NAME;
            style = 1;
            x = 0;
            y = 0;
            w = 21.5 * GUI_GRID_W + GUI_GRID_CENTER_X;
            h = GUI_GRID_H;
            sizeEx = GUI_GRID_H;
            font = "EtelkaMonospaceProBold";
        };
        class Text: RscText {
            idc = IDC_MOUSEHINT_EXTRA_TEXT;
            x = 21.1 * GUI_GRID_W + GUI_GRID_CENTER_X;
            y = 0;
            w = 24 * GUI_GRID_W;
            h = GUI_GRID_H;
            sizeEx = GUI_GRID_H;
        };
    };
};
