private ["_args"];
_args = _this;
CSE_ENABLED_DIALOG_INTERACTION_AIM = true;
CSE_USE_EQUIPMENT_AIM = false;
CSE_BIOMETRIC_SCANNER_SETTING_AIM = 0;
CSE_DETAIN_SETTING_AIM = 0;
CSE_SEARCH_SETTING_AIM = 0;

{
	_value = _x select 1;
	if (!isnil "_value") then {
		if (_x select 0 == "enableDetain") exitwith {
			CSE_DETAIN_SETTING_AIM = _value;
			if ((_x select 1) > 0) then {
				CSE_ENABLED_DETAIN_AIM = true;
			} else {
				CSE_ENABLED_DETAIN_AIM = false;
			};
		};

		if (_x select 0 == "enableSearch") exitwith {
			CSE_SEARCH_SETTING_AIM = _value;
			if ((_x select 1) > 0) then {
				CSE_ENABLED_SEARCH_AIM = true;
			} else {
				CSE_ENABLED_SEARCH_AIM = false;
			};
		};

		if (_x select 0 == "enableBiometric") exitwith {
			CSE_BIOMETRIC_SCANNER_SETTING_AIM = _x select 1;
			if ((_x select 1) > 0) then {
				CSE_ENABLED_BIOMETRIC_SCANNER_AIM = true;
			} else {
				CSE_ENABLED_BIOMETRIC_SCANNER_AIM = false;
			};
		};
		if (_x select 0 == "enableConversation") exitwith {
			CSE_ENABLED_DIALOG_INTERACTION_AIM = (_x select 1);
		};

		if (_x select 0 == "useEquipment") exitwith {
			CSE_USE_EQUIPMENT_AIM = (_x select 1);
		};
}	;
}foreach _args;

[format["AIM - Advanced Interaction initialisation started"],3] call cse_fnc_debug;
waituntil{!isnil "cse_gui"};

[format["AIM - Advanced Interaction initialisation completed"],3] call cse_fnc_debug;


cse_fnc_action_openBiometricScanner_AIM = {
	private ["_target"];
	if (CSE_ENABLED_BIOMETRIC_SCANNER_AIM && (!CSE_USE_EQUIPMENT_AIM || [player, "cse_HIDDE"] call cse_fnc_hasItem)) then {
		_target = cursorTarget;
		if (!iSNull _target) then {
			if ((_target isKindOf "CAManBase") && ((player distance _target) < 10)) then {
				[player,_target] call cse_fnc_biometricScanner;
			};
		};
	};
};

if (CSE_ENABLED_BIOMETRIC_SCANNER_AIM) then {

	call compile preprocessFile "cse\cse_sys_advanced_interaction\biometric_scanner\init.sqf";
	_entries = [
		["Biometric",
		{
			([_this select 0, _this select 1, CSE_BIOMETRIC_SCANNER_SETTING_AIM, "cse_HIDDE"] call cse_fnc_canPerformAction_AIM)
		}, "cse\cse_sys_advanced_interaction\biometric_scanner\data\icon_biometricscanner.paa",
		{ closeDialog 0; [(_this select 0),(_this select 1)] call cse_fnc_biometricScanner; }, "Use Biometric Scanner"]
	];
	["ActionMenu","interaction", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;
};

if (CSE_ENABLED_SEARCH_AIM) then {
	_entries = [
		["Search",
		{ ([_this select 0, _this select 1, CSE_SEARCH_SETTING_AIM, ""] call cse_fnc_canPerformAction_AIM) }, CSE_ICON_PATH + "icon_search.paa",
		{
			closeDialog 0; [(_this select 0),(_this select 1)] call cse_fnc_searchPerson_AIM;
		},"Search Person"]
	];
	["ActionMenu","interaction", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;
};

if (CSE_ENABLED_DIALOG_INTERACTION_AIM) then {
	call compile preprocessFile "cse\cse_sys_advanced_interaction\dialog_module\init.sqf";
	_entries = [
		["Speak",{(((_this select 1) iskindof "CaManBase") && {((player distance (_this select 1)) < 10)} && {((_this select 1) != (_this select 0))} && {!Isplayer (_this select 1)})}, CSE_ICON_PATH + "icon_speak.paa",
		{
			if ([_this select 1] call cse_fnc_isAwake) then {
				closeDialog 0; [_this select 1, player] call cse_fnc_playerStartConverationWith_AIM;
			};
		},"Speak with Person"]
	];
	["ActionMenu","interaction", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;
};

if (CSE_ENABLED_DETAIN_AIM) then {
	_entries = [
		["Arrest",{[player, _this select 1] call cse_fnc_canDetain}, CSE_ICON_PATH + "icon_handcuffs.paa",
		{
			closeDialog 0; [(_this select 0),(_this select 1)] call cse_fnc_arrest_AIM;
		},"Arrest Person"],

		["Release",{[player, _this select 1] call cse_fnc_canPerformArrestActions_AIM}, CSE_ICON_PATH + "icon_handcuffs.paa",
		{
			closeDialog 0; [(_this select 0),(_this select 1)] call cse_fnc_release_AIM;
		},"Release Person"],

		["Move",{[player, _this select 1] call cse_fnc_canPerformArrestActions_AIM}, CSE_ICON_PATH + "icon_movement.paa",
		{
			closeDialog 0; [(_this select 0),(_this select 1)] call cse_fnc_move_AIM;
		},"Move Person"],
		["Place",{[player, _this select 1] call cse_fnc_canPerformArrestActions_AIM}, CSE_ICON_PATH + "icon_placedown.paa",
		{
			closeDialog 0; [(_this select 0),(_this select 1)] call cse_fnc_placedown_AIM;
		},"Place down"],
		["Load",{[player, _this select 1] call cse_fnc_canPerformArrestActions_AIM}, CSE_ICON_PATH + "icon_place_in.paa",
		{
			closeDialog 0; [(_this select 0),(_this select 1)] call cse_fnc_load_AIM;
		},"Load in nearby vehicle"]
	];
	["ActionMenu","interaction", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;


	_entries = [
		["Unload (Pris)", {((_this call cse_fnc_interactWithVehicle_Crew_Condition) && (count ((_this select 1) getvariable ["cse_loaded_detainees_AIM",[]]) > 0))}, CSE_ICON_PATH + "icon_open_dialog.paa",
			{
				closeDialog 0;
				_loaded = ((_this select 1) getvariable ["cse_loaded_detainees_AIM",[]]);
				{
					[player,_x,false] call cse_fnc_unload_AIM;
				}foreach _loaded
			}, "Unload Prisoners"]
	];
	["ActionMenu","interaction", _entries ] call cse_fnc_addMultipleEntriesToRadialCategory_F;
};