#define ST_LEFT           0x00
#define ST_RIGHT          0x01
#define ST_CENTER         0x02

class RscActiveText;
class RscText;
class RscPicture;
class RscMapControl {
    class hospital;
    class church;
    class lighthouse;
    class power;
    class fuelstation;
    class transmitter;
};
class RscMapControlEmpty;
class RscControlsGroupNoScrollbars;
class RscControlsGroup;
class RscEdit;
class RscButton;
class RscListBox;


class GVAR(RscActiveTextPicture): RscActiveText {
    style = 48;
    colorText[] = {1,1,1,1};
    colorActive[] = {1,1,1,1};
    color[] = {1,1,1,1};
    color2[] = {1,1,1,1};
    colorFocused[] = {1,1,1,1};
    colorDisabled[] = {1,1,1,1};
    colorBackground[] = {1,1,1,1};
    colorBackground2[] = {1,1,1,1};
    colorBackgroundFocused[] = {1,1,1,1};
};

class GVAR(RscText): RscText {
    font = QGVAR(Font);
    //Design note: I think less contrast in font color makes it look more natural and less "eye catching"
    colorText[] = {0.1,0.1,0.1,1};
    shadow = 0;
};

class GVAR(HiddenButton)
{
    access = 0;
    type = 1;
    text = "";
    colorText[] = {
            0, 0, 0, 1
    };
    colorDisabled[] = {
            0, 0, 0, 0
    };
    colorBackground[] = {
            0, 0, 0, 0
    };
    colorBackgroundDisabled[] = {
            0, 0, 0, 0
    };
    colorBackgroundActive[] = {
            0, 0, 0, 0
    };
    colorFocused[] = {
            0, 0, 0, 0
    };
    colorShadow[] = {
            0, 0, 0, 0
    };
    colorBorder[] = {
            0, 0, 0, 0
    };

    soundEnter[] = 
    {
        "\A3\ui_f\data\sound\RscButton\soundEnter",
        0.09,
        1
    };
    soundPush[] = 
    {
        "\task_force_radio\sounds\softPush",
        0.5,
        1
    };
    soundClick[] = 
    {
        "\task_force_radio\sounds\softClick",
        0.5,
        1
    };
    soundEscape[] = 
    {
        "\A3\ui_f\data\sound\RscButton\soundEscape",
        0.09,
        1
    };
    style = 2;
    x = 0;
    y = 0;
    w = 0.095589;
    h = 0.039216;
    shadow = 2;
    font = "PuristaMedium";
    sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
    offsetX = 0.003;
    offsetY = 0.003;
    offsetPressedX = 0.002;
    offsetPressedY = 0.002;
    borderSize = 0;
};

//Redfine Scaling for the Dialog
#define X_PART(num) QUOTE((((60 - 25)/2) + (num)) * (safeZoneH / 64) + (safezoneX + (safezoneW - safeZoneH)/2))
#define Y_PART(num) QUOTE((0 + (num)) * (safeZoneH / 36) + (safezoneY + (safezoneH - (safeZoneH / 1.2))/2))
#define W_PART(num) QUOTE((num) * (safeZoneH / 64))
#define H_PART(num) QUOTE((num) * (safeZoneH / 36))

class GVAR(TheDialog) {
    idd = -1;
    movingEnable = 1;
    duration = 9999999;
    fadein = 0;
    fadeout = 0;
    onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(DialogDisplay)),_this select 0)];);
    //onUnload = QUOTE([] call FUNC(dialogClosedEH));

    #include "gui_controls.hpp"
};


//Redfine Scaling for the RscTitle
#define PROFILE_X (profilenamespace getvariable ['IGUI_GRID_GPS_X', 0])
#define PROFILE_Y (profilenamespace getvariable ['IGUI_GRID_GPS_Y', 0])
#define PROFILE_W (profilenamespace getvariable ['IGUI_GRID_GPS_W', 1])
#define PROFILE_H ((16/9) * (profilenamespace getvariable ['IGUI_GRID_GPS_W', 1]))

#define X_PART(num) QUOTE((num) / 25 * PROFILE_W + (PROFILE_X - 0.13))
#define Y_PART(num) QUOTE((num) / 25 * PROFILE_H + PROFILE_Y)
#define W_PART(num) QUOTE((num) / 25 * PROFILE_W)
#define H_PART(num) QUOTE((num) / 25 * PROFILE_H)

class RscTitles {
    class GVAR(TheRscTitleDisplay) {
        idd = -1;
        movingEnable = 1;
        duration = 9999999;
        fadein = 0;
        fadeout = 0;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(RscTitleDisplay)),_this select 0)];);

        #include "gui_controls.hpp"
    };
};
