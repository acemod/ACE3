#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"TaoSensai", "KoffeinFlummi"};
        url = ECSTRING(main,URL);
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
