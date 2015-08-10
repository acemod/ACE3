/*
 * Author: Glowbal
 * initalize vehicle. Adds open caro menu action if available
 *
 * Arguments:
 * 0: vehicle <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_vehicle"];
TRACE_1("params", _vehicle);

private ["_type", "_initializedClasses"];

_type = typeOf _vehicle;
_initializedClasses = GETMVAR(GVAR(initializedClasses),[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};
// set class as initialized
_initializedClasses pushBack _type;
SETMVAR(GVAR(initializedClasses),_initializedClasses);

if (getNumber (configFile >> "CfgVehicles" >> _type >> QGVAR(hasCargo)) != 1) exitwith {};

private ["_text", "_condition", "_statement", "_icon", "_action"];
_text = localize "STR_ACE_Cargo_openMenu";
_condition = {true};
_statement = {diag_log format["_target %1", _target];GVAR(interactionVehicle) = _target; createDialog QGVAR(menu);};
_icon = "";

_action = [QGVAR(openMenu), _text, _icon, _statement, _condition] call EFUNC(interact_menu,createAction);
[_type, 0, ["ACE_MainActions"], _action] call EFUNC(interact_menu,addActionToClass);
