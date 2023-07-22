#include "script_component.hpp"
/*
 * Author: commy2, PiZZADOX
 * Starts the carrying process.
 *
 * Arguments:
 * 0: Unit that should do the carrying <OBJECT>
 * 1: Object to carry <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget] call ace_dragging_fnc_startCarry;
 *
 * Public: No
 */

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

private _weight = _target call FUNC(getWeight);

// Exempt from weight check if object has override variable set
if (!(_target getVariable [QGVAR(ignoreWeightCarry), false]) && {
    _weight > GETMVAR(ACE_maxWeightCarry,1E11)
}) exitWith {
    // Exit if object weight is over global var value
    [LLSTRING(UnableToDrag)] call EFUNC(common,displayTextStructured);
};

private _timer = CBA_missionTime + 5;

// Handle objects vs. persons
if (_target isKindOf "CAManBase") then {
    private _primaryWeapon = primaryWeapon _unit;

    // Add a primary weapon if the unit has none
    if (_primaryWeapon == "") then {
        _unit addWeapon "ACE_FakePrimaryWeapon";
        _primaryWeapon = "ACE_FakePrimaryWeapon";
    };

    // Select primary, otherwise the drag animation actions don't work
    _unit selectWeapon _primaryWeapon;

    // Move a bit closer and adjust direction when trying to pick up a person
    [QEGVAR(common,setDir), [_target, getDir _unit + 180], _target] call CBA_fnc_targetEvent;
    _target setPosASL (getPosASL _unit vectorAdd (vectorDir _unit));

    [_unit, "AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    [_target, "AinjPfalMstpSnonWrflDnon_carried_Up", 2] call EFUNC(common,doAnimation);

    _timer = CBA_missionTime + 10;
} else {
    // Select no weapon and stop sprinting
    private _previousWeaponIndex = [_unit] call EFUNC(common,getFiremodeIndex);
    _unit setVariable [QGVAR(previousWeapon), _previousWeaponIndex, true];

    _unit action ["SwitchWeapon", _unit, _unit, 299];

    [_unit, "AmovPercMstpSnonWnonDnon", 0] call EFUNC(common,doAnimation);

    // Objects other than containers have calculated weight == 0 so we use getMass
    if (["ReammoBox_F", "WeaponHolder", "WeaponHolderSimulated"] findIf {_target isKindOf _x} == -1) then {
        _weight = getMass _target;
    };

    if (_weight > GVAR(maxWeightCarryRun)) then {
        [_unit, "forceWalk", "ACE_dragging", true] call EFUNC(common,statusEffect_set);
    } else {
        [_unit, "blockSprint", "ACE_dragging", true] call EFUNC(common,statusEffect_set);
    };
};

[_unit, "blockThrow", "ACE_dragging", true] call EFUNC(common,statusEffect_set);

// Prevent multiple players from accessing the same object
[_unit, _target, true] call EFUNC(common,claim);

// Prevents draging and carrying at the same time
_unit setVariable [QGVAR(isCarrying), true, true];

// Required for aborting animation
_unit setVariable [QGVAR(carriedObject), _target, true];

[FUNC(startCarryPFH), 0.2, [_unit, _target, _timer]] call CBA_fnc_addPerFrameHandler;

// Disable collisions by setting the PhysX mass to almost zero
private _mass = getMass _target;

if (_mass > 1) then {
    _target setVariable [QGVAR(originalMass), _mass, true];
    [QEGVAR(common,setMass), [_target, 1e-12]] call CBA_fnc_globalEvent; // Force global sync
};
