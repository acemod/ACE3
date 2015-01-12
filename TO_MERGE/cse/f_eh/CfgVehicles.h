class CfgVehicles {
	class All;
	class AllVehicles : All {
		class EventHandlers {
			handleDamage = "[_this,'handleDamage'] call CSE_fnc_HandleDamage_EH_F;";
			HandleHeal = "[_this,'handleHeal'] call CSE_fnc_HandleHeal_EH_F;";
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";
		};
	};

	class Man;
	class CAManBase: Man {
		class EventHandlers {
			handleDamage = "[_this,'handleDamage'] call CSE_fnc_HandleDamage_EH_F;";
			HandleHeal = "[_this,'handleHeal'] call CSE_fnc_HandleHeal_EH_F;";
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";			
		};
	};

	class SoldierGB : CAManBase{
		class EventHandlers {
			handleDamage = "[_this,'handleDamage'] call CSE_fnc_HandleDamage_EH_F;";
			HandleHeal = "[_this,'handleHeal'] call CSE_fnc_HandleHeal_EH_F;";	
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";		 
		};
	};
	class SoldierWB : CAManBase {
		class EventHandlers {
			handleDamage = "[_this,'handleDamage'] call CSE_fnc_HandleDamage_EH_F;";
			HandleHeal = "[_this,'handleHeal'] call CSE_fnc_HandleHeal_EH_F;";	
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";		 
		};
	};
	class SoldierEB : CAManBase{
		class EventHandlers {
			handleDamage = "[_this,'handleDamage'] call CSE_fnc_HandleDamage_EH_F;";
			HandleHeal = "[_this,'handleHeal'] call CSE_fnc_HandleHeal_EH_F;";
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";
		};
	};
	class B_Soldier_base_F: SoldierWB {
		class EventHandlers {
			handleDamage = "[_this,'handleDamage'] call CSE_fnc_HandleDamage_EH_F;";
			HandleHeal = "[_this,'handleHeal'] call CSE_fnc_HandleHeal_EH_F;";
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";
		};
	};
	class B_Soldier_03_f: B_Soldier_base_F {
		class EventHandlers {
			handleDamage = "[_this,'handleDamage'] call CSE_fnc_HandleDamage_EH_F;";
			HandleHeal = "[_this,'handleHeal'] call CSE_fnc_HandleHeal_EH_F;";
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";
		};
	};

	class LandVehicle;
	class Car: LandVehicle {
		class EventHandlers {
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";
		};
	};
	class Tank: LandVehicle {
		class EventHandlers {
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";
		};
	};
	
	class Air;
	class Helicopter: Air {
		class EventHandlers {
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";
		};
 	};
	class Plane: Air {
		class EventHandlers {
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";
		};
	};
	class Ship: AllVehicles {
		class EventHandlers {
			local = "_this call cse_eh_cba_compat_local;";
			killed = "_this call cse_eh_cba_compat_Killed";
			firedNear = "_this call cse_eh_cba_compat_FiredNear";
			fired = "_this call cse_eh_cba_compat_Fired";
			respawn = "_this call cse_eh_cba_compat_Respawn";
			Take = "_this call cse_eh_cba_compat_Take";
			Put = "_this call cse_eh_cba_compat_Put";
			GetIn = "_this call cse_eh_cba_compat_GetIn";
			GetOut = "_this call cse_eh_cba_compat_GetOut";
		};
 	};
};