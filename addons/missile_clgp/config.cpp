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

#include "ACE_GuidanceConfig.hpp"
#include "CfgAmmo.hpp"
#include "CfgEventhandlers.hpp"
#include "CfgMagazines.hpp"
#include "CfgMagazineWells.hpp"
#include "CfgWeapons.hpp"
#include "GUI.hpp"
