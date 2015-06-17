#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_envelope_small","ACE_envelope_big"};
        weapons[] = {"ACE_entrenchingtool"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"Grey"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"