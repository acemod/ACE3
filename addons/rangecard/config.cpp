#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_RangeCard"};
        weapons[] = {"ACE_RangeCard"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_Advanced_Ballistics"};
        author = "Ruthberg";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscTitles.hpp"