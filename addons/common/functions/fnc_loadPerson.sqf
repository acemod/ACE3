/*
 * Author: Glowbal
 * Loads a specified unit into any nearby vehicle
 *
 * Arguments:
 * 0: Unit that will load <OBJECT>
 * 1: Unit to be loaded <OBJECT>
 *
 * Return Value:
 * the vehicle that the unitToBeloaded has been loaded in. Returns ObjNull if function failed <OBJECT>
 *
 * Public: Yes
 */
#include "script_component.hpp"

#define GROUP_SWITCH_ID QFUNC(loadPerson)

params ["_caller", "_unit"];

private ["_vehicle", "_loadcar", "_loadair", "_loadtank", "_loadboat"];

_vehicle = objNull;

if (!([_caller] call FUNC(canInteract)) || {_caller == _unit}) exitWith {_vehicle};

_loadcar = nearestObject [_unit, "Car"];

if (_unit distance _loadcar <= 10) then {
    _vehicle = _loadcar;
} else {
    _loadair = nearestObject [_unit, "Air"];

    if (_unit distance _loadair <= 10) then {
        _vehicle = _loadair;
    } else {
        _loadtank = nearestObject [_unit, "Tank"];

        if (_unit distance _loadtank <= 10) then {
            _vehicle = _loadtank;
        } else {
            _loadboat = nearestObject [_unit, "Ship_F"];

            if (_unit distance _loadboat <= 10) then {
                _vehicle = _loadboat;
            };
        };
    };
};

if (!isNull _vehicle) then {
    [_unit, true, GROUP_SWITCH_ID, side group _caller] call FUNC(switchToGroupSide);
    [[_unit, _vehicle, _caller], QFUNC(loadPersonLocal), _unit, false] call FUNC(execRemoteFnc);
};

_vehicle
