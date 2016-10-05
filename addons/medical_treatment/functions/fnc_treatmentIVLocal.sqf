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
 * Public: Yes
 */

#include "script_component.hpp"

params ["_target", "_treatmentClassname"];

private _bloodVolume = _target getVariable [QEGVAR(medical,bloodVolume), 100];

if (_bloodVolume >= 100) exitWith {};

// Find the proper attributes for the used IV
private _config = (configFile >> "ace_medical_treatment" >> "IV");
private _volumeAdded = getNumber (_config >> "volume");
private _typeOf = getText (_config >> "type");

if (isClass (_config >> _treatmentClassname)) then {
    _config = (_config >> _treatmentClassname);
    if (isNumber (_config >> "volume")) then { _volumeAdded = getNumber (_config >> "volume");};
    if (isText (_config >> "type")) then { _typeOf = getText (_config >> "type"); };
} else {
    ERROR("IV Treatment Classname not found");
};

private _bloodBags = _target getVariable [QEGVAR(medical,ivBags), []];
_bloodBags pushBack [_volumeAdded]; // Future BagType: [_volumeAdded, _typeOf]
_target setVariable [QEGVAR(medical,ivBags), _bloodBags, true];
