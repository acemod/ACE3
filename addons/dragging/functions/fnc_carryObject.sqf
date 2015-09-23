/*
 * Author: commy2
 *
 * Carry an object.
 *
 * Arguments:
 * 0: Unit that should do the carrying <OBJECT>
 * 1: Object to carry <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

// get attachTo offset and direction.
private ["_position", "_direction"];

_position = _target getVariable [QGVAR(carryPosition), [0, 0, 0]];
_direction = _target getVariable [QGVAR(carryDirection), 0];

// handle objects vs persons
if (_target isKindOf "CAManBase") then {

    [_unit, "AcinPercMstpSnonWnonDnon", 2, true] call EFUNC(common,doAnimation);
    [_target, "AinjPfalMstpSnonWnonDf_carried_dead", 2, true] call EFUNC(common,doAnimation);

    // attach person
    _target attachTo [_unit, _position, "LeftShoulder"];

} else {

    // add height offset of model
    private "_offset";
    _offset = (_target modelToWorldVisual [0, 0, 0] select 2) - (_unit modelToWorldVisual [0, 0, 0] select 2);

    _position = _position vectorAdd [0, 0, _offset];

    // attach object
    _target attachTo [_unit, _position];

};
["setDir", _target, [_target, _direction]] call EFUNC(common,targetEvent);

_unit setVariable [QGVAR(isCarrying), true, true];
_unit setVariable [QGVAR(carriedObject), _target, true];

// add drop action
_unit setVariable [QGVAR(ReleaseActionID),
    [_unit, "DefaultAction",
    {!isNull ((_this select 0) getVariable [QGVAR(carriedObject), objNull])},
    {[_this select 0, (_this select 0) getVariable [QGVAR(carriedObject), objNull]] call FUNC(dropObject_carry)}
] call EFUNC(common,AddActionEventHandler)];

// show mouse hint
[localize LSTRING(Drop), "", localize LSTRING(LowerRaise)] call EFUNC(interaction,showMouseHint);

// check everything
[FUNC(carryObjectPFH), 0.5, [_unit, _target]] call CBA_fnc_addPerFrameHandler;

// reset current dragging height.
GVAR(currentHeightChange) = 0;
