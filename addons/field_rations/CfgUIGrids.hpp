class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    XGVAR(grid)[] = {
                        {
                            QUOTE(safeZoneX + safeZoneW - 4.2 * GUI_GRID_W),
                            QUOTE(safeZoneY + safeZoneH - 2.2 * GUI_GRID_H),
                            QUOTE(4 * GUI_GRID_W),
                            QUOTE(2 * GUI_GRID_H)
                        },
                        QUOTE(GUI_GRID_W),
                        QUOTE(GUI_GRID_H)
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
