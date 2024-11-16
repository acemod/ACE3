#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"654wak654", "jonpas"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        ACE_expectedModDir = "@ACE No Uniform Restrictions";
        ACE_expectedSteamID = "2202413047";
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
