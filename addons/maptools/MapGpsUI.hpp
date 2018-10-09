#define GUI_GRID_X (0)
#define GUI_GRID_Y (0)
#define GUI_GRID_W (0.025)
#define GUI_GRID_H (0.04)

#define ST_LEFT   0x00
#define ST_RIGHT  0x01
#define ST_CENTER 0x02

#define W_gps 0.4025
#define H_gps 0.25
#define X_gps safeZoneX + safeZoneW - 1.1 * W_gps
#define Y_gps safeZoneY + safeZoneH - 1.2 * H_gps

class RscTitles {
    class RscACE_MapGps {
        idd = 9855;
        movingEnable = 1;
        duration = 3600;
        fadein = 0;
        fadeout = 0;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(ui_mapGpsDisplay)), _this select 0)];);
        class controls {
            class back:RscPicture {
                x = X_gps;
                y = Y_gps;
                w = W_gps;
                h = H_gps;
                text = QPATHTOF(UI\mapGps.paa);
                colorBackground[] = {1, 1, 1, 1};
            };
            class heading: RscText{
                idc = 913590;
                x = X_gps + W_gps * 0.225;
                y = Y_gps + H_gps * 0.12;
                w = W_gps * 0.2;
                h = H_gps * 0.16;
                style = ST_LEFT;
                text = "225";
                colorBackground[] = {0,0,0,0};
                colorText[] = {0.247,0.251,0.157,1};
                shadowColo[] = {0,0,0,0};
                // EtelkaNarrowMediumPro broke with 1.72 hotfix, can revert back to that font if fixed (following 3 uses of PuristaSemibold)
                font = "PuristaSemibold"; 
                shadow = 0;
                sizeEx = 0.042;
            };
            class altitude: RscText{
                idc = 913591;
                x = X_gps + W_gps * 0.575;
                y = Y_gps + H_gps * 0.12;
                w = W_gps * 0.2;
                h = H_gps * 0.16;
                style = ST_RIGHT;
                text = "55 m";
                colorBackground[] = {0,0,0,0};
                colorText[] = {0.247,0.251,0.157,1};
                shadowColo[] = {0,0,0,0};
                font = "PuristaSemibold";
                shadow = 0;
                sizeEx = 0.042;
            };
            class coordinates: RscText{
                idc = 913592;
                x = X_gps + W_gps * 0.15;
                y = Y_gps + H_gps * 0.33;
                w = W_gps * 0.7;
                h = H_gps * 0.35;
                style = ST_CENTER;
                text = "012.3 115.1";
                colorBackground[] = {0,0,0,0};
                colorText[] = {0.247,0.251,0.157,1};
                shadowColo[] = {0,0,0,0};
                font = "PuristaSemibold";
                shadow = 0;
                sizeEx = 0.1;
            };
        };
    };
};
