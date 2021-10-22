class RscPicture;
class RscControlsGroupNoScrollbars;

class RscTitles {
    class GVAR(hudColoredIcons) {
        idd = -1;
        fadeIn = 0.5;
        fadeOut = 0.5;
        duration = 999999;
        movingEnable = 0;
        onLoad = QUOTE(SETUVAR(QGVAR(hudDisplay),_this select 0));
        class controls {
            class Thirst: RscPicture {
                idc = IDC_COLORED_HUD_THIRST;
                x = profileNamespace getVariable [QUOTE(TRIPLES(IGUI,GVAR(grid),X)), safeZoneX + safeZoneW - 4.2 * GUI_GRID_W];
                y = profileNamespace getVariable [QUOTE(TRIPLES(IGUI,GVAR(grid),Y)), safeZoneY + safeZoneH - 2.2 * GUI_GRID_H];
                w = 2 * GUI_GRID_W;
                h = 2 * GUI_GRID_H;
                text = QPATHTOF(ui\icon_hud_thirststatus.paa);
            };
            class Hunger: Thirst {
                idc = IDC_COLORED_HUD_HUNGER;
                x = 2 * GUI_GRID_W + (profileNamespace getVariable [QUOTE(TRIPLES(IGUI,GVAR(grid),X)), safeZoneX + safeZoneW - 4.2 * GUI_GRID_W]);
                text = QPATHTOF(ui\icon_hud_hungerstatus.paa);
            };
        };
    };
    class GVAR(hudDrainingIcons) {
        idd = -1;
        fadeIn = 0.5;
        fadeOut = 0.5;
        duration = 999999;
        movingEnable = 0;
        onLoad = QUOTE(SETUVAR(QGVAR(hudDisplay),_this select 0));
        class controlsBackground {
            class Thirst: RscPicture {
                idc = -1;
                x = profileNamespace getVariable [QUOTE(TRIPLES(IGUI,GVAR(grid),X)), safeZoneX + safeZoneW - 4.2 * GUI_GRID_W];
                y = profileNamespace getVariable [QUOTE(TRIPLES(IGUI,GVAR(grid),Y)), safeZoneY + safeZoneH - 2.2 * GUI_GRID_H];
                w = 2 * GUI_GRID_W;
                h = 2 * GUI_GRID_H;
                text = QPATHTOF(ui\icon_hud_thirststatus.paa);
                colorText[] = {1, 1, 1, 0.2};
            };
            class Hunger: Thirst {
                x = 2 * GUI_GRID_W + (profileNamespace getVariable [QUOTE(TRIPLES(IGUI,GVAR(grid),X)), safeZoneX + safeZoneW - 4.2 * GUI_GRID_W]);
                text = QPATHTOF(ui\icon_hud_hungerstatus.paa);
            };
        };
        class controls {
            class ThirstGroup: RscControlsGroupNoScrollbars {
                idc = IDC_DRAINING_HUD_THIRST_GROUP;
                x = profileNamespace getVariable [QUOTE(TRIPLES(IGUI,GVAR(grid),X)), safeZoneX + safeZoneW - 4.2 * GUI_GRID_W];
                y = profileNamespace getVariable [QUOTE(TRIPLES(IGUI,GVAR(grid),Y)), safeZoneY + safeZoneH - 2.2 * GUI_GRID_H];
                w = 2 * GUI_GRID_W;
                h = 2 * GUI_GRID_H;
                class controls {
                    class Icon: RscPicture {
                        idc = IDC_DRAINING_HUD_THIRST_ICON;
                        x = 0;
                        y = 0;
                        w = 2 * GUI_GRID_W;
                        h = 2 * GUI_GRID_H;
                        text = QPATHTOF(ui\icon_hud_thirststatus.paa);
                    };
                };
            };
            class HungerGroup: ThirstGroup {
                idc = IDC_DRAINING_HUD_HUNGER_GROUP;
                x = 2 * GUI_GRID_W + (profileNamespace getVariable [QUOTE(TRIPLES(IGUI,GVAR(grid),X)), safeZoneX + safeZoneW - 4.2 * GUI_GRID_W]);
                class controls: controls {
                    class Icon: Icon {
                        idc = IDC_DRAINING_HUD_HUNGER_ICON;
                        text = QPATHTOF(ui\icon_hud_hungerstatus.paa);
                    };
                };
            };
        };
    };
};
