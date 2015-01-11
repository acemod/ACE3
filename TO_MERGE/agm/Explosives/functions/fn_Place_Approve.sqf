/*
	Name: AGM_Explosives_fnc_Place_Approve
	
	Author(s):
		Garth de Wet (LH)
	
	Description:
		Approves placement of the explosive, releases the placement object for it to settle in a location suitable for the explosive to be created.
	
	Parameters:
		Nothing
	
	Returns:
		Nothing
	
	Example:
		call AGM_Explosives_fnc_Place_Approve;
*/
if (AGM_Explosives_pfeh_running) then {
	["AGM_Explosives_Placement","OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
	AGM_Explosives_pfeh_running = false;
};
private ["_mag", "_setup", "_player"];
_setup = AGM_Explosives_Setup;
AGM_Explosives_Setup = objNull;
[AGM_Explosives_placer, "AGM_Explosives", false] call AGM_Core_fnc_setForceWalkStatus;
AGM_Explosives_placer = objNull;
_player = AGM_player;
[_player, "DefaultAction", _player getVariable ["AGM_Explosive_Place", -1]] call AGM_Core_fnc_removeActionEventHandler;
[_player, "MenuBack", _player getVariable ["AGM_Explosive_Cancel", -1]] call AGM_Core_fnc_removeActionEventHandler;
call AGM_Interaction_fnc_hideMouseHint;
if ((_setup getVariable ["AGM_Class", ""]) != "") then {
	_dir = (getDir _setup);
	if (_dir > 180) then {
		_dir = _dir - 180;
	} else {
		_dir = 180 + _dir;
	};
	_setup setVariable ["AGM_Dir", _dir];
	_player setVariable ["AGM_PlantingExplosive", true];
	_setup addEventHandler ["EpeContactStart", {
		if (!((_this select 0) getVariable ["AGM_Handled", false])) then {
			private ["_player", "_pos", "_attachTo"];
			_player = AGM_player;
			_pos = getPosATL (_this select 0);
			(_this select 0) enableSimulationGlobal false;
			if (surfaceIsWater _pos) then {
				_pos = getPosASL (_this select 0);
				(_this select 0) setPosASL _pos;
			}else{
				(_this select 0) setPosATL _pos;
			};
			(_this select 0) setVariable ["AGM_Handled", true];
			_player setVariable ["AGM_PlantingExplosive", false];
			_attachTo = objNull;
			if (!isNull (_this select 1) && {(_this select 1) isKindOf "AllVehicles"}) then {
				_attachTo = (_this select 1);
			};
			[(_this select 0),_attachTo, _pos] spawn {
				private ["_mag", "_setup", "_dir", "_player"];
				_setup = _this select 0;
				_player = AGM_player;
				_mag = _setup getVariable ["AGM_Class", ""];
				_dir = _setup getVariable ["AGM_Dir", 0];
				
				sleep getNumber(ConfigFile >> "CfgMagazines" >> _mag >> "AGM_DelayTime");
				_explosive = [_player, _this select 2, _dir, _mag, _setup getVariable "AGM_Trigger", [_setup getVariable "AGM_Timer"], isNull (_this select 1)] call AGM_Explosives_fnc_PlaceExplosive;
				deleteVehicle _setup;
				if (!isNull(_explosive)) then {
					_player RemoveMagazine _mag;
					sleep 0.2;
					if (!isNull (_this select 1)) then {
						_explosive attachTo [(_this select 1)];
						_dir = _dir - (getDir (_this select 1));
						[[_explosive, _dir, 0], "AGM_Explosives_fnc_setPos"] call AGM_Core_fnc_execRemoteFnc;
					};
				};
			};
		};
	}];
	_setup enableSimulationGlobal true;
	_player playActionNow "MedicOther";
	[_setup] spawn {
		private ["_setup", "_player"];
		_setup = _this select 0;
		_player = AGM_player;
		sleep 5;
		if (!isNull _setup) then {
			private ["_mag", "_dir", "_delayTime"];
			_mag = _setup getVariable ["AGM_Class", ""];
			_dir = _setup getVariable ["AGM_Dir", 0];
			_delayTime = (getNumber(ConfigFile >> "CfgMagazines" >> _mag >> "AGM_DelayTime")) - 5;
			if (_delayTime > 0) then {
				sleep _delayTime;
			};
			if (!isNull _setup) then {
				[_player, GetPosATL _setup, _dir, _mag, _setup getVariable "AGM_Trigger", [_setup getVariable "AGM_Timer"], true] call AGM_Explosives_fnc_PlaceExplosive;
				deleteVehicle _setup;
				_player RemoveMagazine _mag;
				_player setVariable ["AGM_PlantingExplosive", false];
			};
		};
	};
}else{
	deleteVehicle _setup;
};
