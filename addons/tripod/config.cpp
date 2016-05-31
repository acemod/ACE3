#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Item_Tripod"};
        weapons[] = {"ACE_Tripod"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interaction"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"Rocko", "Scubaman3D", "Ruthberg"};
        url = "http://ace3mod.com";
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"