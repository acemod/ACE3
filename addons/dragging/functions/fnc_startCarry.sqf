/*
 * Author: commy2
 *
 * Start the carrying process.
 *
 * Argument:
 * 0: Unit that should do the carrying (Object)
 * 1: Object to carry (Object)
 *
 * Return value:
 * NONE.
 */
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

// check weight
private "_weight";
_weight = [_target] call FUNC(getWeight);

if (_weight > GETMVAR(ACE_maxWeightCarry,1E11)) exitWith {
    [localize "STR_ACE_Dragging_UnableToDrag"] call EFUNC(common,displayTextStructured);
};

// select no weapon and stop sprinting
_unit action ["SwitchWeapon", _unit, _unit, 99];

[_unit, "isDragging", true] call EFUNC(common,setforceWalkStatus);

// prevent multiple players from accessing the same object
[_unit, _target, true] call EFUNC(common,claim);

private "_timer";
_timer = 2;

// can't play action that depends on weapon if it was added the same frame
/*[{_this playActionNow "grabDrag";}, _unit] call EFUNC(common,execNextFrame);*/ //@todo

// move a bit closer and adjust direction when trying to pick up a person
if (_target isKindOf "CAManBase") then {
    /*[_target, "AinjPpneMrunSnonWnonDb_grab", 2, true] call EFUNC(common,doAnimation);
    _target setDir (getDir _unit + 180);
    _target setPos (getPos _unit vectorAdd (vectorDir _unit vectorMultiply 1.5));*/

    _timer = 15;


//@todo
};

// prevents draging and carrying at the same time
_unit setVariable [QGVAR(isCarrying), true, true];

[FUNC(startCarryPFH), 0.2, [_unit, _target], _timer] call CBA_fnc_addPerFrameHandler;
