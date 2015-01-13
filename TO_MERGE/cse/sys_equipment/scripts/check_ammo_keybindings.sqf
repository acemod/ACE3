["check_current_magazine_count_eq", (["check_current_magazine_count_eq","action",[0,0,0,0]] call cse_fnc_getKeyBindingFromProfile_F), {
	private ["_percentage", "_text"];
	
	if (currentWeapon player != "" && currentMagazine player != "") then {
		_percentage = [player] call cse_fnc_getPercentageAmmoMagazine_EQ;
		_text = switch true do {
			case (_percentage >= 75) : { "Heavy weight" };
			case (_percentage >= 35) : { "Medium weight" };
			case (_percentage >= 15) : { "Light weight" };
			case (_percentage >= 0 ) : { "Very light weight" };
			default                    { "Unknown" };
		};
		["Magazine weight", [_text], 0] call cse_fnc_gui_displayInformation;
	};
	
}] call cse_fnc_addKeyBindingForAction_F;
["check_current_magazine_count_eq","action","Check Ammo","Check your current ammo count"] call cse_fnc_settingsDefineDetails_F;