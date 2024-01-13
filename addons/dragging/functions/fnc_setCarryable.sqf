#include "..\script_component.hpp"
/*
 * Author: commy2, PiZZADOX
 * Enables the object to be carried.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: True to enable carrying, false to disable <BOOL>
 * 2: Position offset for attachTo command <ARRAY> (default: [0, 1, 1])
 * 3: Direction in degrees to rotate the object after attachTo <NUMBER> (default: 0)
 * 4: Override weight limit <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, true, [0, 1, 1], 0, false] call ace_dragging_fnc_setCarryable;
 *
 * Public: Yes
 */

params ["_object", "_enableCarry", "_position", "_direction", ["_ignoreWeightCarry", false, [false]]];

if (isNil "_position") then {
    _position = _object getVariable [QGVAR(carryPosition), [0, 1, 1]];
};

if (isNil "_direction") then {
    _direction = _object getVariable [QGVAR(carryDirection), 0];
};

// Update variables
_object setVariable [QGVAR(canCarry), _enableCarry];
_object setVariable [QGVAR(carryPosition), _position];
_object setVariable [QGVAR(carryDirection), _direction];
_object setVariable [QGVAR(ignoreWeightCarry), _ignoreWeightCarry];

// Add action to class if it is not already present
private _type = typeOf _object;
private _initializedClasses = GETGVAR(initializedClasses_carry,[]);

// Do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};

_initializedClasses pushBack _type;
GVAR(initializedClasses_carry) = _initializedClasses;

[_type, "ContainerClosed", {
    params ["_object"];
    private _owner = _object getVariable [QEGVAR(common,owner), objNull];
    TRACE_2("ContainerClosed-carry",_object,_owner);
    if (isNull _owner) exitWith {};
    if (_object isNotEqualTo (_owner getVariable [QGVAR(carriedObject), objNull])) exitWith {};
    [QGVAR(carryingContainerClosed), [_object, _owner], _owner] call CBA_fnc_targetEvent;
}, false] call CBA_fnc_addClassEventHandler;

private _icon = [QPATHTOF(UI\icons\box_carry.paa), QPATHTOF(UI\icons\person_carry.paa)] select (_object isKindOf "CAManBase");

private _carryAction = [QGVAR(carry), LLSTRING(Carry), _icon, {[_player, _target] call FUNC(startCarry)}, {[_player, _target] call FUNC(canCarry)}] call EFUNC(interact_menu,createAction);
private _dropAction = [QGVAR(drop_carry), LLSTRING(Drop), "", {[_player, _target] call FUNC(dropObject_carry)}, {[_player, _target] call FUNC(canDrop_carry)}] call EFUNC(interact_menu,createAction);

[_type, 0, ["ACE_MainActions"], _carryAction] call EFUNC(interact_menu,addActionToClass);
[_type, 0, [], _dropAction] call EFUNC(interact_menu,addActionToClass);
