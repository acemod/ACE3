#include "script_component.hpp"
/*
 * Author: commy2
 * Return all magazine types from reloaders inventory that are compatible with given weapon.
 *
 * Arguments:
 * 0: Unit to to the reload <OBJECT>
 * 1: A launcher <OBJECT>
 *
 * Return Value:
 * Reloable magazines <ARRAY>
 *
 * Example:
 * [bob, launcher] call ace_reloadlaunchers_fnc_getLoadableMissiles
 *
 * Public: No
 */

params ["_unit", "_weapon"];
TRACE_2("params",_unit,_weapon);

// get available magazines of reloader, Note: "magazines" does not include currently loaded magazines
private _magazines = magazines _unit;

// case sensitvity
_magazines = _magazines apply {toLower _x};

// get reloaders magazine types compatible with targets launcher. No duplicates.
getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select {toLower _x in _magazines} // return
