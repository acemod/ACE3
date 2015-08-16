#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Wheel", "ACE_Track"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_interaction"};
        author[] = {"commy2", "Glowbal"};
        authorUrl = "https://ace3mod.com";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"

#include "CfgActions.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgVehicles.hpp"

#include "ACE_Settings.hpp"
#include "ACE_Repair.hpp"
