class CfgFunctions {
	class CSE {
		class Equipment	{
			file = "cse\cse_sys_equipment\functions";
			class hasAttachableItem_EQ { recompile = 1; };
			class attachItem_EQ { recompile = 1; };
			class detachItem_EQ { recompile = 1; };
			class isAttachableItem_EQ { recompile = 1; };
			class hasItemAttached_EQ { recompile = 1; };
			class getAllEquipmentOptions_EQ { recompile = 1; };
			class registerNewEquipmentOption_EQ { recompile = 1; };
			class areEquipmentOptionsAvailable_EQ { recompile = 1; };
			class dropFlare_EQ { recompile = 1; };
			class moduleFlare_EQ { recompile = 1; };
			class hasFlare_EQ { recompile = 1; };
			class isFlare_EQ { recompile = 1; };
			class putWeaponOnBack_EQ { recompile = 1; };
			class getPercentageAmmoMagazine_EQ { recompile = 1; };
			class hideUnitInfoAmmo_EQ { recompile = 1; };
		};
		class WeaponRest {
			file = "cse\cse_sys_equipment\weaponresting\functions";
			class keyPressed_WR { recompile = 1; };
			class canRestWeapon_WR { recompile = 1; };
			class canDeployBipod_WR { recompile = 1; };
			class restWeapon_WR { recompile = 1; };
			class unrestWeapon_WR { recompile = 1; };
			class deployWeapon_WR { recompile = 1; };
			class undeployWeapon_WR { recompile = 1; };
			class actionReleaseWeapon_WR { recompile = 1; };
			class hasBipod_WR { recompile = 1; };
		};
		class WeaponSafety {
			file = "cse\cse_sys_equipment\weaponsafety\functions";
			class safetyOff_ws { recompile = 1; };
			class safetyOn_ws { recompile = 1; };
		};
		class nightVisionModule {
			file = "cse\cse_sys_equipment\nvg\functions";
			class adjustBrightness_NVG { recompile = 1; };
		};

		class MagazineRepack {
			file = "cse\cse_sys_equipment\magazineRepack\functions";
			class repackMagazines { recompile = 1; };
			class repackMagazinesAll { recompile = 1; };
		};		
	};
};
