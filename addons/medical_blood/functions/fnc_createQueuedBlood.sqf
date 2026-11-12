#include "..\script_component.hpp"
/*
 * Author: Yethe Samartaka
 * Creates blood drops queued by FUNC(spurt).
 * Creates a share of the queue each frame, so a burst of spurts is spread over about DROP_QUEUE_FRAMES frames.
 *
 * Arguments:
 * 0: Arguments (unused) <ARRAY>
 * 1: Per frame handler ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], ace_medical_blood_dropQueuePFH] call ace_medical_blood_fnc_createQueuedBlood
 *
 * Public: No
 */

params ["", "_pfhID"];

private _queue = GVAR(dropQueue);
private _count = (count _queue) min ((ceil (count _queue / DROP_QUEUE_FRAMES)) max DROP_QUEUE_MIN_DROPS);

private _drops = _queue select [0, _count];
_queue deleteRange [0, _count];

{
    _x call FUNC(createBlood);
} forEach _drops;

if (_queue isEqualTo []) then {
    TRACE_1("blood drop queue empty",_pfhID);
    _pfhID call CBA_fnc_removePerFrameHandler;
    GVAR(dropQueuePFH) = -1;
};
