#include "script_component.hpp"

class CfgPatches {
    class ADDON {
        name = COMPONENT_NAME;
        units[] = {};
        weapons[] = {};
        requiredVersion = REQUIRED_VERSION;
        requiredAddons[] = {
            "cba_main",
            "ace_csw",
            "ace_explosives",
            "ace_rearm",
            "ace_refuel",
            "ace_repair",
            "ww2_spe_assets_c_weapons_infantryweapons_c",
            "ww2_spe_assets_c_vehicles_staticweapons_c",
            "ww2_spe_assets_c_vehicles_weapons_c",
            "ww2_spe_core_f_system_staticweapons_f",
            "ww2_spe_core_c_core_c_eventhandlers"
        };
        author = ECSTRING(common, ACETeam);
        authors[] = {
            "sancron",
            "nomisum",
            "coldfront15/Henderson",
            "BrettMayson"
        };
        url = ECSTRING(main, URL);
        VERSION_CONFIG;
    };
};

class CfgFunctions
{
	class SPE_Weapons_Static
	{
        class SPE_Weapons_Static
		{
			file = "z\ace\addons\compat_spe\functions";
            class player_put_EH{};
			class player_take_EH{};
			class fired_EH{};
			class init_EH{};
			class getin_EH{};
			class getout_EH{};
			class equip_tripod{};
			class can_assemble_weapon{};
			class assemble_weapon{};
			class disassemble_weapon{};
			class can_disassemble_weapon{};
			class resupply_ammo{};
			class can_resupply_ammo{};
			class unload_ammo{};
			class unload_all_ammo{};
			class can_unload_ammo{};
			class drop_magazine{};
			class can_alter_height{};
			class alter_height{};
			class prepare_ammo{};
			class attempt_to_resupply_ammo{};
			class load_static_weapon{};
			class getout_of_static_weapon{};
			class toggle_range_table{};
			class rapid_deploy_weapon{};
			class addMagazine{};
			class removeMagazine{};
			class can_Reload{};
			class can_prepare_ammo{};
        };
	};
};

#include "ACE_CSW_Groups.hpp"
#include "ACE_Medical_Injuries.hpp"
#include "CfgAmmo.hpp"
#include "CfgEventHandlers.hpp"
#include "CfgGlasses.hpp"
#include "CfgMagazines.hpp"
#include "CfgVehicles.hpp"
#include "CfgWeapons.hpp"
