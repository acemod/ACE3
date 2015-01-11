class CfgVehicles {
	// class Logic;
	// class ace_sys_arty_computers_battery: Logic
	// {
		// displayName = "ACE Artillery Battery";
		// icon = "\ca\modules\ARTY\data\ui\icon_ARTY_ca.paa";
		// vehicleClass = "Modules";
		// class Eventhandlers
		// {
			// init = "_script = _this execVM '\x\ace\addons\sys_arty_computers\fnc_addBattery.sqf'";
		// };
	// };
	class HMMWV_M1035_DES_EP1;
	class ACE_BCS_HMMV: HMMWV_M1035_DES_EP1 {
		displayName = $STR_ACE_ARTY_COMPUTERS_BCS_HMMV;
		vehicleClass = "ACE_Arty_Equipment";
		class UserActions {
			class useGyk37 {
				displayName = $STR_ACE_ARTY_COMPUTERS_BCS_HMMV_USECOMP;
				displayNameDefault = $STR_ACE_ARTY_COMPUTERS_BCS_HMMV_USECOMP;
				priority = -10;
				radius = 5;
				position = "camera";
				showWindow = 0;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "(player in this) && {alive this}";
				statement = "[this] call ace_sys_arty_computers_gyk37_fnc_startBCS";
			};
		};
	};
	
	class HMMWV;
	class ACE_BCS_HMMV_WOODLAND: HMMWV {
		displayName = $STR_ACE_ARTY_COMPUTERS_BCS_HMMV_WOODLAND;
		vehicleClass = "ACE_Arty_Equipment";
		class UserActions {
			class useGyk37 {
				displayName = $STR_ACE_ARTY_COMPUTERS_BCS_HMMV_USECOMP;
				displayNameDefault = $STR_ACE_ARTY_COMPUTERS_BCS_HMMV_USECOMP;
				priority = -10;
				radius = 5;
				position = "camera";
				showWindow = 0;
				onlyForPlayer = 1;
				shortcut = "";
				condition = "(player in this) && {alive this}";
				statement = "[this] call ace_sys_arty_computers_gyk37_fnc_startBCS";
			};
		};
	};
};