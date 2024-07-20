#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2", "Glowbal"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "ACE_Settings.hpp"
#include "CfgEden.hpp"
#include "CfgEventHandlers.hpp"

#include "CfgAmmo.hpp"
#include "CfgCloudlets.hpp"
#include "CfgSFX.hpp"
#include "CfgSounds.hpp"
#include "CfgVehicles.hpp"
