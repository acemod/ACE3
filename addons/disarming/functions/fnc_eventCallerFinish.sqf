/*
 * Author: PabstMirror
 *
 * Recieves a possible error code from FUNC(eventTargetFinish)
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 * 2: error message <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player1, player2, "Someting fucked up"] call ace_disarming_fnc_eventCallerFinish
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_caller", "_target", "_errorMsg"];

if (_caller != ACE_player) exitWith {};

systemChat format ["Debug-Caller: Disarm finished from [%1] with code [%2]", _target, _errorMsg];
INFO_2("%1 - eventCallerFinish: %2",CBA_missionTime,_this);
