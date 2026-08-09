#include "..\script_component.hpp"
/*
 * Author: GitHawk
 * Disconnects a fuel nozzle and makes unit pick it up.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Nozzle <OBJECT>
 * 2: Make unit take nozzle <BOOL> (default: true)
 * 3: Ground position to drop to (default: nozzle's current position)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, nozzle] call ace_refuel_fnc_disconnect
 *
 * Public: No
 */

params ["_unit", "_nozzle", ["_takeNozzle", true], "_groundPosition"];

private _sink = _nozzle getVariable [QGVAR(sink), objNull];

if (!isNull _sink) then {
    _sink setVariable [QGVAR(nozzle), nil, true];
};

// If the nozzle was providing fuel whilst abruptly disconnected, play stop sound (stops refilling sound)
if (_nozzle getVariable [QGVAR(isRefueling), false] && {!(_nozzle getVariable [QGVAR(jerryCan), false])}) then {
    [_nozzle, QGVAR(nozzle_stop), nil, true, true, true] call CBA_fnc_globalSay3D;
};

if (_nozzle isKindOf "Land_CanisterFuel_F") then { _nozzle setVariable [QEGVAR(cargo,canLoad), true, true]; };
_nozzle setVariable [QGVAR(sink), nil, true];
_nozzle setVariable [QGVAR(isConnected), false, true];
[_unit, _nozzle, _takeNozzle, _groundPosition] call FUNC(dropNozzle);

if (_takeNozzle && {!isNull _unit}) then {
    [_unit, _nozzle] call FUNC(takeNozzle);
};
