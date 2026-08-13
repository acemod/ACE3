#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Initializes object with vanilla refuel.
 *
 * Arguments:
 * 0: Source <OBJECT>
 * 1: Is static <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_refuel_fnc_initObject
 *
 * Public: No
 */

params ["_source", ["_isStatic", false]];

if (!_isStatic) then {
    TRACE_3("init",_source,local _source,getFuelCargo _source);
};

if (local _source && {getFuelCargo _source > 0}) then {
    _source setFuelCargo 0;
};

if (_source getVariable [QGVAR(HDEHID), -1] == -1) then {
    private _HDEHID = _source addEventHandler ["HandleDamage", {call FUNC(handleDamage)}];
    _source setVariable [QGVAR(HDEHID), _HDEHID];
};

// `Vehicle Damage` and `Cook off` use setDamage to destroy vehicle, so we can not catch this moment
if (
    missionNamespace getVariable [QEGVAR(vehicle_damage,enabled), false]
    && {_source isKindOf "AllVehicles"}
) then {
    // VD HD EH is added in the next frame
    [{
        params ["_source"];
        if (
            isNil {_source getVariable QEGVAR(vehicle_damage,handleDamage)}
            || {isNil {_source getVariable QGVAR(HDEHID)}}
        ) exitWith {};
        TRACE_1("VD enabled",_source);

        _source removeEventHandler ["HandleDamage", _source getVariable QGVAR(HDEHID)];
        _source setVariable [QGVAR(HDEHID), nil];
    }, _source, 3] call CBA_fnc_execAfterNFrames;
};
