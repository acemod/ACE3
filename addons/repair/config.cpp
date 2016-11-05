#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Wheel", "ACE_Track"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2", "Glowbal", "Jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Repair.hpp"
#include "ACE_Settings.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgActions.hpp"
#include "CfgVehicles.hpp"
#include "CfgEden.hpp"
