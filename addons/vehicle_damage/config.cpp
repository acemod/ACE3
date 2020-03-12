#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        // ammo/vehicle config defines touch all of these
        requiredAddons[] = { "ace_common", "ace_cookoff", "ace_dragon", "ace_hot", "ace_aircraft", "ace_ballistics", "ace_hellfire", "ace_frag" };
        author = ECSTRING(common,ACETeam);
        authors[] = {""};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgAmmo.hpp"
