#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_envelope_small","ACE_envelope_big"};
        weapons[] = {"ACE_EntrenchingTool"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"Grey", "esteldunedain"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
