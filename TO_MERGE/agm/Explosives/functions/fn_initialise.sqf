/*
	Name: AGM_Explosives_fnc_Initialise
	
	Author(s):
		Garth de Wet (LH)
	
	Description:
		Initialises explosive behaviour.
	
	Parameters:
		None
	
	Returns:
		None
	
	Example:
		None
*/
if !(hasInterface) exitWith {};
AGM_Explosives_PlacedCount = 0;
AGM_Explosives_Setup = objNull;
AGM_Explosives_pfeh_running = false;
AGM_Explosives_null = [] spawn {
	waitUntil {sleep 0.356;!isNull(player)};
	[{(_this select 0) call AGM_Explosives_fnc_HandleScrollWheel;}] call AGM_Core_fnc_addScrollWheelEventHandler;
	player addEventHandler ["Respawn", {
		[(_this select 0)] call AGM_Explosives_fnc_initialiseUnit;
	}];
	player addEventHandler ["Killed", {
		private "_deadman";
		call AGM_Explosives_fnc_Place_Cancel;
		_deadman = [(_this select 0), "DeadManSwitch"] call AGM_Explosives_fnc_getPlacedExplosives;
		{
			[(_this select 0), -1, _x, true] call AGM_Explosives_fnc_DetonateExplosive;
		} count _deadman;
	}];
	player addEventHandler ["Take", {
		private ["_item", "_getter", "_giver", "_config"];
		_item = _this select 2;
		_getter = _this select 0;
		_giver = _this select 1;
		
		_config = ConfigFile >> "CfgWeapons" >> _item;
		if (isClass _config && {getNumber(_config >> "AGM_Detonator") == 1}) then {
			private ["_clackerItems"];
			_clackerItems = _giver getVariable ["AGM_Clacker", []];
			_getter SetVariable ["AGM_Clacker", (_getter getVariable ["AGM_Clacker", []]) + _clackerItems, true];
			
			_detonators = [_giver] call AGM_Explosives_fnc_getDetonators;
			if (count _detonators == 0) then {
				_giver setVariable ["AGM_Clacker", nil, true];
			};
		};
	}];
	player addEventHandler ["Put", {
		private ["_item", "_getter", "_giver", "_config"];
		_item = _this select 2;
		_getter = _this select 1;
		_giver = _this select 0;

		_config = ConfigFile >> "CfgWeapons" >> _item;
		if (isClass _config && {getNumber(_config >> "AGM_Detonator") == 1}) then {
			private ["_clackerItems"];
			_clackerItems = _giver getVariable ["AGM_Clacker", []];
			_getter SetVariable ["AGM_Clacker", (_getter getVariable ["AGM_Clacker", []]) + _clackerItems, true];
			
			_detonators = [_giver] call AGM_Explosives_fnc_getDetonators;
			if (count _detonators == 0) then {
				_giver setVariable ["AGM_Clacker", nil, true];
			};
		};
	}];
};
