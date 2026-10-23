#include "..\script_component.hpp"
/*
 * Author: Yethe Samartaka
 * Broadcasts variables of dead units that changed after they were broadcast (see FUNC(setDeadUnitVariable)).
 *
 * Arguments:
 * 0: Arguments (unused) <ARRAY>
 * 1: Per frame handler ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], ace_medical_engine_deadUnitBroadcastPFH] call ace_medical_engine_fnc_broadcastDeadUnitVariables
 *
 * Public: No
 */

params ["", "_pfhID"];

// Every unit waits for the same time, so the queue is in order
private _queue = GVAR(deadUnitBroadcastQueue);
private _count = _queue findIf {(_x select 0) > CBA_missionTime};
if (_count == -1) then {
    _count = count _queue;
};

private _units = _queue select [0, _count];
_queue deleteRange [0, _count];

{
    _x params ["", "_unit"];

    // Bodies can be deleted or change locality while they wait
    if (!isNull _unit) then {
        private _broadcasts = _unit getVariable [QGVAR(recentBroadcasts), createHashMap];
        private _changed = keys _broadcasts select {_broadcasts get _x};

        if (_changed isEqualTo [] || {!local _unit}) then {
            _unit setVariable [QGVAR(recentBroadcasts), nil];
        } else {
            TRACE_2("broadcasting changes",_unit,_changed);
            {
                _unit setVariable [_x, _unit getVariable _x, true];
            } forEach _changed;

            // Further changes wait again
            _unit setVariable [QGVAR(recentBroadcasts), createHashMapFromArray (_changed apply {[_x, false]})];
            _queue pushBack [CBA_missionTime + DEAD_UNIT_BROADCAST_DELAY, _unit];
        };
    };
} forEach _units;

if (_queue isEqualTo []) then {
    TRACE_1("dead unit broadcast queue empty",_pfhID);
    _pfhID call CBA_fnc_removePerFrameHandler;
    GVAR(deadUnitBroadcastPFH) = -1;
};
