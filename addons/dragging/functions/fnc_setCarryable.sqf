/*
 * Author: commy2
 * Enable the object to be carried.
 *
 * Arguments:
 * 0: Any object <OBJECT>
 * 1: true to enable carrying, false to disable <BOOL>
 * 2: Position offset for attachTo command <ARRAY> (default: [0,1,1])
 * 3: Direction in degree to rotate the object after attachTo <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [object, true, [0,1,1], 0] call ace_dragging_fnc_setCarryable;
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_object", "_enableCarry", "_position", "_direction"];

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
private _type = typeOf _object;
private _initializedClasses = GETGVAR(initializedClasses_carry,[]);

// do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};

_initializedClasses pushBack _type;
GVAR(initializedClasses_carry) = _initializedClasses;

private _icon = [QUOTE(PATHTOF(UI\icons\box_carry.paa)), QUOTE(PATHTOF(UI\icons\person_carry.paa))] select (_object isKindOf "Man");

private _carryAction = [QGVAR(carry), localize LSTRING(Carry), _icon, {[_player, _target] call FUNC(startCarry)}, {[_player, _target] call FUNC(canCarry)}] call EFUNC(interact_menu,createAction);
private _dropAction = [QGVAR(drop_carry), localize LSTRING(Drop), "", {[_player, _target] call FUNC(dropObject_carry)}, {[_player, _target] call FUNC(canDrop_carry)}] call EFUNC(interact_menu,createAction);

[_type, 0, ["ACE_MainActions"], _carryAction] call EFUNC(interact_menu,addActionToClass);
[_type, 0, [], _dropAction] call EFUNC(interact_menu,addActionToClass);
