/*
 * Author: commy2
 *
 * Drop a carried object.
 *
 * Argument:
 * 0: Unit that carries the other object (Object)
 * 1: Carried object to drop (Object)
 *
 * Return value:
 * NONE.
 */
#include "script_component.hpp"

private ["_unit", "_target"];

_unit = _this select 0;
_target = _this select 1;

// remove scroll wheel action
_unit removeAction (_unit getVariable [QGVAR(ReleaseActionID), -1]);

private "_inBuilding";
_inBuilding = [_unit] call FUNC(isObjectOnObject);

// prevent collision damage
["fixCollision", _unit] call EFUNC(common,localEvent);
["fixCollision", _target, _target] call EFUNC(common,targetEvent);

// release object
detach _target;

if (_target isKindOf "CAManBase") then {
    [_unit, "", 2, true] call EFUNC(common,doAnimation);

    if (_target getVariable ["ACE_isUnconscious", false]) then {
        [_target, "unconscious", 2, true] call EFUNC(common,doAnimation);
    } else {
        [_target, "", 2, true] call EFUNC(common,doAnimation);  //@todo
    };
};

// reselect weapon and re-enable sprint
_unit selectWeapon primaryWeapon _unit;

[_unit, "isDragging", false] call EFUNC(common,setforceWalkStatus);

// prevent object from flipping inside buildings
if (_inBuilding) then {
    _target setPosASL (getPosASL _target vectorAdd [0, 0, 0.05]);
};

_unit setVariable [QGVAR(isCarrying), false, true];
_unit setVariable [QGVAR(carriedObject), objNull, true];

// make object accesable for other units
[objNull, _target, true] call EFUNC(common,claim);

if !(_target isKindOf "CAManBase") then {
    ["fixPosition", _target, _target] call EFUNC(common,targetEvent);
    ["fixFloating", _target, _target] call EFUNC(common,targetEvent);
};
