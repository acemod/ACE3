#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {QGVAR(Sound),QGVAR(Turret_MBT_01),QGVAR(Turret_MBT_02)};
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
#include "CfgVehicles.hpp"
