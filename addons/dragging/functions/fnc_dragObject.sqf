/*
 * Author: commy2
 *
 * Drag an object. Called from ace_dragging_fnc_startDrag
 *
 * Arguments:
 * 0: Unit that should do the dragging <OBJECT>
 * 1: Object to drag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

private ["_position", "_direction", "_offset", "_UAVCrew"];

// get attachTo offset and direction.
_position = _target getVariable [QGVAR(dragPosition), [0, 0, 0]];
_direction = _target getVariable [QGVAR(dragDirection), 0];

// add height offset of model
_offset = (_target modelToWorldVisual [0, 0, 0] select 2) - (_unit modelToWorldVisual [0, 0, 0] select 2);

_position = _position vectorAdd [0, 0, _offset];

// attach object
_target attachTo [_unit, _position];
["setDir", _target, [_target, _direction]] call EFUNC(common,targetEvent);

if (_target isKindOf "CAManBase") then {
    [_target, "AinjPpneMrunSnonWnonDb_still", 0, true] call EFUNC(common,doAnimation);
};

_unit setVariable [QGVAR(isDragging), true, true];
_unit setVariable [QGVAR(draggedObject), _target, true];

// add drop action
_unit setVariable [QGVAR(ReleaseActionID), [
    _unit, "DefaultAction",
    {!isNull ((_this select 0) getVariable [QGVAR(draggedObject), objNull])},
    {[_this select 0, (_this select 0) getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject)}
] call EFUNC(common,addActionEventHandler)];

// show mouse hint
[localize LSTRING(Drop), ""] call EFUNC(interaction,showMouseHint);

// check everything
[FUNC(dragObjectPFH), 0.5, [_unit, _target]] call CBA_fnc_addPerFrameHandler;

// reset current dragging height.
GVAR(currentHeightChange) = 0;

// prevent UAVs from firing
_UAVCrew = _target call EFUNC(common,getVehicleUAVCrew);

if !(_UAVCrew isEqualTo []) then {
    {_target deleteVehicleCrew _x} count _UAVCrew;
    _target setVariable [QGVAR(isUAV), true, true];
};
