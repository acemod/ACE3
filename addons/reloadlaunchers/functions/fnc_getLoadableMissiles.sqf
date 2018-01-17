/*
 * Author: commy2
 * Return all magazine types from reloaders inventory that are compatible with given weapon.
 *
 * Arguments:
 * 0: Unit to to the reload (Object)
 * 1: A launcher (String)
 *
 * Return Value:
 * Reloable magazines (Array)
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_weapon"];
TRACE_2("params",_unit,_weapon);

// get available magazines of reloader, Note: "magazines" does not include currently loaded magazines
private _magazines = magazines _unit;

// case sensitvity
_magazines = _magazines apply {toLower _x};

// get reloaders magazine types compatible with targets launcher. No duplicates.
getArray (configFile >> "CfgWeapons" >> _weapon >> "magazines") select {toLower _x in _magazines} // return
