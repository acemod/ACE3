class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    grid_ACE_microDagr[] = {{"(safeZoneX + safeZoneW - 11 * (((safeZoneW / safeZoneH) min 1.2) / 40))","(safeZoneY + safeZoneH - 15 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25))","(10 * (((safeZoneW / safeZoneH) min 1.2) / 40))","(10 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25))"},"(((safeZoneW / safeZoneH) min 1.2) / 40)","((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)"};
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
