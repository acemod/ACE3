#include "..\script_component.hpp"
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

private _fuelCargoConfig = getNumber (configOf _source >> QGVAR(fuelCargo));

if (
    isNull _source
    || {_fuelCargo < 0 && {!(_fuelCargo in [REFUEL_INFINITE_FUEL, REFUEL_DISABLED_FUEL])}}
    || {_fuelCargo != 0 && {_fuelCargo == _fuelCargoConfig}}
) exitWith {};

private _capacity = if (_fuelCargo < 0) then {_fuelCargo} else {_fuelCargoConfig max _fuelCargo};

_source setVariable [QGVAR(capacity), _capacity, true];

if (_fuelCargo == REFUEL_DISABLED_FUEL) exitWith {};

[_source, _fuelCargo] call FUNC(setFuel);

if (
    !isNil "_hooks"
    && {_hooks isEqualTypeAll []}
    && {0 == {!(_x isEqualTypeParams [0,0,0]) || {3 < count _x}} count _hooks}
) then {
    _source setVariable [QGVAR(hooks), _hooks, true];
};

// only add if menu doesn't already exist
if (!(_fuelCargoConfig != 0 && {!isNil {_source getVariable QGVAR(initSource_jipID)}})) then {
    private _jipID = [QGVAR(initSource), [_source]] call CBA_fnc_globalEventJIP;
    [_jipID, _source] call CBA_fnc_removeGlobalEventJIP;
    _source setVariable [QGVAR(initSource_jipID), _jipID];
};

[QGVAR(sourceInitialized), [_source]] call CBA_fnc_globalEvent;
