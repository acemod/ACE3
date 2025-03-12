#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Receives a possible error code from FUNC(eventTargetFinish).
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Target <OBJECT>
 * 2: Error message <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, "Something fucked up"] call ace_disarming_fnc_eventCallerFinish
 *
 * Public: No
 */

params ["_caller", "_target", "_errorMsg"];

if (_caller != ACE_player) exitWith {};

systemChat format ["Debug-Caller: Disarm finished from [%1] with code [%2]", _target, _errorMsg];
INFO_2("%1 - eventCallerFinish: %2",CBA_missionTime,_this);
