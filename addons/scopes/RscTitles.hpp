
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
            class ACE_Scopes_Zeroing_BG : RscPicture {
                idc = 11;
                type = 0;
                text = QPATHTOF(UI\scopes_bg.paa);
                style = 48 + 0x800;
                scale = 1;
                sizeEx = 1;
                font = "RobotoCondensed";
                colorText[] = { 1, 1, 1, 1 };
                colorBackground[] = { 1, 1, 1, 1 };
                shadow = 1;

                x = (0.5 - 0.4 / 2) * safezoneW + safezoneX;
                y = 0 * safezoneH + safezoneY;
                w = 0.4 * safezoneW;
                h = 0.3 * safezoneH;
            };
            class ACE_Scopes_Zeroing_Vertical : RscText {
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

                x = (0.5 - 0.4 / 2 + 0.45*0.4) * safezoneW + safezoneX;
                y = (0 + 0.19*0.3) * safezoneH + safezoneY;
                w = 0.04 * safezoneW;
                h = 0.025 * safezoneH;
            };
            class ACE_Scopes_Zeroing_Horizontal : RscText {
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

                x = (0.5 - 0.4 / 2 + 0.6*0.4) * safezoneW + safezoneX;
                y = (0 + 0.47*0.3) * safezoneH + safezoneY;
                w = 0.019 * safezoneW;
                h = 0.025 * safezoneH;
            };
        };
    };
};
