#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_MX2A"};
        weapons[] = {"ACE_MX2A"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_apl"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Spooner", "tcp"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
