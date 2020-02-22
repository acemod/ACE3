class RscTitles {
    class RscPicture;
    class GVAR(onFire1) {
        idd = 210220201;
        movingEnable = "true";
        duration = 0.1;
        fadein = 0.15;
        fadeout = 0.75;
        name = QGVAR(onFire1);
        onload = QUOTE(with uiNamespace do {GVAR(onFireIndicator1) = _this select 0});
        
        class controls {
            class GVAR(indicator): RscPicture {
                idc = -1;
                type = 0;
                style = 48;
                colorBackground[] = {0, 0, 0, 0};
                colorText[] = {0.9, 0.9, 0.9, 0.6};
                font = "LucidaConsoleB";
                sizeEx = 0.023;
                x = "SafeZoneX";
                y = "SafeZoneY";
                w = "SafeZoneW + 0.05";
                h = "SafeZoneH + 0.05";
                text = PATHTOF(data\overlay_burn_1.paa);
            };
        };
    };
    
    class GVAR(onFire2) : GVAR(onFire1) {
        idd = 210220202;
        name = QGVAR(onFire2);
        onload = QUOTE(with uiNamespace do {GVAR(onFireIndicator2) = _this select 0});
        
        class controls : controls {
            class GVAR(indicator) : GVAR(indicator) {
                text = PATHTOF(data\overlay_burn_2.paa);
            };
        };
    };
};