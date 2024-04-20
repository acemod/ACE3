#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Gets sub actions for what the unit can load into the CSW
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * Actions <ARRAY>
 *
 * Example:
 * [cursorObject, player] call ace_csw_fnc_getLoadActions
 *
 * Public: No
 */

params ["_vehicle", "_unit"];

private _loadableMagazines = [_vehicle, _unit] call FUNC(reload_getLoadableMagazines);
if (_loadableMagazines isEqualTo []) exitWith {[]};

private _statement = {
    params ["_target", "_player", "_args"];
    _args params ["_carryMag", "_turretPath", "", "_magSource"];

    [_target, _turretPath, _carryMag, _magSource, _player] call FUNC(reload_loadMagazine);
};

private _condition = {
    params ["_target", "_player", "_args"];
    _args params ["_carryMag", "_turretPath", "", "_magSource"];

    ([_target, _turretPath, _carryMag, _magSource] call FUNC(reload_canLoadMagazine)) select 0
};

private _cfgMagazines = configFile >> "CfgMagazines"; // micro-optimization
private _actions = [];
{
    _x params ["_carryMag", "", "_loadInfo"];
    _loadInfo params ["", "", "", "_isBeltLinking"];

    private _displayName = getText (_cfgMagazines >> _carryMag >> "displayName");
    private _picture = getText (_cfgMagazines >> _carryMag >> "picture");
    private _text = if (_isBeltLinking) then {
        format [LLSTRING(actionLink), _displayName];
    } else {
        format [LLSTRING(loadX), _displayName];
    };

    private _action = [format ["load_%1", _forEachIndex], _text, _picture, _statement, _condition, {}, _x] call EFUNC(interact_menu,createAction);
    _actions pushBack [_action, [], _vehicle];
} forEach _loadableMagazines;

TRACE_1("loadActions",count _actions);
_actions
