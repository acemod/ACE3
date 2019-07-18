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
if ((_vehicle emptyPositions "cargo" > 0) && {!(_unit getVariable ['ACE_isUnconscious', false])} || {(getNumber (configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "ejectDeadCargo")) == 0}) then {
    _unit moveInCargo _vehicle;
    _slotsOpen = true;
} else {
    if (_vehicle emptyPositions "gunner" > 0) then {
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
