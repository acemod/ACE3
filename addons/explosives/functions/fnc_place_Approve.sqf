/*
	Name: ACE_Explosives_fnc_Place_Approve

	Author(s):
		Garth de Wet (LH)

	Description:
		Approves placement of the explosive, releases the placement object for it to settle in a location suitable for the explosive to be created.

	Parameters:
		Nothing

	Returns:
		Nothing

	Example:
		call ACE_Explosives_fnc_Place_Approve;
*/
#include "\z\ace\explosives\script_component.hpp"
if (GVAR(pfeh_running)) then {
	[QGVAR(Placement),"OnEachFrame"] call BIS_fnc_removeStackedEventHandler;
	GVAR(pfeh_running) = false;
};
private ["_mag", "_setup", "_player"];
_setup = GVAR(Setup);
GVAR(Setup) = objNull;
[GVAR(placer), "ACE_Explosives", false] call EFUNC(Core,setForceWalkStatus);
GVAR(placer) = objNull;
_player = ACE_player;
[_player, "DefaultAction", _player getVariable [QGVAR(Place), -1]] call EFUNC(Core,removeActionEventHandler);
[_player, "MenuBack", _player getVariable [QGVAR(Cancel), -1]] call EFUNC(Core,removeActionEventHandler);
call EFUNC(Interaction,hideMouseHint);
if ((_setup getVariable [QGVAR(Class), ""]) != "") then {
	_dir = (getDir _setup);
	if (_dir > 180) then {
		_dir = _dir - 180;
	} else {
		_dir = 180 + _dir;
	};
	_setup setVariable [QGVAR(Direction), _dir];
	_player setVariable [QGVAR(PlantingExplosive), true];
	_setup addEventHandler ["EpeContactStart", {
		if (!((_this select 0) getVariable [QGVAR(Handled), false])) then {
			private ["_player", "_pos", "_attachTo"];
			_player = ACE_player;
			_pos = getPosATL (_this select 0);
			(_this select 0) enableSimulationGlobal false;
			if (surfaceIsWater _pos) then {
				_pos = getPosASL (_this select 0);
				(_this select 0) setPosASL _pos;
			}else{
				(_this select 0) setPosATL _pos;
			};
			(_this select 0) setVariable [QGVAR(Handled), true];
			_player setVariable [QGVAR(PlantingExplosive), false];
			_attachTo = objNull;
			if (!isNull (_this select 1) && {(_this select 1) isKindOf "AllVehicles"}) then {
				_attachTo = (_this select 1);
			};
			[(_this select 0),_attachTo, _pos] spawn { // TODO: Change to scheduled delay execution
				private ["_mag", "_setup", "_dir", "_player"];
				_setup = _this select 0;
				_player = ACE_player;
				_mag = _setup getVariable [QGVAR(Class), ""];
				_dir = _setup getVariable [QGVAR(Direction), 0];

				sleep getNumber(ConfigFile >> "CfgMagazines" >> _mag >> "ACE_DelayTime");
				_explosive = [_player, _this select 2, _dir, _mag, _setup getVariable QGVAR(Trigger),
				[_setup getVariable QGVAR(Timer)], isNull (_this select 1)] call FUNC(placeExplosive);
				deleteVehicle _setup;
				if (!isNull(_explosive)) then {
					_player RemoveMagazine _mag;
					if (!isNull (_this select 1)) then {
						_explosive attachTo [(_this select 1)];
						_dir = _dir - (getDir (_this select 1));
						[[_explosive, _dir, 0], QUOTE(FUNC(setPosition))] call EFUNC(Core,execRemoteFnc);
					};
				};
			};
		};
	}];
	_setup enableSimulationGlobal true;
	_player playActionNow "MedicOther";
	[_setup] spawn { // TODO: Change to scheduled delay execution
		private ["_setup", "_player"];
		_setup = _this select 0;
		_player = ACE_player;
		sleep 5;
		if (!isNull _setup) then {
			private ["_mag", "_dir", "_delayTime"];
			_mag = _setup getVariable [QGVAR(Class), ""];
			_dir = _setup getVariable [QGVAR(Direction), 0];
			_delayTime = (getNumber(ConfigFile >> "CfgMagazines" >> _mag >> "ACE_DelayTime")) - 5;
			if (_delayTime > 0) then {
				sleep _delayTime;
			};
			if (!isNull _setup) then {
				[_player, GetPosATL _setup, _dir, _mag, _setup getVariable QGVAR(Trigger),
				[_setup getVariable QGVAR(Timer)], true] call FUNC(placeExplosive);
				deleteVehicle _setup;
				_player RemoveMagazine _mag;
				_player setVariable [QGVAR(PlantingExplosive), false];
			};
		};
	};
}else{
	deleteVehicle _setup;
};
