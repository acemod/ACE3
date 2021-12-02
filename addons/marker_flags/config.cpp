#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(white),
            QGVAR(black),
            QGVAR(red),
            QGVAR(green),
            QGVAR(blue),
            QGVAR(yellow),
            QGVAR(orange),
            QGVAR(purple)
        };
        weapons[] = {
            QGVAR(white),
            QGVAR(black),
            QGVAR(red),
            QGVAR(green),
            QGVAR(blue),
            QGVAR(yellow),
            QGVAR(orange),
            QGVAR(purple)
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Brett Mayson"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
