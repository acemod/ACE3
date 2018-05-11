class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    grid_ACE_food[] = {{"(safezoneX + safezoneW - 5 * (((safezoneW / safezoneH) min 1.2) / 40))","(safezoneY + safezoneH - 11 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))","(1.9 * (((safezoneW / safezoneH) min 1.2) / 40))","(9 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))"},"(((safezoneW / safezoneH) min 1.2) / 80)","((((safezoneW / safezoneH) min 1.2) / 1.2) / 50)"};
                };
            };
        };

        class Variables {
            class grid_ACE_food {
                displayName = COMPONENT_NAME;
                description = "ACE Food";
                preview = QPATHTOF(data\gui\IGUI_preview_ca.paa);
                saveToProfile[] = {0,1,2,3};
                canResize = 1;
            };
        };
    };
};
