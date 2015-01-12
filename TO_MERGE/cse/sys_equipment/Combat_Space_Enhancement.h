#define MENU_KEYBINDING 1
#define ACTION_KEYBINDING 2
#define CLIENT_SETTING 3

class Combat_Space_Enhancement {
	class EventHandlers {
		class PostInit_EventHandlers {
			class cse_sys_equipment {
				// init = " call compile preprocessFile 'cse\cse_sys_equipment\init_sys_equipment.sqf';";
			};
		};
	};
  	class cfgModules {
  		class cse_sys_equipment {
			init = "call compile preprocessFile 'cse\cse_sys_equipment\init_sys_equipment.sqf';";
			name = "Equipment Module";	
			class EventHandlers {
				class AllVehicles {
					GetOut = "if (CSE_HIDE_AMMO_COUNTERS_EQ> 0) then { if (_this select 2 == player) then {0 = [] spawn { waituntil {vehicle player == player}; [true] call cse_fnc_hidEUnitInfoAmmo_EQ;};};};";
				};
			};
  		};

  		// BACKWARDS COMPATABILITY MODULES
  		// Have to stay put, as cse_sys_equipment will make use of them.
  		// The modules themselves will be hidden.
		class cse_sys_magazineRepack {
			init = "call compile preprocessFile 'cse\cse_sys_equipment\scripts\register_magazine_repack_actions.sqf';";
			name = "Magazine Repack";
			disableConfigExecution = 1;
		};
		class cse_sys_attachableItems {
			init = "call compile preprocessFile 'cse\cse_sys_equipment\scripts\register_attachable_items_actions.sqf';";
			name = "Attachable Items";
			disableConfigExecution = 1;
		};

		class cse_sys_weaponrest {
			init = "call compile preprocessFile 'cse\cse_sys_equipment\weaponresting\init_sys_weaponrest.sqf';";
			name = "Weapon Resting & Bipods";
			disableConfigExecution = 1;
			class Configurations {
				class cse_sys_weaponRestAction {
					type = ACTION_KEYBINDING;
					title = $STR_DEPLOY_WEAPON_REST_TTTLE;
					description = $STR_DEPLOY_WEAPON_REST_DESC;
					value[] = {56,1,2,2};
					onPressed = "[] call cse_fnc_keyPressed_WR;";
				};
				class cse_sys_weaponUnrestAction {
					type = ACTION_KEYBINDING;
					title = $STR_DEPLOY_WEAPON_UNREST_TTTLE;
					description = $STR_DEPLOY_WEAPON_UNREST_DESC;
					value[] = {0,0,0,0};
					onPressed = "[] call cse_fnc_actionReleaseWeapon_WR;";
				};
			};
		};
		class cse_sys_weaponsafety {
			init = "call compile preprocessFile 'cse\cse_sys_equipment\weaponsafety\init_sys_weaponsafety.sqf';";
			name = "Weapon Safety";
			disableConfigExecution = 1;
		};
		class cse_sys_nightvision {
			init = "call compile preprocessFile 'cse\cse_sys_equipment\nvg\init_sys_nightvision.sqf';";
			name = "Night Vision";
			disableConfigExecution = 1;
			class Configurations {
				class cse_sys_nvgAdjustBrightness_UP {
					type = ACTION_KEYBINDING;
					title = $STR_INCREASE_NVG_BIRGHTNESS_TITLE;
					description = $STR_INCREASE_NVG_BIRGHTNESS_DESC;
					value[] = {201,0,0,1};
					onPressed = "[player,0.1] call cse_fnc_adjustBrightness_NVG;";
				};
				class cse_sys_nvgAdjustBrightness_DOWN {
					type = ACTION_KEYBINDING;
					title = $STR_DECREASE_NVG_BIRGHTNESS_TITLE;
					description = $STR_DECREASE_NVG_BIRGHTNESS_DESC;
					value[] = {209,0,0,1};
					onPressed = "[player,-0.1] call cse_fnc_adjustBrightness_NVG;";
				};
			};
		};
		
	};
};