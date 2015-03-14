/*
 * Author: commy2
 *
 * Enable the object to be dragged.
 *
 * Argument:
 * 0: Any object (Object)
 * 1: true to enable dragging, false to disable (Bool)
 * 2: Position offset for attachTo command (Array, optinal; default: [0,0,0])
 * 3: Direction in degree to rotate the object after attachTo (Number, optional; default: 0)
 *
 * Return value:
 * NONE.
 */
#include "script_component.hpp"

private ["_object", "_enableDrag", "_position", "_direction"];

_this resize 4;

_object = _this select 0;
_enableDrag = _this select 1;
_position = _this select 2;
_direction = _this select 3;

if (isNil "_position") then {
    _position = _object getVariable [QGVAR(dragPosition), [0,0,0]];
};

if (isNil "_direction") then {
    _direction = _object getVariable [QGVAR(dragDirection), 0];
};

// update variables
_object setVariable [QGVAR(canDrag), _enableDrag, true];
_object setVariable [QGVAR(dragPosition), _position, true];
_object setVariable [QGVAR(dragDirection), _direction, true];

// add action to class if it is not already present
private ["_type", "_initializedClasses"];

_initializedClasses = GETMVAR(GVAR(initializedClasses),[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};

private ["_name", "_icon", "_selection", "_statement", "_condition"];

_name = "drag";
_icon = "";
_selection = "";
_statement = {hint str _target};
_condition = {true};

[_type, 0, [_name], _name, _icon, _selection, _statement, _condition, 2] call EFUNC(interact_menu,addClassAction);
