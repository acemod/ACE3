#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {"ACE_launch_NLAW_loaded_F","ACE_launch_NLAW_used_F"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

class CBA_DisposableLaunchers {
    ACE_launch_NLAW_ready_F[] = {"launch_NLAW_F","ACE_launch_NLAW_used_F"};
};

#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
