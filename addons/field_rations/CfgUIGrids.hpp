class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    XGVAR(grid)[] = {
                        {
                            safeZoneX + safeZoneW - 4.2 * GUI_GRID_W,
                            safeZoneY + safeZoneH - 2.2 * GUI_GRID_H,
                            4 * GUI_GRID_W,
                            2 * GUI_GRID_H
                        },
                        GUI_GRID_W,
                        GUI_GRID_H
                    };
                };
            };
        };
        class Variables {
            class XGVAR(grid) {
                displayName = CSTRING(IGUI_DisplayName);
                description = CSTRING(IGUI_Description);
                preview = QPATHTOF(ui\igui_preview.paa);
                saveToProfile[] = {0, 1};
                canResize = 0;
            };
        };
    };
};
