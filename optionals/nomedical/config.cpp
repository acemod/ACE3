#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_main"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Dystopian"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
        ACE_expectedModDir = "@ACE No Medical";
        ACE_expectedSteamID = "3053169823";
    };
};
