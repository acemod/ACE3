#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Return the last passed throwable if it is available. If it is not, then find the next closest one.
 *
 * Arguments:
 * 0: Unit to pass the throwable to <OBJECT>
 * 1: Unit that passes the throwable <OBJECT>
 * 2: Return lethal (true) or non-lethal (false) throwable <BOOL>
 *
 * Return Value:
 * Next throwable or empty string if no throwables are available <STRING>
 *
 * Example:
 * throwable = [_target, _player, true] call ace_interaction_fnc_getNextThrowable
 *
 * Public: No
 */

params [["_target", objNull, [objNull]], ["_player", objNull, [objNull]], ["_returnLethalGrenades", true, [true]]];

private _lastThrowable = [GVAR(lastNonLethalThrowable), GVAR(lastLethalThrowable)] select _returnLethalGrenades;

private _lastThrowableIsLethal = if (_lastThrowable isEqualTo "") then {
    _returnLethalGrenades
} else {
    [_lastThrowable] call FUNC(isThrowableLethal)
};

private _handledThrowables = [];
private _nextThrowable = "";
{
    _x params ["_throwable"];

    // Handle every throwable only once
    if (_throwable in _handledThrowables) then {
        continue;
    };
    _handledThrowables pushBack _throwable;

    if !([_target, _throwable] call CBA_fnc_canAddItem) then {
        continue;
    };

    if (_throwable == _lastThrowable) then {
        _nextThrowable = _lastThrowable;
        break;
    };

    private _isLethal = [_throwable] call FUNC(isThrowableLethal);
    if ((_isLethal && _lastThrowableIsLethal) || {!_isLethal && !_lastThrowableIsLethal}) then {
        _nextThrowable = _throwable;
    };
} forEach (throwables _player);

_nextThrowable
