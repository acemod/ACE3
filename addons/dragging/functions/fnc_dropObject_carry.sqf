#include "..\script_component.hpp"
/*
 * Author: commy2
 * Drops a carried object.
 *
 * Arguments:
 * 0: Unit that carries the other object <OBJECT>
 * 1: Carried object to drop <OBJECT>
 * 2: Try loading object into vehicle <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_dropObject_carry;
 *
 * Public: No
 */

params ["_unit", "_target", ["_tryLoad", false]];
TRACE_1("params",_this);

// Remove drop action
[_unit, "DefaultAction", _unit getVariable [QGVAR(releaseActionID), -1]] call EFUNC(common,removeActionEventHandler);
_unit setVariable [QGVAR(releaseActionID), nil];

private _inBuilding = _unit call FUNC(isObjectOnObject);
private _isClone = _target isKindOf QGVAR(clone);

// Drop cloned dead units
if (_isClone) then {
    _target = [_unit, _target, _inBuilding] call FUNC(deleteClone);
};

// Prevent collision damage
[QEGVAR(common,fixCollision), _unit] call CBA_fnc_localEvent;
[QEGVAR(common,fixCollision), _target, _target] call CBA_fnc_targetEvent;

private _cursorObject = cursorObject;
_tryLoad = _tryLoad && {!isNull _cursorObject} && {[_unit, _cursorObject, ["isNotCarrying"]] call EFUNC(common,canInteractWith)};
private _loadCargo = false;

// Don't release object if loading into vehicle (object might be released into vehicle)
if (_tryLoad && {!(_target isKindOf "CAManBase")} && {["ace_cargo"] call EFUNC(common,isModLoaded)} && {[_target, _cursorObject] call EFUNC(cargo,canLoadItemIn)}) then {
    _loadCargo = true;
} else {
    // Release object
    detach _target;
};

// Fix anim when aborting carrying persons
if (_target isKindOf "CAManBase" || {animationState _unit in CARRY_ANIMATIONS}) then {
    if (isNull objectParent _unit && {_unit call EFUNC(common,isAwake)}) then {
        [_unit, "", 2] call EFUNC(common,doAnimation);
    };

    if (_target getVariable ["ACE_isUnconscious", false]) then {
        [_target, "unconscious", 2] call EFUNC(common,doAnimation);
    } else {
        [_target, "", 2] call EFUNC(common,doAnimation);  //@todo
    };
};

// Properly remove fake weapon
_unit removeWeapon "ACE_FakePrimaryWeapon";

// Reselect weapon and re-enable sprint
private _previousWeaponState = _unit getVariable QGVAR(previousWeapon);

if (!isNil "_previousWeaponState") then {
    _unit selectWeapon _previousWeaponState;

    _unit setVariable [QGVAR(previousWeapon), nil, true];
};

[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, "blockSprint", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

// Prevent object from flipping inside buildings
if (_inBuilding && {!_isClone}) then {
    _target setPosASL (getPosASL _target vectorAdd [0, 0, 0.05]);
    TRACE_2("setPos",getPosASL _unit,getPosASL _target);
};

_unit setVariable [QGVAR(isCarrying), false, true];
_unit setVariable [QGVAR(carriedObject), objNull, true];

// Make object accessible for other units
[objNull, _target, true] call EFUNC(common,claim);

if !(_target isKindOf "CAManBase") then {
    [QEGVAR(common,fixPosition), _target, _target] call CBA_fnc_targetEvent;
    [QEGVAR(common,fixFloating), _target, _target] call CBA_fnc_targetEvent;
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

// Reset mass
private _mass = _target getVariable [QGVAR(originalMass), 0];

if (_mass != 0) then {
    [QEGVAR(common,setMass), [_target, _mass]] call CBA_fnc_globalEvent; // Force global sync
};

// Reset temp direction
_target setVariable [QGVAR(carryDirection_temp), nil];

// (Try) loading into vehicle
if (_loadCargo) then {
    [_unit, _target, _cursorObject] call EFUNC(cargo,startLoadIn);
} else {
    if (_tryLoad && {_unit distance _cursorObject <= MAX_LOAD_DISTANCE_MAN} && {_target isKindOf "CAManBase"}) then {
        private _vehicles = [_cursorObject, 0, true] call EFUNC(common,nearestVehiclesFreeSeat);

        if ([_cursorObject] isEqualTo _vehicles) then {
            if (GETEGVAR(medical,enabled,false)) then {
                [_unit, _target, _cursorObject] call EFUNC(medical_treatment,loadUnit);
            } else {
                [_unit, _target, _cursorObject] call EFUNC(common,loadPerson);
            };

            // Repurpose variable for flag used in event below
            _loadCargo = true;
        };
    };
};

// API
[QGVAR(stoppedCarry), [_unit, _target, _loadCargo]] call CBA_fnc_localEvent;
