#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_missileguidance"};
        author = ECSTRING(common,ACETeam);
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventhandlers.hpp"

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"

#include "ACE_GuidanceConfig.hpp"
