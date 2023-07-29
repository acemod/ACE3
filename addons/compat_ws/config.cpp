#include "script_component.hpp"

#if __has_include("\lxWS\data_f_lxWS\config.bin")
#else
#define PATCH_SKIP "Western Sahara"
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
        requiredAddons[] = {"data_f_lxWS_Loadorder"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Mike"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgWeapons.hpp"

#endif
