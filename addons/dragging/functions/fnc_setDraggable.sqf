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

private ["_dragAction", "_dropAction", "_object", "_enableDrag", "_position", "_direction"];
//IGNORE_PRIVATE_WARNING("_player", "_target");

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
_object setVariable [QGVAR(canDrag), _enableDrag];
_object setVariable [QGVAR(dragPosition), _position];
_object setVariable [QGVAR(dragDirection), _direction];

// add action to class if it is not already present
private ["_type", "_initializedClasses"];

_type = typeOf _object;
_initializedClasses = GETGVAR(initializedClasses,[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};

_initializedClasses pushBack _type;
GVAR(initializedClasses) = _initializedClasses;

_dragAction = [QGVAR(drag), localize LSTRING(Drag), "", {[_player, _target] call FUNC(startDrag)}, {[_player, _target] call FUNC(canDrag)}] call EFUNC(interact_menu,createAction);
_dropAction = [QGVAR(drop), localize LSTRING(Drop), "", {[_player, _target] call FUNC(dropObject)}, {[_player, _target] call FUNC(canDrop)}] call EFUNC(interact_menu,createAction);

[_type, 0, ["ACE_MainActions"], _dragAction] call EFUNC(interact_menu,addActionToClass);
[_type, 0, ["ACE_MainActions"], _dropAction] call EFUNC(interact_menu,addActionToClass);
