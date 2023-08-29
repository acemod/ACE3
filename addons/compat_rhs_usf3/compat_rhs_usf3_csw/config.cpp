#include "script_component.hpp"

#if __has_include("\rhsusf\addons\rhsusf_main\loadorder\config.bin")
#else
    #define PATCH_SKIP "RHS USAF"
#endif

#if __has_include("\z\ace\addons\csw\script_component.hpp")
    #include "\z\ace\addons\csw\script_config_macros_csw.hpp"
#else
    #ifndef PATCH_SKIP
        #define PATCH_SKIP "ACE Crew Served Weapons"
    #endif
#endif

#ifdef PATCH_SKIP
ACE_PATCH_NOT_LOADED(ADDON,PATCH_SKIP)
#else

class CfgPatches {
    class ADDON {
        addonRootClass = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {QGVAR(m252_carry), QGVAR(m2_carry), QGVAR(mk19_carry), QGVAR(tow_carry)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "rhsusf_main_loadorder",
            "ace_csw"
        };
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgMagazines.hpp"
#include "CfgMagazineGroups.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

#endif
