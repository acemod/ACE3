#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction", "ace_medical"};
        author[] = {"Nathan"};
        authorUrl = "";
        VERSION_CONFIG;
    };
};

#include "cfgVehicles.hpp"
#include "cfgWeapons.hpp"
#include "ACE_Medical_Treatments.hpp"
#include "CfgEventHandlers.hpp"