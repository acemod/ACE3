/*
 * Author: Garth 'L-H' de Wet
 *
 * Arguments:
 *
 * Return Value:
 * None
 *
 * Example:
 * object addEventHandler ["EpeContactStart", ACE_explosive_fnc_onLanded];
 *
 * Public: No
 */
#include "script_component.hpp"
if (!((_this select 0) getVariable [QGVAR(Handled), false])) then {
	private ["_player", "_pos", "_attachTo"];
	_player = ACE_player;
	_player setVariable [QGVAR(PlantingExplosive), false];
	_pos = getPosATL (_this select 0);
	(_this select 0) enableSimulationGlobal false;
	if (surfaceIsWater _pos) then {
		_pos = getPosASL (_this select 0);
		(_this select 0) setPosASL _pos;
	}else{
		(_this select 0) setPosATL _pos;
	};
	(_this select 0) setVariable [QGVAR(Handled), true];
	_attachTo = objNull;
	if (!isNull (_this select 1) && {(_this select 1) isKindOf "AllVehicles"}) then {
		_attachTo = (_this select 1);
	};
	private "_delay";
	_delay = getNumber(ConfigFile >> "CfgMagazines" >> ((_this select 0) getVariable [QGVAR(Class), ""]) >> "ACE_DelayTime");
	[{
		private ["_mag", "_setup", "_dir", "_player"];
		_setup = _this select 0;
		_player = ACE_player;
		_mag = _setup getVariable [QGVAR(Class), ""];
		_dir = _setup getVariable [QGVAR(Direction), 0];
		_explosive = [_player, _this select 2, _dir, _mag, _setup getVariable QGVAR(Trigger),
		[_setup getVariable QGVAR(Timer)], isNull (_this select 1)] call FUNC(placeExplosive);
		deleteVehicle _setup;
		if (!isNull(_explosive)) then {
			_player RemoveMagazine _mag;
			if (!isNull (_this select 1)) then {
				_explosive attachTo [(_this select 1)];
				_dir = _dir - (getDir (_this select 1));
				[[_explosive, _dir, 0], QFUNC(setPosition)] call EFUNC(common,execRemoteFnc);
			};
		};
	}, [(_this select 0),_attachTo, _pos], _delay, 0.1] call EFUNC(common,waitAndExecute);
};
