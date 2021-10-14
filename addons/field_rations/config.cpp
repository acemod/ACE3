#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {
            "ACE_WaterBottle_Item",
            "ACE_WaterBottle_Half_Item",
            "ACE_WaterBottle_Empty_Item",
            "ACE_Canteen_Item",
            "ACE_Canteen_Half_Item",
            "ACE_Canteen_Empty_Item",
            "ACE_Can_Spirit_Item",
            "ACE_Can_Franta_Item",
            "ACE_Can_RedGull_Item",
            "ACE_MRE_LambCurry_Item",
            "ACE_MRE_BeefStew_Item",
            "ACE_MRE_CreamTomatoSoup_Item",
            "ACE_MRE_CreamChickenSoup_Item",
            "ACE_MRE_ChickenTikkaMasala_Item",
            "ACE_MRE_SteakVegetables_Item",
            "ACE_MRE_MeatballsPasta_Item",
            "ACE_MRE_ChickenHerbDumplings_Item",
            "ACE_Humanitarian_Ration_Item"
        };
        weapons[] = {
            "ACE_WaterBottle",
            "ACE_WaterBottle_Half",
            "ACE_WaterBottle_Empty",
            "ACE_Canteen",
            "ACE_Canteen_Half",
            "ACE_Canteen_Empty",
            "ACE_Can_Spirit",
            "ACE_Can_Franta",
            "ACE_Can_RedGull",
            "ACE_MRE_LambCurry",
            "ACE_MRE_BeefStew",
            "ACE_MRE_CreamTomatoSoup",
            "ACE_MRE_CreamChickenSoup",
            "ACE_MRE_ChickenTikkaMasala",
            "ACE_MRE_SteakVegetables",
            "ACE_MRE_MeatballsPasta",
            "ACE_MRE_ChickenHerbDumplings",
            "ACE_Humanitarian_Ration"
        };
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {"ace_interact_menu"};
        author = ECSTRING(common,ACETeam);
        authors[] = {"mharis001", "Glowbal", "PabstMirror"};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };

    class XADDON: ADDON {};
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
#include "CfgSounds.hpp"
#include "CfgMoves.hpp"
#include "Cfg3DEN.hpp"
#include "RscTitles.hpp"
#include "CfgUIGrids.hpp"
