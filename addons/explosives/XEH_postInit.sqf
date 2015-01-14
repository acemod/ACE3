/*
	Name: XEH_postInit.sqf

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
#include "script_component.hpp"
if !(hasInterface) exitWith {};
GVAR(PlacedCount) = 0;
GVAR(Setup) = objNull;
GVAR(pfeh_running) = false;

[{(_this select 0) call FUNC(handleScrollWheel);}] call EFUNC(Common,addScrollWheelEventHandler);
player addEventHandler ["Killed", {
	private "_deadman";
	call FUNC(place_Cancel);
	_deadman = [(_this select 0), "DeadManSwitch"] call FUNC(getPlacedExplosives);
	{
		[(_this select 0), -1, _x, true] call FUNC(detonateExplosive);
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
		_clackerItems = _giver getVariable [QGVAR(Clackers), []];
		_getter SetVariable [QGVAR(Clackers), (_getter getVariable [QGVAR(Clackers), []]) + _clackerItems, true];

		_detonators = [_giver] call FUNC(getDetonators);
		if (count _detonators == 0) then {
			_giver setVariable [QGVAR(Clackers), nil, true];
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
		_clackerItems = _giver getVariable [QGVAR(Clackers), []];
		_getter SetVariable [QGVAR(Clackers), (_getter getVariable [QGVAR(Clackers), []]) + _clackerItems, true];

		_detonators = [_giver] call FUNC(getDetonators);
		if (count _detonators == 0) then {
			_giver setVariable [QGVAR(Clackers), nil, true];
		};
	};
}];
