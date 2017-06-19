/*
 * Author: Glowbal
 * IV Treatment local callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: Treatment classname <STRING>
 *
 *
 * Return Value:
 * None
 *
 * Example:
 * [medic, "Classname"] call ace_medical_fnc_treatmentIVLocal
 *
 * Public: Yes
 */

#include "script_component.hpp"

params ["_target", "_treatmentClassname"];

private _bloodVolume = _target getVariable [QGVAR(bloodVolume), 100];
if (_bloodVolume >= 100) exitWith {};

// Find the proper attributes for the used IV
private _config = (configFile >> "ACE_Medical_Advanced" >> "Treatment" >> "IV");
private _volumeAdded = getNumber (_config >> "volume");
private _typeOf = getText (_config >> "type");

if (isClass (_config >> _treatmentClassname)) then {
    _config = (_config >> _treatmentClassname);
    if (isNumber (_config >> "volume")) then { _volumeAdded = getNumber (_config >> "volume");};
    if (isText (_config >> "type")) then { _typeOf = getText (_config >> "type"); };
} else {
    ERROR("IV Treatment Classname not found");
};

private _bloodBags = _target getVariable [QGVAR(ivBags), []];
_bloodBags pushBack [_volumeAdded]; // Future BagType: [_volumeAdded, _typeOf]
_target setVariable [QGVAR(ivBags), _bloodBags, true];
