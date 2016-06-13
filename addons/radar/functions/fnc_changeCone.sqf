/*
 * Author: BaerMitUmlaut
 * Changes the radar scanning cone.
 *
 * Arguments:
 * 0: Increase value <BOOL>
 * 1: Change width (false changes height) <BOOL>
 *
 * Return Value:
 * Key handled <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_increase", "_changeWidth"];

private _vehicle = vehicle ACE_player;
if !(_vehicle getVariable [QGVAR(radarEnabled), false]) exitWith {false};

private _angle = if (_changeWidth) then {
    _vehicle getVariable QGVAR(coneAngleH)
} else {
    _vehicle getVariable QGVAR(coneAngleV)
};

private _newAngle = 0;
if (_increase) then {
    private _maxAngle = if (isNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QVAR(coneAngleMax))) then {
        getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QVAR(coneAngleMax))
    } else {
        60
    };
    _newAngle = (_angle + 5) min _maxAngle;
} else {
    private _minAngle = if (isNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QVAR(coneAngleMin))) then {
        getNumber (configFile >> "CfgVehicles" >> typeOf _vehicle >> QVAR(coneAngleMin))
    } else {
        15
    };
    _newAngle = (_angle - 5) max _minAngle;
};

if (_changeWidth) then {
    _vehicle setVariable [QGVAR(coneAngleH), _newAngle];
} else {
    _vehicle setVariable [QGVAR(coneAngleV), _newAngle];
};

true
