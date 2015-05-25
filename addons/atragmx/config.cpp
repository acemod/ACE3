#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_ATragMX"};
        weapons[] = {"ACE_ATragMX"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ACE_common", "ACE_weather"};
        author = "Ruthberg";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "RscTitles.hpp"