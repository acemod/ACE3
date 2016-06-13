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

private _varName = format["ACE_Medical_IVVolume_%1",_typeOf];
_target setVariable [_varName, (_target getVariable [_varName, 0]) + _volumeAdded, true];

if !(_varName in EGVAR(medical,IVBags)) then {
    EGVAR(medical,IVBags) pushBack _varName;
    publicVariable QEGVAR(medical,IVBags)
};
