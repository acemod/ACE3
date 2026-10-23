#include "..\script_component.hpp"
/*
 * Author: Yethe Samartaka
 * Raises wound events queued for dead units (see FUNC(queueDeadUnitDamage)).
 * Handles a share of the queue each frame, so a burst of hits on many bodies is spread over about DEAD_UNIT_QUEUE_FRAMES frames.
 * Hits on a body within DEAD_UNIT_QUEUE_INTERVAL seconds of it being handled are handled together once that time is over.
 *
 * Arguments:
 * 0: Arguments (unused) <ARRAY>
 * 1: Per frame handler ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], ace_medical_engine_deadUnitQueuePFH] call ace_medical_engine_fnc_processDeadUnitDamage
 *
 * Public: No
 */

params ["", "_pfhID"];

private _queue = GVAR(deadUnitQueue);

// Every body waits for the same time, so the intervals are in order
private _intervals = GVAR(deadUnitIntervals);
private _over = _intervals findIf {(_x select 0) > CBA_missionTime};
if (_over == -1) then {
    _over = count _intervals;
};

{
    _x params ["", "_unit"];
    if (!isNull _unit && {_unit getVariable [QGVAR(queuedDamageWaiting), false]}) then {
        _unit setVariable [QGVAR(queuedDamageWaiting), nil];
        _queue pushBack _unit;
    };
} forEach (_intervals select [0, _over]);
_intervals deleteRange [0, _over];

private _count = (count _queue) min ((ceil (count _queue / DEAD_UNIT_QUEUE_FRAMES)) max DEAD_UNIT_QUEUE_MIN_UNITS);

// Remove them first, units hit again while their events are raised are queued again
private _units = _queue select [0, _count];
_queue deleteRange [0, _count];

{
    // Bodies can be deleted or change locality while they wait
    if (!isNull _x) then {
        private _queued = _x getVariable [QGVAR(queuedDamage), []];
        _x setVariable [QGVAR(queuedDamage), nil];

        if (local _x) then {
            // Further hits wait, so they can be combined
            _x setVariable [QGVAR(queueWaitUntil), CBA_missionTime + DEAD_UNIT_QUEUE_INTERVAL];
            _intervals pushBack [CBA_missionTime + DEAD_UNIT_QUEUE_INTERVAL, _x];

            {
                TRACE_1("raising queued wound event",_x);
                [QEGVAR(medical,woundReceived), _x] call CBA_fnc_localEvent;
            } forEach _queued;
        };
    };
} forEach _units;

if (_queue isEqualTo [] && {_intervals isEqualTo []}) then {
    TRACE_1("dead unit queue empty",_pfhID);
    _pfhID call CBA_fnc_removePerFrameHandler;
    GVAR(deadUnitQueuePFH) = -1;
};
