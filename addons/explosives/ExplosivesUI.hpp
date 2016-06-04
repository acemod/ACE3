#define GUI_GRID_X (0)
#define GUI_GRID_Y (0)
#define GUI_GRID_W (0.025)
#define GUI_GRID_H (0.04)

#define ST_CENTER 0x02
#define X_OFFSET 0.25

class RscText;
class RscButton;
class RscXSliderH;
class IGUIBack;
class RscPicture;
class RscEdit;

class Rsc_ACE_CallScreen_Edit:RscEdit {
    canModify = 1;
    colorBackground[] = {0,0,0,0};
    colorText[] = {0,0,0,1};
    colorDisabled[] = {1,1,1,0.25};
    colorSelection[] = {
        "(profilenamespace getVariable ['GUI_BCG_RGB_R',0.69])",
        "(profilenamespace getVariable ['GUI_BCG_RGB_G',0.75])",
        "(profilenamespace getVariable ['GUI_BCG_RGB_B',0.5])",
        1
    };
    text = "";
    style = "0x00 + 0x40 + 0x200";
    shadow = 1;
    SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 20) * 1)";
    x = 0.288594 * safezoneW + safezoneX;
    w = 0.0825 * safezoneW;
    h = 0.044 * safezoneH;
};
class Rsc_ACE_HiddenButton:RscButton {
    colorText[] = {0, 0, 0, 0};
    colorDisabled[] = {0, 0, 0, 0};
    colorBackground[] = {0, 0, 0, 0};
    colorBackgroundDisabled[] = {0, 0, 0, 0};
    colorBackgroundActive[] = {0, 0, 0, 0};
    colorFocused[] = {0, 0, 0, 0};
    colorShadow[] = {0, 0, 0, 0};
    colorBorder[] = {0, 0, 0, 0};
    w = 0.095589;
    h = 0.039216;
    shadow = 0;
};

class Rsc_ACE_Timer_Slider:RscXSliderH {
    x = 0.4;
    y = 0.2;
    w = 0.3;
    h = "1*((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    colorBackground[] = {0,0,0,0.5};
};

class RscACE_SelectTimeUI {
    idd = 8854;
    movingEnable = 0;
    class controls {
        class back:IGUIBack {
            x = X_OFFSET;
            y = 0;
            w = 0.5;
            h = 0.2;
            colorBackground[] = {0, 0, 0, 0.5};
        };
        class header: RscText{
            idc = 8870;
            x = X_OFFSET + 0.005;
            y = 0.005;
            w = 0.49;
            h = 0.05;
            style = ST_CENTER;
            text = "";
        };
        class slider: Rsc_ACE_Timer_Slider {
            idc = 8845;
            x = X_OFFSET + 0.005;
            y = 0.06;
            w = 0.49;
            h = 0.025;
            onSliderPosChanged = "private ['_mins', '_secs'];_mins = floor((_this select 1)/60);_secs=floor((_this select 1) - (_mins*60));ctrlSetText [8870, format[localize 'STR_ACE_Explosives_TimerMenu',_mins, _secs]];";
        };
        class cancelBtn: RscButton {
            idc = 8855;
            x = X_OFFSET + 0.005;
            w = 0.15;
            h = 0.1;
            y = 0.09;
            style = ST_CENTER;
            text = CSTRING(Cancel);
            action = "closeDialog 0;";
        };
        class approveBtn: RscButton {
            idc = 8860;
            x = X_OFFSET + 0.345;
            y = 0.09;
            h = 0.1;
            w = 0.15;
            style = ST_CENTER;
            text = CSTRING(SetTime);
            action = "closeDialog 0;";
        };
    };
};

