
class RscText;


class RscText;

class RscTitles {
    class ACE_Shortdot_Reticle {
        idd = -1;
        onLoad = "uiNamespace setVariable ['ACE_ctrlShortdotReticle', (_this select 0) displayCtrl 1];";
        duration = 999999;
        fadeIn = 0;
        fadeOut = 0;
        name = "ACE_Shortdot_Reticle";

        class controlsBackground {
            class Debug_RscElement: RscText {
                idc = 1;
                style = 48;
                size = 1;
                sizeEx = 0;
                font = "TahomaB";
                text = "";
                x = 0;
                y = 0;
                w = 0;
                h = 0;
            };
        };
    };
};
