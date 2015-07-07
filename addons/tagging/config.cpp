#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_tagWall0", "ACE_tagWall1", "ACE_tagWall2", "ACE_tagWall3", "ACE_tagWall4", "ACE_Item_Spraypaint"};
        weapons[] = {"ACE_Spraypaint"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author[] = {"BaerMitUmlaut"};
        authorUrl = "https://github.com/BaerMitUmlaut";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"