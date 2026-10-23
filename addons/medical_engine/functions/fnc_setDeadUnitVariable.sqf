#include "..\script_component.hpp"
/*
 * Author: Yethe Samartaka
 * Sets and broadcasts a variable of a dead unit. Bodies can be hit again and again (e.g. by every explosion near them),
 * so further changes within DEAD_UNIT_BROADCAST_DELAY seconds of a broadcast are only broadcast once that time is over.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Variable name <STRING>
 * 2: Value <ANY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "ace_medical_woundBleeding", 0] call ace_medical_engine_fnc_setDeadUnitVariable
 *
 * Public: No
 */

params ["_unit", "_name", "_value"];
TRACE_3("setDeadUnitVariable",_unit,_name,_value);

if (!isMultiplayer) exitWith {
    _unit setVariable [_name, _value, true];
};

// Variables broadcast recently, and whether they changed since
private _broadcasts = _unit getVariable QGVAR(recentBroadcasts);

if (isNil "_broadcasts") then {
    _broadcasts = createHashMap;
    _unit setVariable [QGVAR(recentBroadcasts), _broadcasts];
    GVAR(deadUnitBroadcastQueue) pushBack [CBA_missionTime + DEAD_UNIT_BROADCAST_DELAY, _unit];

    if (GVAR(deadUnitBroadcastPFH) == -1) then {
        GVAR(deadUnitBroadcastPFH) = [LINKFUNC(broadcastDeadUnitVariables), 0] call CBA_fnc_addPerFrameHandler;
    };
};

if (_name in _broadcasts) exitWith {
    _unit setVariable [_name, _value];
    _broadcasts set [_name, true];
};

_unit setVariable [_name, _value, true];
_broadcasts set [_name, false];
