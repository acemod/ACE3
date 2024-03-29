#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        ACE_isOptional = 1;
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        ACE_expectedModDir = "@ACE No Cross Hair";
        ACE_expectedSteamID = "2202412481";
    };
};

#include "CfgWeaponCursors.hpp"
