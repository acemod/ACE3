/*
 * Author: Dystopian
 * Makes an object into a refuel source.
 * Run on server only.
 *
 * Arguments:
 * 0: Fuel Source <OBJECT>
 * 1: Fuel amount (in liters) <NUMBER> (default: 0)
 * 2: Hooks positions <ARRAY> (default: [[0,0,0]])
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, 100] call ace_refuel_fnc_makeSource
 *
 * Public: Yes
 */
#include "script_component.hpp"

if (!isServer) exitWith {};

// Only run this after the settings are initialized
if !(EGVAR(common,settingsInitFinished)) exitWith {
    EGVAR(common,runAtSettingsInitialized) pushBack [FUNC(makeSource), _this];
};

params [
    ["_source", objNull, [objNull]],
    ["_fuelCargo", 0, [0]],
    ["_hooks", nil, [[]]]
];
TRACE_3("makeSource",_source,_fuelCargo,_hooks);

private _fuelCargoConfig = getNumber (configFile >> "CfgVehicles" >> typeOf _source >> QGVAR(fuelCargo));

if (
    isNull _source
    || {_fuelCargo < 0 && {!(_fuelCargo in [REFUEL_INFINITE_FUEL, REFUEL_DISABLED_FUEL])}}
    || {_fuelCargo != 0 && {_fuelCargo == _fuelCargoConfig}}
) exitWith {};

[_source, _fuelCargo] call FUNC(setFuel);

if (_fuelCargo == REFUEL_DISABLED_FUEL) exitWith {};

if (
    !isNil "_hooks"
    && {_hooks isEqualTypeAll []}
    && {0 == {!(_x isEqualTypeParams [0,0,0]) || {3 < count _x}} count _hooks}
) then {
    _source setVariable [QGVAR(hooks), _hooks, true];
};

// check if menu already exists
if (_fuelCargoConfig != 0 || {!isNil {_source getVariable QGVAR(initSource_jipID)}}) exitWith {};

private _jipID = [QGVAR(initSource), [_source]] call CBA_fnc_globalEventJIP;
[_jipID, _source] call CBA_fnc_removeGlobalEventJIP;
_source setVariable [QGVAR(initSource_jipID), _jipID];
