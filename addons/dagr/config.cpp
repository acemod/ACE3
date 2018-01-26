#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Item_DAGR"};
        weapons[] = {"ACE_DAGR"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_weather"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Rosuto", "Ruthberg"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "Dialog.hpp"
#include "RscTitles.hpp"
