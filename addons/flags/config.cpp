#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            QGVAR(carrier_white),
            QGVAR(carrier_red),
            QGVAR(carrier_blue),
            QGVAR(carrier_green),
            QGVAR(carrier_yellow),
            QGVAR(carrier_orange),
            QGVAR(carrier_purple),
            QGVAR(carrier_black)
        };
        weapons[] = {
            QGVAR(white),
            QGVAR(red),
            QGVAR(blue),
            QGVAR(green),
            QGVAR(yellow),
            QGVAR(orange),
            QGVAR(purple),
            QGVAR(black)
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
