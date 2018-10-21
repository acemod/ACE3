class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    grid_ACE_displayText[] = {{((safezoneX + safezoneW) - (10 *(((safezoneW / safezoneH) min 1.2) / 40)) - 2.9 *(((safezoneW / safezoneH) min 1.2) / 40)),safeZoneY + 0.175 * safezoneH, (10 *(((safezoneW / safezoneH) min 1.2) / 40)), (3 *((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))}, "(((safezoneW / safezoneH) min 1.2) / 40)","((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"};
                };
            };
        };

        class Variables {
            class grid_ACE_displayText {
                displayName = "ACE Hint";
                description = "Textual in game feedback to the player.";
                preview = QPATHTOF(UI\ACE_Hint_Preview_ca.paa);
                saveToProfile[] = {0,1};
            };
        };
    };
};
