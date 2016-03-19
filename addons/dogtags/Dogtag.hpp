class RscPicture;
class RscStructuredText;

class RscTitles {
    class GVAR(tag) {
        idd = -1;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(tag)),_this select 0)]);
        onUnload = QUOTE(uiNamespace setVariable [ARR_2(QUOTE(QGVAR(tag)),nil)]);
        movingEnable = false;
        duration = 5;
        fadeIn = 0.2;
        fadeOut = 0.2;

        class controls {
            class background: RscPicture {
                idc = 1000;
                text = QUOTE(PATHTOF(data\dogtag.paa));
                sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                x = ((safezoneX + safezoneW) - (10 * (((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 * (((safezoneW / safezoneH) min 1.2) / 40));
                y = safeZoneY + 0.175 * safezoneH;
                w = (8 * (((safezoneW / safezoneH) min 1.2) / 40));
                h = (4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                font = "EtelkaMonospacePro";
            };
            class nickname: RscStructuredText {
                idc = 1001;
                text = "";
                sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                x = ((safezoneX + safezoneW) - (8.4 * (((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 * (((safezoneW / safezoneH) min 1.2) / 40));
                y = safeZoneY + 0.2 * safezoneH;
                w = (5.9 * (((safezoneW / safezoneH) min 1.2) / 40));
                h = (4 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                font = "EtelkaMonospacePro";
                class Attributes {
                    font = "EtelkaMonospacePro";
                    color = "#FFFFFF";
                    align = "center";
                    valign = "middle";
                    shadow = 1;
                    shadowColor = "#3f4345";
                    size = "0.85";
                };
            };
        };
    };
};
