/*
 * Author: Glowbal
 * Initializes variables for loadable objects. Called from init EH.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return value:
 * None
 *
 * Example:
 * [object] call ace_cargo_fnc_initObject
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];

if (getNumber (configFile >> "CfgVehicles" >> typeOf _object >> QGVAR(canLoad)) != 1) exitWith {};

private ["_type", "_action"];
_type = typeOf _object;

// do nothing if the class is already initialized
if (_type in GVAR(initializedItemClasses)) exitWith {};
GVAR(initializedItemClasses) pushBack _type;

_action = [QGVAR(load), localize LSTRING(loadObject), QUOTE(PATHTOF(UI\Icon_load.paa)), {[_player, _target] call FUNC(startLoadIn)}, {GVAR(enable) && {[_player, _target] call FUNC(canLoad)}}] call EFUNC(interact_menu,createAction);
[_type, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToClass);
