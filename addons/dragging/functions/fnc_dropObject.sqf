/*
 * Author: commy2
 * Drop a dragged object.
 *
 * Arguments:
 * 0: Unit that drags the other object <OBJECT>
 * 1: Dragged object to drop <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_dropObject;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

// remove drop action
[_unit, "DefaultAction", _unit getVariable [QGVAR(ReleaseActionID), -1]] call CFUNC(removeActionEventHandler);

private _inBuilding = [_unit] call FUNC(isObjectOnObject);

if !(_unit getVariable ["ACE_isUnconscious", false]) then {
    // play release animation
    _unit playAction "released";
};

// prevent collision damage
["fixCollision", _unit] call CFUNC(localEvent);
["fixCollision", _target, _target] call CFUNC(targetEvent);

// release object
detach _target;

if (_target isKindOf "CAManBase") then {
    if (_target getVariable ["ACE_isUnconscious", false]) then {
        [_target, "unconscious", 2, true] call CFUNC(doAnimation);
    } else {
        [_target, "", 2, true] call CFUNC(doAnimation);  //@todo "AinjPpneMrunSnonWnonDb_release" seems to fall back to unconsciousness anim.
    };
};

_unit removeWeapon "ACE_FakePrimaryWeapon";

// prevent object from flipping inside buildings
if (_inBuilding) then {
    _target setPosASL (getPosASL _target vectorAdd [0, 0, 0.05]);
    TRACE_2("setPos",getPosASL _unit,getPosASL _target);
};

// hide mouse hint
[] call EFUNC(interaction,hideMouseHint);

_unit setVariable [QGVAR(isDragging), false, true];
_unit setVariable [QGVAR(draggedObject), objNull, true];

// make object accesable for other units
[objNull, _target, true] call CFUNC(claim);

if !(_target isKindOf "CAManBase") then {
    ["fixPosition", _target, _target] call CFUNC(targetEvent);
    ["fixFloating", _target, _target] call CFUNC(targetEvent);
};

if (_unit getVariable ["ACE_isUnconscious", false]) then {
    [_unit, "unconscious", 2, true] call CFUNC(doAnimation);
};

// recreate UAV crew
if (_target getVariable [QGVAR(isUAV), false]) then {
    createVehicleCrew _target;
};
