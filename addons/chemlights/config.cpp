
#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        units[] = {"ACE_Box_Chemlights","ACE_Item_Chemlight_Shield","ACE_Item_Chemlight_Shield_Green","ACE_Item_Chemlight_Shield_Red","ACE_Item_Chemlight_Shield_Blue","ACE_Item_Chemlight_Shield_Yellow","ACE_Item_Chemlight_Shield_Orange","ACE_Item_Chemlight_Shield_White"};
        weapons[] = {"ACE_Chemlight_Shield", "ACE_Chemlight_Shield_Green","ACE_Chemlight_Shield_Red","ACE_Chemlight_Shield_Blue","ACE_Chemlight_Shield_Yellow","ACE_Chemlight_Shield_Orange","ACE_Chemlight_Shield_White"};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_common"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"voiper"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgMagazines.hpp"
#include "CfgAmmo.hpp"
#include "CfgLights.hpp"
#include "Effects.hpp"
