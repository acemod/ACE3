class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    GVAR(grid)[] = {
                        {
                            (safeZoneX + safeZoneW) - 12.9 * GUI_GRID_W,
                            safeZoneY + 0.175 * safeZoneH,
                            8 * GUI_GRID_W,
                            8 * GUI_GRID_H
                        },
                        GUI_GRID_W,
                        GUI_GRID_H
                    };
                };
            };
        };
        class Variables {
            class GVAR(grid) {
                displayName = COMPONENT_NAME;
                description = CSTRING(IGUI_Description);
                preview = QPATHTOF(ui\igui_preview.paa);
                saveToProfile[] = {0, 1};
                canResize = 0;
            };
        };
    };
};
