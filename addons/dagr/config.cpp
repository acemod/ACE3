#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_DAGR"};
        weapons[] = {"ACE_DAGR"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_weather"};
        author[] = {"Rosuto", "Ruthberg"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "Dialog.hpp"
#include "RscTitles.hpp"
