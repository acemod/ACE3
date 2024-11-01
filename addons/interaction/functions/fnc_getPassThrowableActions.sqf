#include "..\script_component.hpp"
/*
 * Author: Timi007
 * Return actions for available lethal or non-lethal throwables.
 *
 * Arguments:
 * 0: Unit to pass the throwable to <OBJECT>
 * 1: Unit that passes the throwable <OBJECT>
 * 2: Return lethal (true) or non-lethal (false) grenades <BOOLEAN>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * array = [player, target, true] call ace_interaction_fnc_getPassThrowableActions
 *
 * Public: No
 */

params [["_target", objNull, [objNull]], ["_player", objNull, [objNull]], ["_returnLethalGrenades", true, [true]]];
TRACE_3("Create pass throwables actions",_target,_player,_returnLethalGrenades);

private _handledThrowables = [];
private _actions = [];
{
    _x params ["_throwable"];

    // Handle every throwable only once
    if (_throwable in _handledThrowables) then {
        continue;
    };
    _handledThrowables pushBack _throwable;

    private _isLethal = [_throwable] call FUNC(isThrowableLethal);
    if ((_returnLethalGrenades && !_isLethal) || {!_returnLethalGrenades && _isLethal}) then {
        continue;
    };

    ([_throwable] call FUNC(getThrowableInfo)) params ["", "_name", "_picture"];
    private _action = [
        _throwable,
        _name,
        _picture,
        LINKFUNC(passThrowable),
        {
            params ["_target", "", "_throwable"];

            [_target, _throwable] call CBA_fnc_canAddItem
        },
        {},
        _throwable
    ] call EFUNC(interact_menu,createAction);

    _actions pushBack [_action, [], _target];
} forEach (throwables _player);

_actions
