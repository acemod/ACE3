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
 * None
 *
 * Example:
 * [unit, target, truck] call ace_refuel_fnc_takeNozzle
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_endPosOffset"],
params ["_unit", "_target", "_nozzle"];

[_unit, QGVAR(vehAttach), true] call EFUNC(common,setForceWalkStatus);

_unit setVariable [QGVAR(selectedWeaponOnRefuel), currentWeapon _unit];
_unit action ["SwitchWeapon", _unit, _unit, 99];

if (isNull _nozzle) then { // func is called on fuel truck
    _endPosOffset = getArray (configFile >> "CfgVehicles" >> typeOf _target >> "ace_refuel_hooks");
    if (count _endPosOffset == 2) then {
        if (_unit distance (_target modelToWorld (_endPosOffset select 0)) <  _unit distance (_target modelToWorld (_endPosOffset select 1))) then {
            _endPosOffset = _endPosOffset select 0;
        } else {
            _endPosOffset = _endPosOffset select 1;
        };
    } else {
        _endPosOffset = _endPosOffset select 0;
    };

    // TODO add pickup animation ?

    [{
        params ["_unit", "_target", "_endPosOffset"];
        _newNozzle = "ACE_refuel_fuelNozzle" createVehicle position _unit;
        _newNozzle attachTo [_unit, [-0.02,-0.05,0], "righthandmiddle1"]; // TODO replace with right coordinates for real model
        _unit setVariable [QGVAR(nozzle), _newNozzle];

        _rope = ropeCreate [_target, _endPosOffset, _newNozzle, [0, 0, 0], 12];
        _newNozzle setVariable [QGVAR(attachPos), _endPosOffset, true];
        _newNozzle setVariable [QGVAR(source), _target, true];
        _newNozzle setVariable [QGVAR(rope), _rope, true];
        _target setVariable [QGVAR(isConnected), true, true];
    }, [_unit, _target, _endPosOffset], 2, 0] call EFUNC(common,waitAndExecute);

    [{
        private ["_nozzle"];
        params ["_args", "_pfID"];
        _args params ["_unit", "_source", "_endPosOffset"];

        if (_unit distance (_source modelToWorld _endPosOffset) > 10) exitWith {
            _nozzle =  _unit getVariable [QGVAR(nozzle), objNull];
            if !(isNull _nozzle) then {
                detach _nozzle;
                _nozzle setPosATL [(getPosATL _unit) select 0,(getPosATL _unit) select 1, 0];
                _nozzle setVelocity [0,0,0];
                _nozzle setVariable [QGVAR(isRefueling), false, true];
                _unit setVariable [QGVAR(isRefueling), false];
                _unit setVariable [QGVAR(nozzle), objNull];

                _weaponSelect = _unit getVariable QGVAR(selectedWeaponOnRefuel);
                _unit selectWeapon _weaponSelect;
                _unit setVariable [QGVAR(selectedWeaponOnRefuel), nil];

                [_unit, QGVAR(vehAttach), false] call EFUNC(common,setForceWalkStatus);
                [LSTRING(Hint_TooFar), 2, _unit] call EFUNC(common,displayTextStructured);
            };
            [_pfID] call cba_fnc_removePerFrameHandler;
        };
    }, 0, [_unit, _target, _endPosOffset]] call cba_fnc_addPerFrameHandler;

    _unit setVariable [QGVAR(isRefueling), true];
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
