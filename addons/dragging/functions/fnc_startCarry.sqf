#include "script_component.hpp"
/*
 * Author: commy2, PiZZADOX
 * Start the carrying process.
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

// exempt from weight check if object has override variable set
private _weight = 0;
if !(_target getVariable [QGVAR(ignoreWeightCarry), false]) then {
    _weight = [_target] call FUNC(getWeight);
};

// exit if object weight is over global var value
if (_weight > GETMVAR(ACE_maxWeightCarry,1E11)) exitWith {
    [localize LSTRING(UnableToDrag)] call EFUNC(common,displayTextStructured);
};

private _timer = CBA_missionTime + 5;

// handle objects vs persons
if (_target isKindOf "CAManBase") then {

    // add a primary weapon if the unit has none.
    if (primaryWeapon _unit isEqualto "") then {
        _unit addWeapon "ACE_FakePrimaryWeapon";
    };

    // select primary, otherwise the drag animation actions don't work.
    _unit selectWeapon primaryWeapon _unit;

    // move a bit closer and adjust direction when trying to pick up a person
    _target setDir (getDir _unit + 180);
    _target setPosASL (getPosASL _unit vectorAdd (vectorDir _unit));

    [_unit, "AcinPknlMstpSnonWnonDnon_AcinPercMrunSnonWnonDnon", 2] call EFUNC(common,doAnimation);
    [_target, "AinjPfalMstpSnonWrflDnon_carried_Up", 2] call EFUNC(common,doAnimation);

    _timer = CBA_missionTime + 10;

} else {
    // select no weapon and stop sprinting
    private _previousWeaponIndex = [_unit] call EFUNC(common,getFiremodeIndex);
    _unit setVariable [QGVAR(previousWeapon), _previousWeaponIndex, true];
    _unit action ["SwitchWeapon", _unit, _unit, 299];
    [_unit, "AmovPercMstpSnonWnonDnon", 0] call EFUNC(common,doAnimation);

    // only force walking if we're overweight
    [_unit, "forceWalk", "ace_dragging", _weight > GVAR(maxWeightCarryRun)] call EFUNC(common,statusEffect_set);
    [_unit, "blockSprint", "ace_dragging", _weight <= GVAR(maxWeightCarryRun)] call EFUNC(common,statusEffect_set);

};

[_unit, "blockThrow", "ace_dragging", true] call EFUNC(common,statusEffect_set);

// prevent multiple players from accessing the same object
[_unit, _target, true] call EFUNC(common,claim);

// prevents draging and carrying at the same time
_unit setVariable [QGVAR(isCarrying), true, true];

// required for aborting animation
_unit setVariable [QGVAR(carriedObject), _target, true];

// Event Handler for changes to inventory: allows unit to start running if weight is removed or be forced to walk if weight is added, drop object if weight past ACE_maxWeightCarry
private _ehID = _target addEventHandler ["ContainerClosed", {
    params ["_container", ""];
    private _owner = _container getVariable [QEGVAR(common,owner), objNull];
    [QGVAR(carryingContainerClosed), [_container, _owner], _owner] call CBA_fnc_targetEvent;
}];
_target setVariable [QGVAR(carryingContainerClosedEh), _ehID, true];

[FUNC(startCarryPFH), 0.2, [_unit, _target, _timer]] call CBA_fnc_addPerFrameHandler;

// disable collisions by setting the physx mass to almost zero
private _mass = getMass _target;

if (_mass > 1) then {
    _target setVariable [QGVAR(originalMass), _mass, true];
    [QEGVAR(common,setMass), [_target, 1e-12]] call CBA_fnc_globalEvent; // force global sync
};
