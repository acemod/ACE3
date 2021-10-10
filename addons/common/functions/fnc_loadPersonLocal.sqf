#include "script_component.hpp"
/*
 * Author: Glowbal
 * Load a person, local
 *
 * Arguments:
 * 0: unit to be loaded <OBJECT>
 * 1: vehicle that will beloaded <OBJECT>
 * 2: caller that will load <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, car, kevin] call ace_common_fnc_loadPersonLocal
 *
 * Public: Yes
 */

params ["_unit", "_vehicle", ["_caller", objNull]];
TRACE_3("loadPersonLocal",_unit,_vehicle,_caller);

private _slotsOpen = false;
if ((_vehicle emptyPositions "cargo" > 0) && {!(_unit getVariable ['ACE_isUnconscious', false]) || {(getNumber (configOf _vehicle >> "ejectDeadCargo")) == 0}}) then {
    _unit moveInCargo _vehicle;
    TRACE_1("moveInCargo",_vehicle);
    _slotsOpen = true;
} else {
    // Check if an empty turret is available
    // This already excludes FFV seats, which count as cargo positions
    private _turrets = fullCrew [_vehicle, "turret", true];
    private _index = _turrets findIf {isNull (_x#0)};
    if (_index >= 0) exitWith {
        _unit moveInTurret [_vehicle, _turrets#_index#3];
        TRACE_2("moveInTurret",_vehicle,_turrets#_index#3);
        _slotsOpen = true;
    };

    // Check if the commander seat is available
    if (_vehicle emptyPositions "commander" > 0) exitWith {
        _unit moveInCommander _vehicle;
        TRACE_1("moveInCommander",_vehicle);
        _slotsOpen = true;
    };

    // Lastly, check if the gunner seat is available
    if (_vehicle emptyPositions "gunner" > 0) exitWith {
        _unit moveInGunner _vehicle;
        _slotsOpen = true;
    };
};

if (!_slotsOpen) exitWith { WARNING_2("no open seats %1->%2",_unit,_vehicle); };

[{ // just for error reporting
    params ["_unit", "_vehicle"];
    (alive _unit) && {alive _vehicle} && {(vehicle _unit) == _vehicle}
}, {
    params ["_unit", "_vehicle"];
    TRACE_2("success",_unit,_vehicle);
}, [_unit, _vehicle], 2, {
    params ["_unit", "_vehicle"];
    if (!alive _unit) exitWith {};
    WARNING_2("timeout %1->%2",_unit,_vehicle);
}] call CBA_fnc_waitUntilAndExecute;
