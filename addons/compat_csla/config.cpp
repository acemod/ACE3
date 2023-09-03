#include "script_component.hpp"

#if __has_include("\csla_cfg\config.bin")
#else
#define PATCH_SKIP "CSLA - Iron Curtain"
#endif

#ifdef PATCH_SKIP
ACE_PATCH_NOT_LOADED(ADDON,PATCH_SKIP)
#else

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"CSLA", "US85"};
        skipWhenMissingDependencies = 1; // drop __has_include and addon.toml after 2.14
        author = ECSTRING(common,ACETeam);
        authors[] = {"Dahlgren"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"

#endif
