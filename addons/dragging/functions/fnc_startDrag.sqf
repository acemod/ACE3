/*
 * Author: commy2
 * Start the dragging process.
 *
 * Arguments:
 * 0: Unit that should do the dragging <OBJECT>
 * 1: Object to drag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_startDrag;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

// check weight
private _weight = [_target] call FUNC(getWeight);

if (_weight > missionNamespace getVariable ["ACE_maxWeightDrag", 1E11]) exitWith {
    [localize LSTRING(UnableToDrag)] call EFUNC(common,displayTextStructured);
};

// add a primary weapon if the unit has none.
// @todo prevent opening inventory when equipped with a fake weapon
if (primaryWeapon _unit == "") then {
    _unit addWeapon "ACE_FakePrimaryWeapon";
};

// select primary, otherwise the drag animation actions don't work.
_unit selectWeapon primaryWeapon _unit;

[_unit, "blockThrow", "ACE_dragging", true] call EFUNC(common,statusEffect_set);

// prevent multiple players from accessing the same object
[_unit, _target, true] call EFUNC(common,claim);

// can't play action that depends on weapon if it was added the same frame
if !(_unit call EFUNC(common,isSwimming)) then {
    [{
        [_this, "grabDrag"] call EFUNC(common,doGesture);
    }, _unit] call CBA_fnc_execNextFrame;
};

// move a bit closer and adjust direction when trying to pick up a person
if (_target isKindOf "CAManBase") then {
    _target setDir (getDir _unit + 180);
    _target setPosASL (getPosASL _unit vectorAdd (vectorDir _unit vectorMultiply 1.5));

    [_target, "AinjPpneMrunSnonWnonDb_grab", 2, true] call EFUNC(common,doAnimation);
};

// prevents draging and carrying at the same time
_unit setVariable [QGVAR(isDragging), true, true];

[FUNC(startDragPFH), 0.2, [_unit, _target, CBA_missionTime + 5]] call CBA_fnc_addPerFrameHandler;
