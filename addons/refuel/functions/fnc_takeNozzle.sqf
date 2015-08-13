/*
 * Author: GitHawk
 * Take a fuel nozzle
 *
 * Arguments:
 * 0: The unit <OBJECT>
 * 1: The target <OBJECT>
 * 2: The nozzle <OBJECT> (optional)
 *
 * Return Value:
 * NIL
 *
 * Example:
 * [unit, target, truck] call ace_refuel_fnc_takeNozzle
 *
 * Public: Yes
 */
#include "script_component.hpp"

private ["_endPosOffset"],
params ["_unit", "_target", "_nozzle"];

[_unit, QGVAR(vehAttach), true] call EFUNC(common,setForceWalkStatus);

_unit setVariable [QGVAR(selectedWeaponOnRefuel), currentWeapon _unit];
_unit action ["SwitchWeapon", _unit, _unit, 99];

if (isNull _nozzle) then { // func is called on fuel truck
    _endPosOffset = getArray (configFile >> "CfgVehicles" >> typeOf _target >> "ace_refuel_hooks") select 0;

    // TODO pfh to check distance between _unit und _target
    // if too large cancel walk and drop nozzle
    
    // TODO add pickup animation ?
    
    [{
        params ["_unit", "_target", "_endPosTestOffset"];
        _newNozzle = "ACE_refuel_fuelNozzle" createVehicle position _unit;
        _newNozzle attachTo [_unit, [-0.02,-0.05,0], "righthandmiddle1"]; // TODO replace with right coordinates for real model
        _unit setVariable [QGVAR(nozzle), _newNozzle];
        
        _rope = ropeCreate [_target, _endPosTestOffset, _newNozzle, [0, 0, 0], 12];
        
        _newNozzle setVariable [QGVAR(source), _target, true];
        _newNozzle setVariable [QGVAR(rope), _rope, true];
        _target setVariable [QGVAR(connected), _newNozzle, true];
    }, [_unit, _target, _endPosOffset], 2, 0] call EFUNC(common,waitAndExecute);

    _unit setVariable [QGVAR(isRefueling), 1];
} else { // func is called in muzzle either connected or on ground
    // TODO add pickup animation ?
    [{
        params ["_unit", "_target", "_nozzle"];
        
        detach _nozzle;
        _target setVariable [QGVAR(nozzle), objNull, true];
        _nozzle attachTo [_unit, [-0.02,-0.05,0], "righthandmiddle1"]; // TODO replace with right coordinates for real model
        _unit setVariable [QGVAR(nozzle), _nozzle];
    }, [_unit, _target, _nozzle], 2, 0] call EFUNC(common,waitAndExecute);
};

true