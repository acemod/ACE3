#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Gets sub actions for what the player can load into the static weapon
 *
 * Arguments:
 * 0: Static Weapon <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_reload_actionsLoad
 *
 * Public: No
 */

params ["_vehicle", "_player"];

private _actions = [];
private _loadableMagazines = [_vehicle, _player] call FUNC(reload_getLoadableMagazines);

private _statement = {
    params ["_target", "_player", "_params"];
    _params params ["_carryMag", "_turretPath"];

    [_target, _turretPath, _carryMag, _player] call FUNC(reload_loadMagazine);
};

private _condition = {
    params ["_target", "_player", "_params"];
    _params params ["_carryMag", "_turretPath"];

    ([_target, _turretPath, _carryMag, _player] call FUNC(reload_canLoadMagazine)) select 0
};

{
    _x params ["_carryMag", "_turretPath", "_loadInfo"];
    _loadInfo params ["", "", "", "_isBeltLinking"];

    private _displayName = getText (configFile >> "CfgMagazines" >> _carryMag >> "displayName");
    private _picture = getText (configFile >> "CfgMagazines" >> _carryMag >> "picture");
    private _text = if (_isBeltLinking) then {
        format [localize LSTRING(actionLink), _displayName];
    } else {
        format [localize LSTRING(loadX), _displayName];
    };

    private _action = [format ["load_%1", _forEachIndex], _text, _picture, _statement, _condition, {}, _x] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _vehicle];
} forEach _loadableMagazines;

TRACE_1("loadActions",count _actions);
_actions

