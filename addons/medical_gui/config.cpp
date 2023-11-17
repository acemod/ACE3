#include "script_component.hpp"

#pragma hemtt flag pe23_ignore_has_include
#if __has_include("\z\ace\addons\nomedical\script_component.hpp")
#define PATCH_SKIP "No Medical"
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
        requiredAddons[] = {"ace_medical_treatment", "ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Glowbal", "mharis001"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgUIGrids.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "gui.hpp"

#endif
