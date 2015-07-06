/*
 * Author: commy2
 *
 * Carry an object.
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

_unit setVariable [QGVAR(startCarrying), false, true];
_unit setVariable [QGVAR(isCarrying), true, true];
_unit setVariable [QGVAR(carriedObject), _target, true];

// add scrollwheel action to release object
private "_actionID";
_actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];

if (_actionID != -1) then {
    _unit removeAction _actionID;
};

_actionID = _unit addAction [
    format ["<t color='#FF0000'>%1</t>", localize LSTRING(Drop)],
    QUOTE([ARR_2(_this select 0, (_this select 0) getVariable [ARR_2(QUOTE(QGVAR(carriedObject)),objNull)])] call FUNC(dropObject_carry)),
    nil,
    20,
    false,
    true,
    "",
    QUOTE(!isNull (_this getVariable [ARR_2(QUOTE(QGVAR(carriedObject)),objNull)]))
];

_unit setVariable [QGVAR(ReleaseActionID), _actionID];

// check everything
[FUNC(carryObjectPFH), 0.5, [_unit, _target]] call CBA_fnc_addPerFrameHandler;

// reset current dragging height.
GVAR(currentHeightChange) = 0;
