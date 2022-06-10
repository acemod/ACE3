#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {
            QGVAR(white),
            QGVAR(red),
            QGVAR(blue),
            QGVAR(green),
            QGVAR(yellow)
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_interact_menu", "ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Timi007"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
