#include "script_component.hpp"

#if __has_include("\rhsafrf\addons\rhs_main\loadorder\config.bin")
#else
    #define PATCH_SKIP "RHS AFRF"
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
        name = QUOTE(COMPONENT);
        units[] = {};
        weapons[] = {QGVAR(2b14_carry), QGVAR(nsv_carry), QGVAR(kord_carry), QGVAR(ags30_carry), QGVAR(spg9_carry), QGVAR(spg9m_carry), QGVAR(metis_carry), QGVAR(kornet_carry)};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "rhs_main_loadorder",
            "ace_csw"
        };
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ruthberg", "GitHawk", "BaerMitUmlaut", "commy2", "Skengman2"};
        url = ECSTRING(main,URL);
        skipWhenMissingDependencies = 1;
        VERSION_CONFIG;
    };
};

#include "CfgMagazines.hpp"
#include "CfgMagazineGroups.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

#endif
