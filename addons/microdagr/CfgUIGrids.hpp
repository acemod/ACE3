class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    grid_ACE_microDagr[] = {{"(safezoneX + safezoneW - 11 * (((safezoneW / safezoneH) min 1.2) / 40))","(safezoneY + safezoneH - 15 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))","(10 * (((safezoneW / safezoneH) min 1.2) / 40))","(10 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))"},"(((safezoneW / safezoneH) min 1.2) / 40)","((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)"};
                };
            };
        };

        class Variables {
            class grid_ACE_microDagr {
                displayName = COMPONENT_NAME;
                description = "ACE MicroDagr";
                preview = QPATHTOF(ui\IGUI_preview_ca.paa);
                saveToProfile[] = {0,1,2,3};
                canResize = 1;
            };
        };
    };
};
