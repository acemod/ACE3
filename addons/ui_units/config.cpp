#include "script_component.hpp"
#include "\a3\ui_f\hpp\defineCommonGrids.inc"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"SynixeBrett"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class RscText;
class RscInGameUI {
    class RscUnitInfo {
        class CA_Alt: RscText {
            onLoad = QUOTE(call FUNC(onAltLoad));
        };
        class CA_Speed: RscText {
            onLoad = QUOTE(call FUNC(onSpeedLoad));
        };
    };
};

class GVAR(alt): RscText {
    style = 1;
    colorText[] = {
        "(profileNamespace getVariable ['IGUI_TEXT_RGB_R',0])",
        "(profileNamespace getVariable ['IGUI_TEXT_RGB_G',1])",
        "(profileNamespace getVariable ['IGUI_TEXT_RGB_B',1])",
        "(profileNamespace getVariable ['IGUI_TEXT_RGB_A',0.8])"
    };
    text = "9999";
    x = 6.3 * GUI_GRID_W + (profileNamespace getVariable ["IGUI_GRID_VEHICLE_X", (safezoneX + 0.5 * GUI_GRID_W)]);
    y = 2.3 * GUI_GRID_H + (profileNamespace getVariable ["IGUI_GRID_VEHICLE_Y", (safezoneY + 0.5 * GUI_GRID_H)]);
    w = 2 * GUI_GRID_W;
    h = 1 * GUI_GRID_H;
    sizeEx = 0.8 * GUI_GRID_H;
};

class GVAR(speed): RscText {
    style = 1;
    colorText[] = {
        "(profileNamespace getVariable ['IGUI_TEXT_RGB_R',0])",
        "(profileNamespace getVariable ['IGUI_TEXT_RGB_G',1])",
        "(profileNamespace getVariable ['IGUI_TEXT_RGB_B',1])",
        "(profileNamespace getVariable ['IGUI_TEXT_RGB_A',0.8])"
    };
    text = "9999";
    x = 6.3 * GUI_GRID_W + (profileNamespace getVariable ["IGUI_GRID_VEHICLE_X", (safezoneX + 0.5 * GUI_GRID_W)]);
    y = 1.3 * GUI_GRID_H + (profileNamespace getVariable ["IGUI_GRID_VEHICLE_Y", (safezoneY + 0.5 * GUI_GRID_H)]);
    w = 2 * GUI_GRID_W;
    h = 1 * GUI_GRID_H;
    sizeEx = 0.8 * GUI_GRID_H;
};

#include "CfgEventHandlers.hpp"
