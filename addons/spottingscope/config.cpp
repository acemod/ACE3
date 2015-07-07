#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_SpottingScope"};
        weapons[] = {"ACE_SpottingScope"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_apl", "ace_interaction"};
        author[] = {"Rocko", "Scubaman3D", "Ruthberg"};
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"