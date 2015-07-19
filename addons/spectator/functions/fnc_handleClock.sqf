/*
 * Author: Karel Moricky, SilentSpike
 * Handles the spectator UI clock
 *
 * Arguments:
 * 0: Parameters <ANY>
 * 1: PFH handle <NUMBER>
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * [ace_spectator_fnc_handleClock, 1, _display] call CBA_fnc_addPerFrameHandler;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display"];

// Kill PFH when display is closed
if (isNull _display) exitWith { [_this select 1] call CBA_fnc_removePerFrameHandler; };

// Reduce overhead when toolbar is hidden
if !(GVAR(showTool) && GVAR(showInterface)) exitWith {};

private "_clock";

_clock = (_display displayCtrl IDC_TOOL) controlsGroupCtrl IDC_TOOL_CLOCK;
_clock ctrlSetText ([daytime,"HH:MM"] call BIS_fnc_timeToString);
