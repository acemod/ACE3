#include "script_component.hpp"

#pragma hemtt flag pe23_ignore_has_include
#if __has_include("\z\ace\addons\norealisticnames\script_component.hpp")
#define PATCH_SKIP "No Realistic Names"
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
        requiredAddons[] = {"ace_common", "ace_optics"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"KoffeinFlummi","TaoSensai","commy2"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;

        // this prevents any patched class from requiring this addon
        addonRootClass = "A3_Characters_F";
    };
};

#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"

#endif
