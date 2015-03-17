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

// select no weapon and stop sprinting
_unit action ["SwitchWeapon", _unit, _unit, 99];

[_unit, "isDragging", true] call EFUNC(common,setforceWalkStatus);

// prevent multiple players from accessing the same object
[_unit, _target, true] call EFUNC(common,claim);

// get attachTo offset and direction.
private ["_position", "_direction"];

_position = _target getVariable [QGVAR(carryPosition), [0, 0, 0]];
_direction = _target getVariable [QGVAR(carryDirection), 0];

// attach object
_target attachTo [_unit, _position];
_target setDir _direction;

_unit setVariable [QGVAR(isCarrying), true, true];
_unit setVariable [QGVAR(carriedObject), _target, true];

// add scrollwheel action to release object
private "_actionID";
_actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];

if (_actionID != -1) then {
    _unit removeAction _actionID;
};

_actionID = _unit addAction [
    format ["<t color='#FF0000'>%1</t>", localize "STR_ACE_Dragging_Drop"],
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
[FUNC(carryObjectPFH), 0, [_unit, _target]] call CBA_fnc_addPerFrameHandler;

// reset current dragging height.
GVAR(currentHeightChange) = 0;
