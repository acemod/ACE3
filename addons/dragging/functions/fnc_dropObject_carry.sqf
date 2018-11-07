#include "script_component.hpp"
/*
 * Author: commy2
 * Drop a carried object.
 *
 * Arguments:
 * 0: Unit that carries the other object <OBJECT>
 * 1: Carried object to drop <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_dropObject_carry;
 *
 * Public: No
 */

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

// remove drop action
[_unit, "DefaultAction", _unit getVariable [QGVAR(ReleaseActionID), -1]] call EFUNC(common,removeActionEventHandler);

private _inBuilding = [_unit] call FUNC(isObjectOnObject);

// prevent collision damage
[QEGVAR(common,fixCollision), _unit] call CBA_fnc_localEvent;
[QEGVAR(common,fixCollision), _target, _target] call CBA_fnc_targetEvent;

// release object
detach _target;

// fix anim when aborting carrying persons
if (_target isKindOf "CAManBase" || {animationState _unit in CARRY_ANIMATIONS}) then {
    if (vehicle _unit == _unit && {!(_unit getVariable ["ACE_isUnconscious", false])}) then {
        [_unit, "", 2, true] call EFUNC(common,doAnimation);
    };

    if (_target getVariable ["ACE_isUnconscious", false]) then {
        [_target, "unconscious", 2, true] call EFUNC(common,doAnimation);
    } else {
        [_target, "", 2, true] call EFUNC(common,doAnimation);  //@todo
    };
};

// properly remove fake weapon
_unit removeWeapon "ACE_FakePrimaryWeapon";

// reselect weapon and re-enable sprint
_unit selectWeapon primaryWeapon _unit;

[_unit, "forceWalk", "ACE_dragging", false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", "ACE_dragging", false] call EFUNC(common,statusEffect_set);

// prevent object from flipping inside buildings
if (_inBuilding) then {
    _target setPosASL (getPosASL _target vectorAdd [0, 0, 0.05]);
};

// hide mouse hint
[] call EFUNC(interaction,hideMouseHint);

_unit setVariable [QGVAR(isCarrying), false, true];
_unit setVariable [QGVAR(carriedObject), objNull, true];

// make object accesable for other units
[objNull, _target, true] call EFUNC(common,claim);

if !(_target isKindOf "CAManBase") then {
    [QEGVAR(common,fixPosition), _target, _target] call CBA_fnc_targetEvent;
    [QEGVAR(common,fixFloating), _target, _target] call CBA_fnc_targetEvent;
};

// workaround for weapon dropped from dead body. Sometimes it falls under ground and setPos is needed
#define MAX_FALLING_TIME 1.2
#define MAX_FALLING_HEIGHT (9.81 * MAX_FALLING_TIME * MAX_FALLING_TIME / 2)
if (_target isKindOf "WeaponHolderSimulated") then {
    private _positionASL = getPosASL _target;
    // find first touched surface height
    private _surfaces = lineIntersectsSurfaces [_positionASL, ATLToASL [_positionASL select 0, _positionASL select 1, -1], _target, _unit];
    if (_surfaces isEqualTo []) exitWith {};
    private _surfaceHeight = _surfaces select 0 select 0 select 2;
    // if target is falling more than we want to track, let it go
    if (_surfaceHeight + MAX_FALLING_HEIGHT < _positionASL select 2) exitWith {};

    [
        {getPosASL (_this select 0) select 2 < (_this select 1) - 0.2},
        {
            private _neededPos = getPosASL (_this select 0);
            _neededPos set [2, _this select 1];
            (_this select 0) setPosASL _neededPos;
        },
        [_target, _surfaceHeight],
        MAX_FALLING_TIME
    ] call CBA_fnc_waitUntilAndExecute;
};

// recreate UAV crew
if (_target getVariable [QGVAR(isUAV), false]) then {
    createVehicleCrew _target;
};
