/*
 * Author: commy2
 *
 * Return all magazine types from reloaders inventory that are compatible with given weapon.
 *
 * Argument:
 * 0: Unit to to the reload (Object)
 * 1: A launcher (String)
 *
 * Return value:
 * Reloable magazines (Array)
 */
#include "script_component.hpp"

private ["_unit", "_weapon"];

_unit = _this select 0;
_weapon = _this select 1;

// get available magazines of reloader, Note: "magazines" does not include currently loaded magazines
private "_magazines";
_magazines = magazines _unit;

// case sensitvity
_magazines = [_magazines, {toLower _this}] call EFUNC(common,map);

// get reloaders magazine types compatible with targets launcher. No duplicates.
[getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines"), {toLower _this in _magazines}] call EFUNC(common,filter)
