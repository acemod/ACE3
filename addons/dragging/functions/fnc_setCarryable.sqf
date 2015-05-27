/*
 * Author: commy2
 *
 * Enable the object to be carried.
 *
 * Argument:
 * 0: Any object (Object)
 * 1: true to enable carrying, false to disable (Bool)
 * 2: Position offset for attachTo command (Array, optinal; default: [0,1,1])
 * 3: Direction in degree to rotate the object after attachTo (Number, optional; default: 0)
 *
 * Return value:
 * NONE.
 */
#include "script_component.hpp"

private ["_carryAction", "_dropAction", "_object", "_enableCarry", "_position", "_direction"];
//IGNORE_PRIVATE_WARNING("_player", "_target");

_this resize 4;

_object = _this select 0;
_enableCarry = _this select 1;
_position = _this select 2;
_direction = _this select 3;

if (isNil "_position") then {
    _position = _object getVariable [QGVAR(carryPosition), [0,1,1]];
};

if (isNil "_direction") then {
    _direction = _object getVariable [QGVAR(carryDirection), 0];
};

// update variables
_object setVariable [QGVAR(canCarry), _enableCarry];
_object setVariable [QGVAR(carryPosition), _position];
_object setVariable [QGVAR(carryDirection), _direction];

// add action to class if it is not already present
private ["_type", "_initializedClasses"];

_type = typeOf _object;
_initializedClasses = GETGVAR(initializedClasses_carry,[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};

_initializedClasses pushBack _type;
GVAR(initializedClasses_carry) = _initializedClasses;

_carryAction = [QGVAR(carry), localize STRING(Carry), "", {[_player, _target] call FUNC(startCarry)}, {[_player, _target] call FUNC(canCarry)}] call EFUNC(interact_menu,createAction);
_dropAction = [QGVAR(drop_carry), localize STRING(Drop), "", {[_player, _target] call FUNC(dropObject_carry)}, {[_player, _target] call FUNC(canDrop_carry)}] call EFUNC(interact_menu,createAction);

[_type, 0, ["ACE_MainActions"], _carryAction] call EFUNC(interact_menu,addActionToClass);
[_type, 0, [], _dropAction] call EFUNC(interact_menu,addActionToClass);
