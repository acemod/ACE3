#include "..\script_component.hpp"
/*
 * Author: commy2, PiZZADOX
 * Starts the carrying process.
 *
 * Arguments:
 * 0: Unit that should do the carrying <OBJECT>
 * 1: Object to carry <OBJECT>
 * 2: If object was successfully claimed <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, true] call ace_dragging_fnc_startCarryLocal
 *
 * Public: No
 */

params ["_unit", "_target", "_claimed"];
TRACE_3("params",_unit,_target,_claimed);

if (!_claimed) exitWith { WARNING_1("already claimed %1",_this) };

// Exempt from weight check if object has override variable set
private _weight = 0;

if !(_target getVariable [QGVAR(ignoreWeightCarry), false]) then {
    _weight = _target call FUNC(getWeight);
};

// Exit if object weight is over global var value
if (_weight > GETMVAR(ACE_maxWeightCarry,1E11)) exitWith {
    // Release claim on object
    [objNull, _target, true] call EFUNC(common,claim);

    [LLSTRING(UnableToDrag)] call EFUNC(common,displayTextStructured);
};

private _timer = CBA_missionTime + 5;

// Handle objects vs. persons
if (_target isKindOf "CAManBase") then {
    // Create clone for dead units
    if (!alive _target) then {
        _target = [_unit, _target] call FUNC(createClone);
    };

    private _primaryWeapon = primaryWeapon _unit;

    // Add a primary weapon if the unit has none
    if (_primaryWeapon == "") then {
        _unit addWeapon "ACE_FakePrimaryWeapon";
        _primaryWeapon = "ACE_FakePrimaryWeapon";
    };

    // Select primary, otherwise the carry animation actions don't work
    _unit selectWeapon _primaryWeapon; // This turns off lasers/lights

    // Move a bit closer and adjust direction when trying to pick up a person
    [QEGVAR(common,setDir), [_target, getDir _unit + 180], _target] call CBA_fnc_targetEvent;
    _target setPosASL (getPosASL _unit vectorAdd (vectorDir _unit));

    [_unit, "AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    [_target, "AinjPfalMstpSnonWrflDnon_carried_Up", 2] call EFUNC(common,doAnimation);

    _timer = CBA_missionTime + 10;
} else {
    // Select no weapon and stop sprinting
    if (currentWeapon _unit != "") then {
        _unit setVariable [QGVAR(previousWeapon), (weaponState _unit) select [0, 3], true];

        _unit action ["SwitchWeapon", _unit, _unit, 299];
    };

    [_unit, "AmovPercMstpSnonWnonDnon", 0] call EFUNC(common,doAnimation);

    private _canRun = _weight call FUNC(canRun_carry);

    // Only force walking if we're overweight
    [_unit, "forceWalk", QUOTE(ADDON), !_canRun] call EFUNC(common,statusEffect_set);
    [_unit, "blockSprint", QUOTE(ADDON), _canRun] call EFUNC(common,statusEffect_set);
};

[_unit, "blockThrow", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

// Prevents dragging and carrying at the same time
_unit setVariable [QGVAR(isCarrying), true, true];

// Required for aborting (animation & keybind)
_unit setVariable [QGVAR(carriedObject), _target, true];

[LINKFUNC(startCarryPFH), 0.2, [_unit, _target, _timer]] call CBA_fnc_addPerFrameHandler;

// Disable collisions by setting the PhysX mass to almost zero
private _mass = getMass _target;

if (_mass > 1) then {
    _target setVariable [QGVAR(originalMass), _mass, true];
    [QEGVAR(common,setMass), [_target, 1e-12]] call CBA_fnc_globalEvent; // Force global sync
};

// API
[QGVAR(setupCarry), [_unit, _target]] call CBA_fnc_localEvent;
