#include "..\script_component.hpp"
/*
 * Author: commy2
 * Create one action per reloadable missile.
 *
 * Arguments:
 * 0: Unit equipped with the launcher <OBJECT>
 * 1: Unit wanting to execute the reload <OBJECT>
 *
 * Return Value:
 * Children actions <ARRAY>
 *
 * Example:
 * [cursorTarget, player] call ace_reloadlaunchers_fnc_addMissileReloadActions
 *
 * Public: No
 *
 */

params ["_target", "_unit"];
TRACE_2("params",_target,_unit);

// Fast exit for common cases
private _weapon = secondaryWeapon _target;

if ((_weapon == "") || {(getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(enabled))) == 0}) exitWith {
    TRACE_1("weapon not supported",_weapon);
    []
};

private _actions = [];

private _loadableMissiles = [_unit, _weapon] call FUNC(getLoadableMissiles);
TRACE_2("",_weapon,_loadableMissiles);

private _cfgMagazines = configFile >> "CfgMagazines";

{
    private _name = format [QGVAR(Missile_%1), _x];
    private _displayName = format [LLSTRING(LoadMagazine), getText (_cfgMagazines >> _x >> "displayName")];

    private _statement = {
        (_this select 2) call FUNC(load);
    };

    private _condition = {
        (_this select 2) call FUNC(canLoad)
    };

    private _action = [_name, _displayName, "", _statement, _condition, {}, [_unit, _target, _weapon, _x], "", 4] call EFUNC(interact_menu,createAction);

    _actions pushBack [_action, [], _unit];
} forEach _loadableMissiles;

TRACE_1("return",_actions);
_actions
