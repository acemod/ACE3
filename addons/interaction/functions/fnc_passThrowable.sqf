#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Pass throwable to another unit.
 *
 * Arguments:
 * 0: Unit that passes the throwable <OBJECT>
 * 1: Unit to pass the throwable to <OBJECT>
 * 2: Throwable classname <STRING>
 * 3: Play passing animation <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _target, "HandGrenade"] call ace_interaction_fnc_passThrowable
 *
 * Public: No
 */

params [["_target", objNull, [objNull]], ["_player", objNull, [objNull]], ["_throwable", "", [""]], ["_animate", true, [true]]];
TRACE_4("Pass throwable params",_player,_target,_throwable,_animate);

if (isNull _target) exitWith {ERROR("Target is null.")};
if (isNull _player) exitWith {ERROR("Player is null.")};
if (_throwable isEqualTo "") exitWith {ERROR("No throwable specified.")};
if !([_target, _throwable] call CBA_fnc_canAddItem) exitWith {ERROR("Cannot add throwable to target due to lack of inventory space.")};

if (_animate) then {[_player, "PutDown"] call EFUNC(common,doGesture)};

_player removeItem _throwable;
_target addItem _throwable;

if ([_throwable] call FUNC(isThrowableLethal)) then {
    GVAR(lastLethalThrowable) = _throwable;
} else {
    GVAR(lastNonLethalThrowable) = _throwable;
};

([_throwable] call FUNC(getThrowableInfo)) params ["", "_displayName"];
private _playerName = [_player] call EFUNC(common,getName);
[QEGVAR(common,displayTextStructured), [[LSTRING(PassThrowableHint), _playerName, _displayName], 1.5, _target], [_target]] call CBA_fnc_targetEvent;
