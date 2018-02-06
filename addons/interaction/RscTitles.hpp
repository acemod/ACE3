
#define HSPACE 0.5-2.0/16/2
#define VSPACE 0.5-0.3/9/2

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

class RscListbox;
class IGUIBack;
class RscText;

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
            onMouseButtonDblClick = "_this call ACE_Interaction_fnc_onSelectMenuDblClick";
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
            action = "call ACE_Interaction_fnc_hideMenu;";   //'Default' call ACE_Interaction_fnc_openMenu;    'Default' call ACE_Interaction_fnc_openMenuSelf;
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
            action = "call ACE_Interaction_fnc_hideMenu;";
            colorBackground[] = {0,0,0,0};
            colorBackgroundDisabled[] = {0,0,0,0};
            colorBackgroundActive[] = {1,1,1,0.2};
            colorFocused[] = {0,0,0,0};
        };
    };
};

#define GUI_GRID_W  (0.025)
#define GUI_GRID_H  (0.04)

class RscPicture;
class RscInteractionIcon: RscPicture {
    x = 19.25 * GUI_GRID_W;
    y = 15.75 * GUI_GRID_H;
    w = 2*GUI_GRID_H;
    h = 2*GUI_GRID_H;
};

class RscInteractionHelperIcon: RscInteractionIcon {
    x = 20 * GUI_GRID_W;
    y = 16 * GUI_GRID_H;
    w = GUI_GRID_H;
    h = GUI_GRID_H;
};

class RscInteractionText: RscText{
    x = 21 * GUI_GRID_W;
    y = 16 * GUI_GRID_H;
    w = 24 * GUI_GRID_W;
    h = 1.5 * GUI_GRID_H;
};
class RscInteractionText_right: RscText{
    style = 1; // right aligned text
};

class RscTitles {
    class GVAR(InteractionHelper) {
        idd = 9930;
        enableSimulation = 1;
        movingEnable = 0;
        fadeIn=0.5;
        fadeOut=0.5;
        duration = 10e10;
        onLoad = "uiNamespace setVariable ['ACE_Helper_Display', _this select 0];";

        class controls {
            class SelectIcon: RscInteractionHelperIcon{
                idc = 1200;
                text = QPATHTOF(UI\mouse_left_ca.paa);
                y = 17.5 * GUI_GRID_H;
            };
            class SelectText: RscInteractionText{
                idc = 1000;
                y = 17 * GUI_GRID_H;
                text = CSTRING(MakeSelection);
            };
            class GoBackIcon: RscInteractionHelperIcon{
                idc = 1201;
                text = QPATHTOF(UI\mouse_right_ca.paa);
                y = 19.5 * GUI_GRID_H;
            };
            class GoBackText: RscInteractionText{
                idc = 1001;
                y = 19 * GUI_GRID_H;
                text = CSTRING(Back);
            };
            class ScrollIcon: RscInteractionHelperIcon{
                idc = 1202;
                text = QPATHTOF(UI\mouse_scroll_ca.paa);
                y = 18.5 * GUI_GRID_H;
            };
            class ScrollText: RscInteractionText{
                idc = 1002;
                y = 18 * GUI_GRID_H;
                text = CSTRING(ScrollHint);
            };
        };
    };
};
