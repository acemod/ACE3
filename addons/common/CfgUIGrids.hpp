class CfgUIGrids {
    class IGUI {
        class Presets {
            class Arma3 {
                class Variables {
                    GVAR(gridDisplayText)[] = {{safeZoneX + safeZoneW - 12.9 * GUI_GRID_W, safeZoneY + 0.175 * safeZoneH, 10 * GUI_GRID_W, 3 * GUI_GRID_H}, GUI_GRID_W, GUI_GRID_H};
                    GVAR(gridProgressBar)[] = {{1 * GUI_GRID_W + GUI_GRID_CENTER_X, GUI_GRID_CENTER_Y, 38 * GUI_GRID_W, 1 * GUI_GRID_H}, GUI_GRID_W, GUI_GRID_H};
                };
            };
        };
        class Variables {
            class GVAR(gridDisplayText) {
                displayName = CSTRING(DisplayTextPosition);
                description = CSTRING(DisplayTextPosition_Description);
                preview = QPATHTOF(UI\ACE_Hint_Preview_ca.paa);
                saveToProfile[] = {0, 1};
            };
            class GVAR(gridProgressBar) {
                displayName = CSTRING(ProgressBarPosition);
                description = CSTRING(ProgressBarPosition_Description);
                preview = QPATHTOF(UI\ACE_Progress_Bar_Preview_ca.paa);
                saveToProfile[] = {0, 1};
            };
        };
    };
};
