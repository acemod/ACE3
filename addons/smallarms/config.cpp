#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author[] = {"TaoSensai", "KoffeinFlummi"};
        authorUrl = "https://github.com/Taosenai/tmr";
        VERSION_CONFIG;
    };
};

// EVERYTHING BELOW BELONGS TO TAOSENSAI

//////////////////////////////////////////////////////
// TMR strings update for weapons and magazines:
// 1. Change displayname to match TMR standards.
// 3. Add displaynameshort to TMR standards.
//////////////////////////////////////////////////////

#include "CfgMagazines.hpp"

#include "CfgWeapons.hpp"

#include "CfgVehicles.hpp"
