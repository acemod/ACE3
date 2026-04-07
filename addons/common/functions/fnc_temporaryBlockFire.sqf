#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Temporarily blocks firing of a weapon for player for a specified duration.
 *
 * Arguments:
 * 0: Duration (seconds) <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call ace_common_fnc_temporaryBlockFire
 *
 * Public: Yes
 */

params [["_duration", 1, [0]]];

if (!alive ace_player) exitWith {};
if (!isNil QGVAR(temporaryBlockFireEH)) exitWith {}; // if in-progress temporary block already exists, don't create another one

private _firedEH = [ACE_player, "DefaultAction", {true}, {true}] call FUNC(addActionEventHandler);
GVAR(temporaryBlockFireEH) = [ace_player, _firedEH];
TRACE_2("Blocking fire",ace_player,_firedEH);

[{
    GVAR(temporaryBlockFireEH) params ["_player", "_firedEH"];
    TRACE_2("Unblocking fire",_player,_firedEH);
    if (isNull _player) exitWith {};
    [_player, "DefaultAction", _firedEH] call FUNC(removeActionEventHandler);
    GVAR(temporaryBlockFireEH) = nil;
}, [], _duration] call CBA_fnc_waitAndExecute;

