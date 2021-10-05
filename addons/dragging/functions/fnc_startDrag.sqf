#include "script_component.hpp"
/*
 * Author: commy2, PiZZADOX, Malbryn
 * Start the dragging process.
 *
 * Arguments:
 * 0: Unit that should do the dragging <OBJECT>
 * 1: Object to drag <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_startDrag;
 *
 * Public: No
 */

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

// exempt from weight check if object has override variable set
if (!GETVAR(_target,GVAR(ignoreWeightDrag),false) && {
    private _weight = [_target] call FUNC(getWeight);
    _weight > GETMVAR(ACE_maxWeightDrag,1E11)
}) exitWith {
    // exit if object weight is over global var value
    [localize LSTRING(UnableToDrag)] call EFUNC(common,displayTextStructured);
};

// Add a primary weapon if the unit has none
if !(GVAR(dragAndFire)) then {
    if (primaryWeapon _unit isEqualto "") then {
        _unit addWeapon "ACE_FakePrimaryWeapon";
        _unit selectWeapon primaryWeapon _unit;
    } else {
        _unit selectWeapon primaryWeapon _unit;
    };
} else { // Making sure the unit is holding a primary weapon or handgun
    if !(currentWeapon _unit in [primaryWeapon _unit, handgunWeapon _unit]) then {
        if (primaryWeapon _unit != "") then {
            // Use primary if possible
            _unit selectWeapon primaryWeapon _unit;
        } else {
            if (handgunWeapon _unit != "") then {
                // Use pistol if unit has no primary
                _unit selectWeapon handgunWeapon _unit;
            } else {
                // Add fake weapon if no weapons besides launcher are available
                _unit addWeapon "ACE_FakePrimaryWeapon";
                _unit selectWeapon primaryWeapon _unit;
            };
        };
    };
};

// Save the weapon so we can monitor if it changes
_unit setVariable [QGVAR(currentWeapon), currentWeapon _unit];

[_unit, "blockThrow", "ACE_dragging", true] call EFUNC(common,statusEffect_set);

// prevent multiple players from accessing the same object
[_unit, _target, true] call EFUNC(common,claim);

// can't play action that depends on weapon if it was added the same frame
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

// move a bit closer and adjust direction when trying to pick up a person
if (_target isKindOf "CAManBase") then {
    _target setDir (getDir _unit + 180);
    _target setPosASL (getPosASL _unit vectorAdd (vectorDir _unit vectorMultiply 1.5));

    [_target, "AinjPpneMrunSnonWnonDb_grab", 2] call EFUNC(common,doAnimation);
};

// prevents draging and carrying at the same time
_unit setVariable [QGVAR(isDragging), true, true];

[FUNC(startDragPFH), 0.2, [_unit, _target, CBA_missionTime + 5]] call CBA_fnc_addPerFrameHandler;

// disable collisions by setting the physx mass to almost zero
private _mass = getMass _target;

if (_mass > 1) then {
    _target setVariable [QGVAR(originalMass), _mass, true];
    [QEGVAR(common,setMass), [_target, 1e-12]] call CBA_fnc_globalEvent; // force global sync
};
