#include "..\script_component.hpp"
/*
 * Author: commy2, PiZZADOX
 * Enables the object to be dragged.
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: True to enable dragging, false to disable <BOOL>
 * 2: Position offset for attachTo command (optional; default: [0, 1.5, 0]) <ARRAY>
 * 3: Direction in degrees to rotate the object after attachTo (optional; default: 0) <NUMBER>
 * 4: Override weight limit <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget, true, [0, 0, 0], 0, false] call ace_dragging_fnc_setDraggable;
 *
 * Public: Yes
 */

params ["_object", "_enableDrag", "_position", "_direction", ["_ignoreWeightDrag", false, [false]]];

if (isNil "_position") then {
    _position = _object getVariable [QGVAR(dragPosition), [0, 1.5, 0]];
};

if (isNil "_direction") then {
    _direction = _object getVariable [QGVAR(dragDirection), 0];
};

// Update variables
_object setVariable [QGVAR(canDrag), _enableDrag];
_object setVariable [QGVAR(dragPosition), _position];
_object setVariable [QGVAR(dragDirection), _direction];
_object setVariable [QGVAR(ignoreWeightDrag), _ignoreWeightDrag];

// Add action to class if it is not already present
private _type = typeOf _object;
private _initializedClasses = GETGVAR(initializedClasses,[]);

// Do nothing if the class is already initialized
if (_type in _initializedClasses) exitWith {};

_initializedClasses pushBack _type;
GVAR(initializedClasses) = _initializedClasses;

[_type, "ContainerClosed", {
    params ["_object"];
    private _owner = _object getVariable [QEGVAR(common,owner), objNull];
    TRACE_2("ContainerClosed-drag",_object,_owner);
    if (isNull _owner) exitWith {};
    if (_object isNotEqualTo (_owner getVariable [QGVAR(draggedObject), objNull])) exitWith {};
    [QGVAR(draggingContainerClosed), [_object, _owner], _owner] call CBA_fnc_targetEvent;
}, false] call CBA_fnc_addClassEventHandler;

private _icon = [QPATHTOF(UI\icons\box_drag.paa), QPATHTOF(UI\icons\person_drag.paa)] select (_object isKindOf "CAManBase");

private _dragAction = [
    QGVAR(drag),
    LLSTRING(Drag),
    _icon,
    {
        [_player, _target] call FUNC(startDrag)
    }, {
        [_player, _target] call FUNC(canDrag)
}] call EFUNC(interact_menu,createAction);

private _dropAction = [
    QGVAR(drop),
    LLSTRING(Drop),
    "",
    {
        [_player, _target] call FUNC(dropObject);
    }, {
        [_player, _target] call FUNC(canDrop)
}] call EFUNC(interact_menu,createAction);

[_type, 0, ["ACE_MainActions"], _dragAction] call EFUNC(interact_menu,addActionToClass);
[_type, 0, [], _dropAction] call EFUNC(interact_menu,addActionToClass);
