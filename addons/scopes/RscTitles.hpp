
class RscText;
class RscPicture;

class RscTitles {
    class ACE_Scopes_Zeroing {
        idd = -1;
        movingEnable = 0;
        enableSimulation = 1;
        enableDisplay = 1;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(ZeroingDisplay)),_this select 0)];);
        duration = 1e+011;
        fadein = 0;
        fadeout = 0;
        name = QGVAR(Zeroing);
        class controls {
            class ACE_Scopes_Zeroing_BG: RscPicture {
                idc = 11;
                type = 0;
                text = QPATHTOF(UI\scopes_bg.paa);
                style = "48 + 0x800";
                scale = 1;
                sizeEx = 1;
                font = "RobotoCondensed";
                colorText[] = { 1, 1, 1, 1 };
                colorBackground[] = { 1, 1, 1, 1 };
                shadow = 1;

                x = "(0.5 - 0.4 / 2) * safeZoneW + safeZoneX";
                y = "0 * safeZoneH + safeZoneY";
                w = "0.4 * safeZoneW";
                h = "0.3 * safeZoneH";
            };
            class ACE_Scopes_Zeroing_Vertical: RscText {
                idc = 12;
                type = 0;
                style = 2;
                sizeEx = 0.04;
                lineSpacing = 1;
                font = "RobotoCondensed";
                text = "";
                colorText[] = { 1, 1, 1, 0.9 };
                colorBackground[] = { 1, 0, 0, 0 };
                shadow = 0;

                x = "(0.5 - 0.4 / 2 + 0.45*0.4) * safeZoneW + safeZoneX";
                y = "(0 + 0.19*0.3) * safeZoneH + safeZoneY";
                w = "0.04 * safeZoneW";
                h = "0.025 * safeZoneH";
            };
            class ACE_Scopes_Zeroing_Horizontal: RscText {
                idc = 13;
                type = 0;
                style = 2;
                sizeEx = 0.04;
                lineSpacing = 1;
                font = "RobotoCondensed";
                text = "";
                colorText[] = { 1, 1, 1, 0.9 };
                colorBackground[] = { 1, 0, 0, 0 };
                shadow = 0;

                x = "(0.5 - 0.4 / 2 + 0.6*0.4) * safeZoneW + safeZoneX";
                y = "(0 + 0.47*0.3) * safeZoneH + safeZoneY";
                w = "0.019 * safeZoneW";
                h = "0.025 * safeZoneH";
            };
        };
    };
};
