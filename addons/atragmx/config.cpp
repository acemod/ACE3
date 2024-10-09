#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {"ACE_Item_ATragMX"};
        weapons[] = {"ACE_ATragMX"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_advanced_ballistics", "ace_common", "ace_weather"};
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
