class RscMapControl;

class GVAR(sharedMapDialog) {
    idd = -1;
    movingEnable = 0;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['PABST_ShareMapDialog', _this select 0];";
    duration = 2147483647;
    fadein = 0;
    fadeout = 0;

    class controlsBackground {};

    class controls {
        class TheSharedMap: RscMapControl {
            idc = 80085;
            type = 100;  //100 hides all markers
            scaleDefault = 0.25;
            colorbackground[] = {0.9,0.9,0.9,1};
            maxSatelliteAlpha = 0.5;
            x = 0.1 * safeZoneW + safezoneX;
            y = 0.1 * safeZoneH + safeZoneY;
            w = 0.8 * safeZoneW;
            h = 0.8 * safeZoneH;
            onMouseButtonDown = QUOTE([ARR_2('MouseDown', _this)] call FUNC(handleMapEvents));
            onMouseButtonUp = QUOTE([ARR_2('MouseUp', _this)] call FUNC(handleMapEvents));
            onMouseMoving = QUOTE([ARR_2('MouseMoving', _this)] call FUNC(handleMapEvents));
            onDraw = QUOTE(_this call FUNC(handleDrawSharedMap));
        };
    };
};
