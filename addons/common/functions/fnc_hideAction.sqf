#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Setter for hideActions command
 *
 * Arguments:
 * 0: Action Index <NUMBER>
 * 1: Key (case-sensitive) <STRING>
 * 2: Hide action <BOOL>
 * 3: Skip if missing (if index doesn't exist and not hiding) <BOOL> (default: true)
 *
 * Return Value:
 * Array of hidden and unhidden action indices <ARRAY>
 *
 * Example:
 * [15, "noEngineAction", true] call ace_common_fnc_hideAction
 *
 * Public: Yes
 */

if (!hasInterface) exitWith {};

params [["_index", 0, [0]], ["_key", "", [""]], ["_hide", false, [false]], ["_skipIfMissing", true, [true]]];

private _addEH = if (isNil QGVAR(hideActionHash)) then {
    GVAR(hideActionHash) = createHashMap;
    true
} else {
    false
};

if (_skipIfMissing && {!_hide} && {!(_index in GVAR(hideActionHash))}) exitWith { createHashMap };
private _actionIndex = GVAR(hideActionHash) getOrDefault [_index, createHashMap, true];
if (_hide) then {
    _actionIndex set [_key, true];
} else {
    _actionIndex deleteAt _key;
};

private _fnc_update = {
    private _hideSelected= [];
    private _unhideSelected = [];
    {
        if (count _y == 0) then {
            _unhideSelected pushBack _x;
        } else {
            _hideSelected pushBack _x;
        };
    } forEach GVAR(hideActionHash);
    hideActions [false, _unhideSelected];
    hideActions [true, _hideSelected];
    [_hideSelected, _unhideSelected] // final return
};

if (_addEH) then {
    // need to update whenever the focusOn changes (player or UAV)
    addMissionEventHandler ["PlayerViewChanged", _fnc_update];
};
call _fnc_update
