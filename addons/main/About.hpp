#include "script_dialog_defines.hpp"

class ACE_ABOUT_DLG {
    idd = 114137;
    movingEnable = 0;
    onLoad = "with uiNameSpace do { ACE_ABOUT_DLG = _this select 0; };";
    onKeyDown = "if((_this select 1) == 1) then {ACE_ABOUT_STP = true;};";
    class controlsBackground {
        class Contents : RscStructuredText {
            idc = 1141371;
            colorBackground[] = { 0, 0, 0, 0 };
            __SX(0.45);
            __SY(0.25);
            __SW(0.45);
            __SH(0.6);
            size = "0.025 * SafeZoneH";
            class Attributes {
                font = "TahomaB";
                color = "#C8C8C8";
                align = "left";
                valign = "middle";
                shadow = true;
                shadowColor = "#191970";
                size = "1";
            };
        };
        class ACE_ABOUT_NEXT : ACE_ABOUT_CTRL { //dummy visible
            idc = 1141372;
            __SX(0.065);
            __SW(0.03);
            text = "";
            action = "";
        };
    }; //controlsBackground
};
