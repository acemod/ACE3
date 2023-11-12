class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    GVAR(grid)[] = {
                        {
                            QUOTE((safeZoneX + safeZoneW) - 12.9 * GUI_GRID_W),
                            QUOTE(safeZoneY + 0.175 * safeZoneH),
                            QUOTE(8 * GUI_GRID_W),
                            QUOTE(8 * GUI_GRID_H)
                        },
                        QUOTE(GUI_GRID_W),
                        QUOTE(GUI_GRID_H)
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
