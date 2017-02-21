#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Item_RangeCard"};
        weapons[] = {"ACE_RangeCard"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_Advanced_Ballistics","ace_scopes"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Ruthberg"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscTitles.hpp"
