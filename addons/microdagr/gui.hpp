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
    font = "EtelkaMonospacePro";
    //Design note: I think less contrast in font color makes it look more natural and less "eye catching"
    colorText[] = {0.75,0.75,0.75,1};
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
    onUnload = QUOTE([] call FUNC(dialogClosedEH));

    #include "gui_controls.hpp"
};


//Redfine Scaling for the RscTitle
#define PROFILE_X (profilenamespace getVariable ['IGUI_grid_ACE_microDagr_X', 0])
#define PROFILE_Y (profilenamespace getVariable ['IGUI_grid_ACE_microDagr_Y', 0])
#define PROFILE_W (profilenamespace getVariable ['IGUI_grid_ACE_microDagr_W', 1])
#define PROFILE_H ((16/9) * (profilenamespace getVariable ['IGUI_grid_ACE_microDagr_W', 1]))

//Need undef's for pboProject
#undef X_PART
#undef Y_PART
#undef W_PART
#undef H_PART
#define X_PART(num) QUOTE((num) / 25 * PROFILE_W + PROFILE_X)
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
