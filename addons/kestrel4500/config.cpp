#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_Kestrel4500"};
        weapons[] = {"ACE_Kestrel4500"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_common", "ACE_weather"};
        author[] = {ECSTRING(common,ACETeam), "Ruthberg"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgSound.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscTitles.hpp"