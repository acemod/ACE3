#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Starts a timer for an explosive.
 *
 * Arguments:
 * 0: Explosive <OBJECT> (default: objNull)
 * 1: Time until detonation <NUMBER> (default: 0)
 * 2: Trigger classname <STRING> (default: "#timer")
 * 3: Unit <OBJECT> (default: objNull)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, 10] call ace_explosives_fnc_startTimer
 *
 * Public: Yes
 */

params [["_explosive", objNull, [objNull]], ["_delay", 0, [0]], ["_trigger", "#timer", [""]], ["_unit", objNull, [objNull]]];
TRACE_4("Starting timer",_explosive,_delay,_trigger,_unit);

if (isNull _explosive) exitWith {};

// Run the timer on the server, in case the player disconnects
if (!isServer) exitWith {
    [QGVAR(startTimer), _this] call CBA_fnc_serverEvent;
};

[{
    params ["_explosive", "_trigger", "_unit"];
    TRACE_1("Explosive detonating from timer",_explosive);

    if (isNull _explosive) exitWith {};

    [_unit, -1, [_explosive, 0], _trigger] call FUNC(detonateExplosive);
}, [_explosive, _trigger, _unit], _delay] call CBA_fnc_waitAndExecute;
