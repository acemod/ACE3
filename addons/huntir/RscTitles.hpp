#define __FONTHEIGHT 0.02

class RscTitles {
    class GVAR(cam_rose) {
        idd=-1;
        movingEnable = true;
        fadein = 0;
        fadeout = 1;
        duration = 1e+011;
        name=QGVAR(cam_rose);
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(cam_rose), _this select 0)]);
        class controls {
            class CHAR_N {
                type = 0;
                idc = 64432;
                style = 0;
                x = 0.497;y = 0.297;w = 0.2;h = 0.2;
                font = "RobotoCondensed";
                sizeEx = __FONTHEIGHT;
                colorText[] = {1, 1, 1, 1};
                colorBackground[]={0,0,0,0};
                text = "N";
            };
            class CHAR_E: CHAR_N {
                idc = 64433;
                x = 0.697;y = 0.497;
                text = "E";
            };
            class CHAR_S: CHAR_N {
                idc = 64434;
                x = 0.497;y = 0.697;
                text = "S";
            };
            class CHAR_W: CHAR_N {
                idc = 64435;
                x = 0.297;y = 0.497;
                text = "W";
            };
        };
    };
};
