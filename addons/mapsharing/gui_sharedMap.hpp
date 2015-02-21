class GVAR(sharedMapDialog) {
    idd = -1;
    movingEnable = 0;
    enableSimulation = 1;
    enableDisplay = 1;
    onLoad = "uiNamespace setVariable ['PABST_ShareMapDialog', _this select 0];";;
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
            maxSatelliteAlpha = 0.15;
            x = 0.1 * safeZoneW + safezoneX;
            y = 0.1 * safeZoneH + safeZoneY;
            w = 0.8 * safeZoneW;
            h = 0.8 * safeZoneH;
            onMouseButtonDown = QUOTE([ARR_2(_this, false)] call FUNC(handleMapClick));
            onMouseButtonUp = QUOTE([ARR_2(_this, true)] call FUNC(handleMapClick));
            onDraw = QUOTE(_this call FUNC(handleSharedMapDraw));
        };
    };
};
