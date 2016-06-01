#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_TargetWall","ACE_Box_Ammo"};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"commy2","Ruthberg"};
        PBO_URL
        VERSION_CONFIG;
    };
};

#include "CfgAmmo.hpp"
#include "CfgMagazines.hpp"
#include "CfgWeapons.hpp"
#include "CfgVehicles.hpp"
