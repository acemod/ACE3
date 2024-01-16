#include "..\script_component.hpp"
/*
 * Author: commy2, PiZZADOX, Malbryn
 * Starts the dragging process.
 *
 * Arguments:
 * 0: Unit that should do the dragging <OBJECT>
 * 1: Object to drag <OBJECT>
 * 2: If object was successfully claimed <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, true] call ace_dragging_fnc_startDragLocal
 *
 * Public: No
 */

params ["_unit", "_target", "_claimed"];
TRACE_3("params",_unit,_target,_claimed);

if (!_claimed) exitWith { WARNING_1("already claimed %1",_this) };

// Exempt from weight check if object has override variable set
private _weight = 0;

if !(_target getVariable [QGVAR(ignoreWeightDrag), false]) then {
    _weight = _target call FUNC(getWeight);
};

// Exit if object weight is over global var value
if (_weight > GETMVAR(ACE_maxWeightDrag,1E11)) exitWith {
    [LLSTRING(UnableToDrag)] call EFUNC(common,displayTextStructured);
};

private _primaryWeapon = primaryWeapon _unit;

// Add a primary weapon if the unit has none
if !(GVAR(dragAndFire)) then {
    if (_primaryWeapon == "") then {
        _unit addWeapon "ACE_FakePrimaryWeapon";
        _primaryWeapon = "ACE_FakePrimaryWeapon";
    };

    _unit selectWeapon _primaryWeapon;
} else { // Making sure the unit is holding a primary weapon or handgun
    private _handgunWeapon = handgunWeapon _unit;

    if !(currentWeapon _unit in [_primaryWeapon, _handgunWeapon]) then {
        if (_primaryWeapon != "") then {
            // Use primary if possible
            _unit selectWeapon _primaryWeapon;
        } else {
            if (_handgunWeapon != "") then {
                // Use pistol if unit has no primary
                _unit selectWeapon _handgunWeapon;
            } else {
                // Add fake weapon if no weapons besides launcher are available
                _unit addWeapon "ACE_FakePrimaryWeapon";
                _unit selectWeapon "ACE_FakePrimaryWeapon";
            };
        };
    };
};

// Save the weapon so we can monitor if it changes
_unit setVariable [QGVAR(currentWeapon), currentWeapon _unit];

[_unit, "blockThrow", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

// Can't play action that depends on weapon if it was added the same frame
if !(_unit call EFUNC(common,isSwimming)) then {
    [{
        private _unitWeapon = _this getVariable [QGVAR(currentWeapon), ""];

        if (_unitWeapon isKindOf ["Pistol", configFile >> "CfgWeapons"]) then {
            [_this, "ACE_dragWithPistol"] call EFUNC(common,doGesture);
        } else {
            [_this, "ACE_dragWithRifle"] call EFUNC(common,doGesture);
        };
    }, _unit] call CBA_fnc_execNextFrame;
};

// Move a bit closer and adjust direction when trying to pick up a person
if (_target isKindOf "CAManBase") then {
    [QEGVAR(common,setDir), [_target, getDir _unit + 180], _target] call CBA_fnc_targetEvent;
    _target setPosASL (getPosASL _unit vectorAdd (vectorDir _unit vectorMultiply 1.5));

    [_target, "AinjPpneMrunSnonWnonDb_grab", 2] call EFUNC(common,doAnimation);
};

// Prevents dragging and carrying at the same time
_unit setVariable [QGVAR(isDragging), true, true];

[FUNC(startDragPFH), 0.2, [_unit, _target, CBA_missionTime + 5]] call CBA_fnc_addPerFrameHandler;

// Disable collisions by setting the physx mass to almost zero
private _mass = getMass _target;

if (_mass > 1) then {
    _target setVariable [QGVAR(originalMass), _mass, true];
    [QEGVAR(common,setMass), [_target, 1e-12]] call CBA_fnc_globalEvent; // Force global sync
};
