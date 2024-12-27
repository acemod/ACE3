#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"BaerMitUmlaut"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        ACE_expectedModDir = "@ACE Particles";
        ACE_expectedSteamID = "2202413537";
    };
};

#include "CfgAmmo.hpp"
#include "CfgCloudlets.hpp"
#include "Effects.hpp"
