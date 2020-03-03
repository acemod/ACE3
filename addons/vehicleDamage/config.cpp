#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        // ammo/vehicle config defines touch all of these
        requiredAddons[] = {
            "ace_common", "ace_cookoff", "ace_dragon", "ace_hot", "ace_aircraft", "ace_ballistics", "ace_hellfire", "ace_frag", 
            "A3_Weapons_F", "A3_Weapons_F_Tank", "A3_Weapons_F_Mark", "A3_Weapons_F_Jets", "A3_Weapons_F_Destroyer",
            "A3_Armor_F", "A3_Armor_F_EPB", "A3_Armor_F_EPC", "A3_Armor_F_Gamma", "A3_Armor_F_Tank"
        };
        author = ECSTRING(common,ACETeam);
        authors[] = {""};
        url = ECSTRING(main,URL);
        VERSION_CONFIG;
    };
};

#include "CfgEventHandlers.hpp"
#include "CfgVehicles.hpp"
#include "CfgAmmo.hpp"
