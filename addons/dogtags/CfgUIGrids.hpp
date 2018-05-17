class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    grid_ACE_dogtags[] = {{"(safeZoneX + safeZoneW) - (12.9 * ((safeZoneW / safeZoneH) min 1.2) / 40)", "safeZoneY + 0.175 * safeZoneH", "8 * (((safeZoneW / safeZoneH) min 1.2) / 40)", "8 * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)"}, "(((safeZoneW / safeZoneH) min 1.2) / 40)", "((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25)"};
                };
            };
        };
        class Variables {
            class grid_ACE_dogtags {
                displayName = COMPONENT_NAME;
                description = CSTRING(IGUI_Description);
                preview = QPATHTOF(ui\igui_preview.paa);
                saveToProfile[] = {0, 1};
                canResize = 0;
            };
        };
    };
};
