#include "script_component.hpp"
/*
 * Author: commy2, Malbryn
 * Drag an object. Called from ace_dragging_fnc_startDrag
 *
 * Arguments:
 * 0: Unit that should do the dragging <OBJECT>
 * 1: Object to drag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_dragObject;
 *
 * Public: No
 */

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

// get attachTo offset and direction.
private _position = _target getVariable [QGVAR(dragPosition), [0, 0, 0]];
private _direction = _target getVariable [QGVAR(dragDirection), 0];

// add height offset of model
private _offset = (_target modelToWorldVisual [0, 0, 0] select 2) - (_unit modelToWorldVisual [0, 0, 0] select 2);
if (_target isKindOf "CAManBase") then {
    _offset = 0;
};
_position = _position vectorAdd [0, 0, _offset];

// attach object
TRACE_3("attaching",_position,_offset,_direction);
_target attachTo [_unit, _position];
[QEGVAR(common,setDir), [_target, _direction], _target] call CBA_fnc_targetEvent;

if (_target isKindOf "CAManBase") then {
    [_target, "AinjPpneMrunSnonWnonDb_still", 0, true] call EFUNC(common,doAnimation);
};

_unit setVariable [QGVAR(isDragging), true, true];
_unit setVariable [QGVAR(draggedObject), _target, true];

// add drop action
if (GVAR(dragAndFire)) then {
    GVAR(unit) = _unit;

    // Using CBA keyhandler because addActionEventHandler doesn't seem to support right click
    GVAR(releaseActionID) = [0xF1, [false, false, false], {
        [GVAR(unit), GVAR(unit) getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
    }, "keydown", "", false, 0] call CBA_fnc_addKeyHandler;

    // show mouse hint - right click
    ["", localize LSTRING(Drop)] call EFUNC(interaction,showMouseHint);
} else {
    _unit setVariable [QGVAR(ReleaseActionID), [
        _unit, "DefaultAction",
        {!isNull ((_this select 0) getVariable [QGVAR(draggedObject), objNull])},
        {[_this select 0, (_this select 0) getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject)}
    ] call EFUNC(common,addActionEventHandler)];

    // show mouse hint - left click
    [localize LSTRING(Drop), ""] call EFUNC(interaction,showMouseHint);
};

// add anim changed EH
[_unit, "AnimChanged", FUNC(handleAnimChanged), [_unit]] call CBA_fnc_addBISEventHandler;

// check everything
[FUNC(dragObjectPFH), 0.5, [_unit, _target, CBA_missionTime]] call CBA_fnc_addPerFrameHandler;

// reset current dragging height.
GVAR(currentHeightChange) = 0;

// prevent UAVs from firing
private _UAVCrew = _target call EFUNC(common,getVehicleUAVCrew);

// fixes not being able to move when in combat pace
[_unit, "forceWalk", "ACE_dragging", true] call EFUNC(common,statusEffect_set);

if !(_UAVCrew isEqualTo []) then {
    {_target deleteVehicleCrew _x} count _UAVCrew;
    _target setVariable [QGVAR(isUAV), true, true];
};
