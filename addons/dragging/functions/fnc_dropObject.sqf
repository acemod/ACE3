#include "..\script_component.hpp"
/*
 * Author: commy2, Malbryn
 * Drops a dragged object.
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

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

// Remove drop action
if (!isNil QGVAR(releaseActionID)) then {
    [GVAR(releaseActionID), "keydown"] call CBA_fnc_removeKeyHandler;
    GVAR(releaseActionID) = nil;
};

// Stop blocking
if (!GVAR(dragAndFire)) then {
    [_unit, "DefaultAction", _unit getVariable [QGVAR(blockFire), -1]] call EFUNC(common,removeActionEventHandler);
};

private _inBuilding = _unit call FUNC(isObjectOnObject);
private _isClone = _target isKindOf QGVAR(clone);

// Drop cloned dead units
if (_isClone) then {
    _target = [_unit, _target, _inBuilding] call FUNC(deleteClone);
};

// Play release animation
if (_unit call EFUNC(common,isAwake)) then {
    [_unit, "released"] call EFUNC(common,doGesture);
};

// Prevent collision damage
[QEGVAR(common,fixCollision), _unit] call CBA_fnc_localEvent;
[QEGVAR(common,fixCollision), _target, _target] call CBA_fnc_targetEvent;

// Release object
detach _target;

if (_target isKindOf "CAManBase") then {
    if (_target getVariable ["ACE_isUnconscious", false]) then {
        [_target, "unconscious", 2] call EFUNC(common,doAnimation);
    } else {
        [_target, "", 2] call EFUNC(common,doAnimation);  //@todo "AinjPpneMrunSnonWnonDb_release" seems to fall back to unconsciousness anim.
    };
};

_unit removeWeapon "ACE_FakePrimaryWeapon";

[_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

// Prevent object from flipping inside buildings
if (_inBuilding && {!_isClone}) then {
    _target setPosASL (getPosASL _target vectorAdd [0, 0, 0.05]);
    TRACE_2("setPos",getPosASL _unit,getPosASL _target);
};

// Hide mouse hint
call EFUNC(interaction,hideMouseHint);

_unit setVariable [QGVAR(isDragging), false, true];
_unit setVariable [QGVAR(draggedObject), objNull, true];

// Make object accessible for other units
[objNull, _target, true] call EFUNC(common,claim);

if !(_target isKindOf "CAManBase") then {
    [QEGVAR(common,fixPosition), _target, _target] call CBA_fnc_targetEvent;
    [QEGVAR(common,fixFloating), _target, _target] call CBA_fnc_targetEvent;
};

if (_unit getVariable ["ACE_isUnconscious", false]) then {
    [_unit, "unconscious", 2] call EFUNC(common,doAnimation);
};

// Reenable UAV crew
private _UAVCrew = _target getVariable [QGVAR(isUAV), []];

if (_UAVCrew isNotEqualTo []) then {
    // Reenable AI
    {
        [_x, false] call EFUNC(common,disableAiUAV);
    } forEach _UAVCrew;

    _target setVariable [QGVAR(isUAV), nil, true];
};

// Fixes not being able to move when in combat pace
[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

// Reset mass
private _mass = _target getVariable [QGVAR(originalMass), 0];

if (_mass != 0) then {
    [QEGVAR(common,setMass), [_target, _mass]] call CBA_fnc_globalEvent; // Force global sync
};

// API
[QGVAR(stoppedDrag), [_unit, _target]] call CBA_fnc_localEvent;