class Rsc_ACE_NumKeyButton: Rsc_ACE_HiddenButton{};
class Rsc_ACE_PhoneInterface {
    idd = 8855;
    movingEnable = 1;
    onLoad = QUOTE(GVAR(IED_CurrentSpeedDial) = -1);
    class controls {
        class RscPicture_1200: RscPicture {
            idc = 1200;
            text = QPATHTOF(Data\UI\Cellphone_Background.paa);
            x = 0.231875 * safezoneW + safezoneX;
            y = 0.104 * safezoneH + safezoneY;
            w = 0.195937 * safezoneW;
            h = 0.704 * safezoneH;
        };
        class numkey_1: Rsc_ACE_NumKeyButton {
            idc = 1600;
            x = 0.278281 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "1";
            action = "ctrlSetText [1400,((ctrlText 1400) + '1')];";
        };
        class numkey_2: Rsc_ACE_NumKeyButton {
            idc = 1601;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "2";
            action = "ctrlSetText [1400,((ctrlText 1400) + '2')];";
        };
        class numkey_3: Rsc_ACE_NumKeyButton {
            idc = 1602;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.533 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "3";
            action = "ctrlSetText [1400,((ctrlText 1400) + '3')];";
        };
        class numkey_4: Rsc_ACE_NumKeyButton {
            idc = 1603;
            x = 0.278281 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "4";
            action = "ctrlSetText [1400,((ctrlText 1400) + '4')];";
        };
        class numkey_5: Rsc_ACE_NumKeyButton {
            idc = 1604;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "5";
            action = "ctrlSetText [1400,((ctrlText 1400) + '5')];";
        };
        class numkey_6: Rsc_ACE_NumKeyButton {
            idc = 1605;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.577 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "6";
            action = "ctrlSetText [1400,((ctrlText 1400) + '6')];";
        };
        class numkey_7: Rsc_ACE_NumKeyButton {
            idc = 1606;
            x = 0.278281 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "7";
            action = "ctrlSetText [1400,((ctrlText 1400) + '7')];";
        };
        class numkey_8: Rsc_ACE_NumKeyButton {
            idc = 1607;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "8";
            action = "ctrlSetText [1400,((ctrlText 1400) + '8')];";
        };
        class numkey_9: Rsc_ACE_NumKeyButton {
            idc = 1608;
            x = 0.350469 * safezoneW + safezoneX;
            y = 0.621 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "9";
            action = "ctrlSetText [1400,((ctrlText 1400) + '9')];";
        };
        class numkey_0: Rsc_ACE_NumKeyButton {
            idc = 1609;
            x = 0.314375 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = "0";
            action = "ctrlSetText [1400,((ctrlText 1400) + '0')];";
        };
        class speedDialAdd: Rsc_ACE_NumKeyButton {
            idc = 1610;
            x = 0.278281 * safezoneW + safezoneX;
            y = 0.676 * safezoneH + safezoneY;
            w = 0.0309375 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = CSTRING(Phone_AddToSpeedDial);
            action = QUOTE([ARR_2(ctrlText 1401,ctrlText 1400)] call FUNC(addToSpeedDial););
        };
        class clear: Rsc_ACE_HiddenButton {
            idc = 1610;
            x = 0.278281 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = CSTRING(Clear);
            action = QUOTE(ctrlSetText [ARR_2(1400,'')];[ctrlText 1401] call FUNC(removeFromSpeedDial);ctrlSetText [ARR_2(1401,'')];);
        };
        class dial: Rsc_ACE_HiddenButton {
            idc = 1611;
            x = 0.309219 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.04125 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = CSTRING(Phone_Dial);
            action = QUOTE([ARR_2(ace_player,ctrlText 1400)] call FUNC(dialPhone););
        };
        class up: Rsc_ACE_HiddenButton {
            idc = 1612;
            x = 0.360781 * safezoneW + safezoneX;
            y = 0.445 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = CSTRING(Phone_Up);
            action = QUOTE([true] call FUNC(setSpeedDial));
        };
        class down: Rsc_ACE_HiddenButton {
            idc = 1613;
            x = 0.345312 * safezoneW + safezoneX;
            y = 0.485 * safezoneH + safezoneY;
            w = 0.020625 * safezoneW;
            h = 0.033 * safezoneH;
            tooltip = CSTRING(Phone_Down);
            action = QUOTE([false] call FUNC(setSpeedDial));
        };
        class speedDial_Text: RscText {
            idc = 1405;
            y = 0.302 * safezoneH + safezoneY;
            SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 22) * 1)";
            x = 0.288594 * safezoneW + safezoneX;
            w = 0.0825 * safezoneW;
            h = 0.044 * safezoneH;
            text = "Name";
        };
        class speedDial_edit: Rsc_ACE_CallScreen_Edit {
            idc = 1401;
            y = 0.302 * safezoneH + safezoneY;
            x = 0.318 * safezoneW + safezoneX;
            w = 0.1;
        };
        class numberEdit_Text: RscText {
            idc = 1406;
            y = 0.348 * safezoneH + safezoneY;
            SizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 22) * 1)";
            x = 0.288594 * safezoneW + safezoneX;
            w = 0.0825 * safezoneW;
            h = 0.044 * safezoneH;
            text = "#";
        };
        class number_edit: Rsc_ACE_CallScreen_Edit {
            canModify = 0;
            idc = 1400;
            y = 0.348 * safezoneH + safezoneY;
            x = 0.3 * safezoneW + safezoneX;
        };
    };
};
