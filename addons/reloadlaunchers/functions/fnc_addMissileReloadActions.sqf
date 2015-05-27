/*
 * Author: commy2
 * Create one action per reloadable missile
 *
 * Argument:
 * 1: Player (Object)
 * 0: Target (Object)
 * 2: Parameters ??? (Array)
 *
 * Return value:
 * Children actions (Array)
 *
 */
#include "script_component.hpp"

private ["_unit", "_target", "_parameters"];

_unit = _this select 1;
_target = _this select 0;
_parameters = _this select 2; // ???

private ["_actions", "_weapon", "_loadableMissiles"];

_actions = [];

_weapon = secondaryWeapon _target;
_loadableMissiles = [_unit, _weapon] call FUNC(getLoadableMissiles);

{
    private ["_name", "_displayName", "_statement", "_condition", "_action"];

    _name = format [QGVAR(Missile_%1), _x];
    _displayName = format [localize STRING(LoadMagazine), getText (configFile >> "CfgMagazines" >> _x >> "displayName")];

    _statement = {
        (_this select 2) call DFUNC(load);
    };

    _condition = {
        (_this select 2) call DFUNC(canLoad)
    };

    _action = [_name, _displayName, "", _statement, _condition, {}, [_unit, _target, _weapon, _x], "", 4] call EFUNC(interact_menu,createAction);

    _actions pushBack [_action, [], _unit];
} forEach _loadableMissiles;

_actions
