class RscTitles {
    class ACE_Scope_Zeroing {
        idd = -1;
        movingEnable = 0;
        enableSimulation = 1;
        enableDisplay = 1;
        onLoad = QUOTE(_this spawn COMPILE_FILE(PATHTOF(scripts\zeroingOnLoad.sqf)); uiNamespace setVariable[QGVAR(Debug), _this];);
        duration = 1e+011;
        fadein = 0;
        fadeout = 0;
        name = QGVAR(Zeroing);
        class RscPicture;
        class RscText;
        class controls {
            class ACE_Scope_Zeroing_BG : RscPicture {
                idc = 925001;
                type = 0;
                text = PATHTOF(UI\scopes_bg.paa);
                style = 48 + 0x800;
                scale = 1;
                sizeEx = 1;
                font = "PuristaMedium";
                colorText[] = { 1, 1, 1, 1 };
                colorBackground[] = { 1, 1, 1, 1 };
                shadow = 1;

                x = (0.5 - 0.4 / 2) * safezoneW + safezoneX;
                y = 0 * safezoneH + safezoneY;
                w = 0.4 * safezoneW;
                h = 0.3 * safezoneH;
            };
            class ACE_Scope_Zeroing_Vertical : RscText {
                idc = 925002;
                type = 0;
                style = 2;
                sizeEx = 0.04;
                lineSpacing = 1;
                font = "PuristaMedium";
                text = "";
                colorText[] = { 1, 1, 1, 0.9 };
                colorBackground[] = { 1, 0, 0, 0 };
                shadow = 0;

                x = (0.5 - 0.4 / 2 + 0.45*0.4) * safezoneW + safezoneX;
                y = (0 + 0.19*0.3) * safezoneH + safezoneY;
                w = 0.04 * safezoneW;
                h = 0.025 * safezoneH;
            };
            class ACE_Scope_Zeroing_Horizontal : RscText {
                idc = 925003;
                type = 0;
                style = 0;
                sizeEx = 0.04;
                lineSpacing = 1;
                font = "PuristaMedium";
                text = "";
                colorText[] = { 1, 1, 1, 0.9 };
                colorBackground[] = { 1, 0, 0, 0 };
                shadow = 0;

                x = (0.5 - 0.4 / 2 + 0.6*0.4) * safezoneW + safezoneX;
                y = (0 + 0.47*0.3) * safezoneH + safezoneY;
                w = 0.04 * safezoneW;
                h = 0.025 * safezoneH;
            };
        };
    };
};

class RscInGameUI {
    class RscUnitInfo;
    class RscWeaponZeroing : RscUnitInfo {
        onLoad = QUOTE(["onLoad", _this, "RscUnitInfo", "IGUI"] call COMPILE_FILE(PATHTOF(A3\ui_f\scripts\initDisplay.sqf)); uiNamespace setVariable["ACE_dlgWeaponZeroing", _this select 0];);
    };
};
