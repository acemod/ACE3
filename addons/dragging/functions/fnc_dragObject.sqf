#include "..\script_component.hpp"
/*
 * Author: commy2, Malbryn
 * Handles attaching and setting up a dragged object. Called from ace_dragging_fnc_startDragPFH.
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

// Get attachTo offset and direction.
private _position = _target getVariable [QGVAR(dragPosition), [0, 0, 0]];
private _direction = _target getVariable [QGVAR(dragDirection), 0];

// Add height offset of model
private _offset = ((_target modelToWorldVisual [0, 0, 0]) select 2) - ((_unit modelToWorldVisual [0, 0, 0]) select 2);

if (_target isKindOf "CAManBase") then {
    _offset = 0;
};

_position = _position vectorAdd [0, 0, _offset];

// Attach object
TRACE_3("attaching",_position,_offset,_direction);

_target attachTo [_unit, _position];

[QEGVAR(common,setDir), [_target, _direction], _target] call CBA_fnc_targetEvent;

if (_target isKindOf "CAManBase") then {
    [_target, "AinjPpneMrunSnonWnonDb_still", 0] call EFUNC(common,doAnimation);
};

_unit setVariable [QGVAR(isDragging), true, true];
_unit setVariable [QGVAR(draggedObject), _target, true];

// Add drop action
GVAR(unit) = _unit;

GVAR(releaseActionID) = [0xF1, [false, false, false], {
    [GVAR(unit), GVAR(unit) getVariable [QGVAR(draggedObject), objNull]] call FUNC(dropObject);
}, "keydown", "", false, 0] call CBA_fnc_addKeyHandler;

// Show mouse hint
["", LLSTRING(Drop)] call EFUNC(interaction,showMouseHint);

// Block firing
if (!GVAR(dragAndFire)) then {
    _unit setVariable [QGVAR(blockFire), [
        _unit, "DefaultAction",
        {true},
        {}
    ] call EFUNC(common,addActionEventHandler)];
};

// Add anim changed EH
[_unit, "AnimChanged", LINKFUNC(handleAnimChanged), [_unit]] call CBA_fnc_addBISEventHandler;

// Prevent UAVs from firing
private _UAVCrew = _target call EFUNC(common,getVehicleUAVCrew);

if (_UAVCrew isNotEqualTo []) then {
    {
        _target deleteVehicleCrew _x;
    } forEach _UAVCrew;

    _target setVariable [QGVAR(isUAV), true, true];
};

// Check everything
[LINKFUNC(dragObjectPFH), 0.5, [_unit, _target, CBA_missionTime]] call CBA_fnc_addPerFrameHandler;

// Fixes not being able to move when in combat pace
[_unit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
