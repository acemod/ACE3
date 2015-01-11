// by Garth de Wet (LH), edited by commy2

if (AGM_Fortifications_pfeh_running) then {
	["AGM_Fortifications_Placement", "OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
	AGM_Fortifications_pfeh_running = false;
};

private "_setup";

_setup = AGM_Fortifications_Setup;

AGM_Fortifications_Setup = objNull;
[AGM_Fortifications_placer, "AGM_Logistics", false] call AGM_Core_fnc_setForceWalkStatus;
AGM_Fortifications_placer = objNull;

[player, "DefaultAction", player getVariable ["AGM_Fortifications_Place", -1]] call AGM_Core_fnc_removeActionEventHandler;
[player, "MenuBack", player getVariable ["AGM_Fortifications_Cancel", -1]] call AGM_Core_fnc_removeActionEventHandler;

call AGM_Interaction_fnc_hideMouseHint;
_setup spawn {
	_pos = getPosASL _this;
	_dir = getDir _this;

	//_dir = if (_dir > 180) then {_dir - 180} else {180 + _dir};	// ?

	player setVariable ["AGM_PlantingExplosive", true];

	player playActionNow "MedicOther";

	sleep 5;

	deleteVehicle AGM_Fortifications_crate;

	// create global object
	_type = typeOf _this;
	_setup = _type createVehicle [0, 0, -10000];
	deleteVehicle _this;
	_setup setDir _dir;
	_setup setPosASL _pos;

	player setVariable ["AGM_PlantingExplosive", false];

	_this enableSimulationGlobal true;
	_this allowDamage true;
	//_this setDamage 0;

	/*[_setup] spawn {
		sleep 10;

		_setup = _this select 0;

		if (!isNull _setup) then {
			_mag = _setup getVariable ["AGM_Class", ""];
			_dir = _setup getVariable ["AGM_Dir", 0];
			
			sleep getNumber(ConfigFile >> "CfgMagazines" >> _mag >> "AGM_DelayTime");
			[player, GetPosATL _setup, _dir, _mag, _setup getVariable "AGM_Trigger", [_setup getVariable "AGM_Timer"], true] call AGM_Explosives_fnc_PlaceExplosive;
			deleteVehicle _setup;
			player RemoveMagazine _mag;
		};
	};*/

};
