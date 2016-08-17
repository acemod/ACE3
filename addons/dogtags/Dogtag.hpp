class RscPicture;
class RscStructuredText;

class RscTitles {
    class GVAR(singleTag) {
        idd = -1;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(tag),_this select 0)]);
        onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(tag),nil)]);
        movingEnable = false;
        duration = 5;
        fadeIn = 0.2;
        fadeOut = 0.2;

        class controls {
            class background: RscPicture {
                idc = 1000;
                text = QUOTE(PATHTOF(data\dogtagSingle.paa));
                sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                x = ((safezoneX + safezoneW) - (10 * (((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 * (((safezoneW / safezoneH) min 1.2) / 40));
                y = safeZoneY + 0.175 * safezoneH;
                w = (8 * (((safezoneW / safezoneH) min 1.2) / 40));
                h = (8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                font = "EtelkaMonospacePro";
            };
            class nickname: RscStructuredText {
                idc = 1001;
                text = "";
                sizeEx = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
                colorText[] = {1, 1, 1, 1};
                colorBackground[] = {0, 0, 0, 0};
                x = ((safezoneX + safezoneW) - (8.4 * (((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 * (((safezoneW / safezoneH) min 1.2) / 40));
                y = safeZoneY + 0.24 * safezoneH;
                w = (5.9 * (((safezoneW / safezoneH) min 1.2) / 40));
                h = (3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25));
                font = "RobotoCondensed";
                class Attributes {
                    font = "RobotoCondensed";
                    color = "#EEEEEE";
                    align = "left";
                    valign = "middle";
                    shadow = 2;
                    shadowColor = "#3f4345";
                    size = "0.80";
                };
            };
        };
    };
    class GVAR(doubleTag): GVAR(singleTag) {
        idd = -1;
        onLoad = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(tag),_this select 0)]);
        onUnload = QUOTE(uiNamespace setVariable [ARR_2(QQGVAR(tag),nil)]);

        class controls: controls {
            class background: background {
                text = QUOTE(PATHTOF(data\dogtagDouble.paa));
            };
            class nickname: nickname {
                class Attributes: Attributes {
                    font = "RobotoCondensed";
                    color = "#EEEEEE";
                    align = "left";
                    valign = "middle";
                    shadow = 2;
                    shadowColor = "#3f4345";
                    size = "0.80";
                };
            };
        };
    };
};
