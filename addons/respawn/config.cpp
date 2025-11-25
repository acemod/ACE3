#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_ModuleFriendlyFire", "ACE_ModuleRallypoint", "ACE_Rallypoint_West", "ACE_Rallypoint_East", "ACE_Rallypoint_Independent", "ACE_Rallypoint_West_Base", "ACE_Rallypoint_East_Base", "ACE_Rallypoint_Independent_Base"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common", "ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = { "bux578", "commy2" };
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgAddons.hpp"
#include "CfgVehicleClasses.hpp"
#include "CfgVehicles.hpp"
#include "ACE_Settings.hpp"
