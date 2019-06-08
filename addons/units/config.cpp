#include "script_component.hpp"

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
    colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])","(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])","(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
    text = "9999";
    x = "6.3 * (((safezoneW / safezoneH) min 1.2) / 40) + (profilenamespace getvariable [""IGUI_GRID_VEHICLE_X"", (safezoneX + 0.5 * (((safezoneW / safezoneH) min 1.2) / 40))])";
    y = "2.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (profilenamespace getvariable [""IGUI_GRID_VEHICLE_Y"", (safezoneY + 0.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
    w = "2 * (((safezoneW / safezoneH) min 1.2) / 40)";
    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};

class GVAR(speed): RscText {
    style = 1;
    colorText[] = {"(profilenamespace getvariable ['IGUI_TEXT_RGB_R',0])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_G',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_B',1])", "(profilenamespace getvariable ['IGUI_TEXT_RGB_A',0.8])"};
    text = "9999";
    x = "6.3 * (((safezoneW / safezoneH) min 1.2) / 40) + (profilenamespace getvariable [""IGUI_GRID_VEHICLE_X"", (safezoneX + 0.5 * (((safezoneW / safezoneH) min 1.2) / 40))])";
    y = "1.3 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (profilenamespace getvariable [""IGUI_GRID_VEHICLE_Y"", (safezoneY + 0.5 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25))])";
    w = "2 * (((safezoneW / safezoneH) min 1.2) / 40)";
    h = "1 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
    sizeEx = "0.8 * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25)";
};

#include "CfgEventHandlers.hpp"
