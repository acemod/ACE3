class RscPicture;
class RscText;

class RscTitles {
    class GVAR(title) {
        idd = 10777;
        movingEnable = 1;
        enableSimulation = 1;
        enableDisplay = 1;

        onLoad = QUOTE(with uiNamespace do {GVAR(titleDisplay) = _this select 0};);
        onunLoad = "";

        duration = 999999;
        fadein = 0;
        fadeout = 0;

        class controls {
            class Hexes: RscPicture {
                idc = 1000;
            };
            class Mask: RscPicture {
                idc = 1001;
            };
            
            // Add blinders for side monitors for tripple monitors (mask won't cover them)
            class trippleHeadLeft: RscPicture {
                idc = 1002;
                text = "#(argb,8,8,3)color(0,0,0,1)";
                x = "safeZoneXAbs";
                Y = "safezoneY";
                W = "(safezoneX - safeZoneXAbs) * ((getResolution select 4)/(16/3))";
                H = "safeZoneH";
            };
            class trippleHeadRight: trippleHeadLeft {
                idc = 1003;
                x = "safeZoneXAbs + safeZoneWAbs - (safezoneX - safeZoneXABS) * ((getResolution select 4)/(16/3))";
            };
        };
    };
};
