#include "script_component.hpp"
/*
 * Author: Glowbal, mharis001
 * Local callback for administering an IV bag to a patient.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Treatment <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "RightArm", "BloodIV"] call ace_medical_treatment_fnc_ivBagLocal
 *
 * Public: No
 */

params ["_patient", "_bodyPart", "_classname"];

// Exit if patient has max blood volume
private _bloodVolume = GET_BLOOD_VOLUME(_patient);
if (_bloodVolume >= DEFAULT_BLOOD_VOLUME) exitWith {};

private _partIndex = ALL_BODY_PARTS find toLower _bodyPart;

// Get attributes for the used IV
private _defaultConfig = configFile >> QUOTE(ADDON) >> "IV";
private _ivConfig = _defaultConfig >> _classname;

private _volume = GET_NUMBER(_ivConfig >> "volume",getNumber (_defaultConfig >> "volume"));
private _type   = GET_STRING(_ivConfig >> "type",getText (_defaultConfig >> "type"));

// Add IV bag to patient's ivBags array
private _ivBags = _patient getVariable [QEGVAR(medical,ivBags), []];
_ivBags pushBack [_volume, _type, _partIndex];
_patient setVariable [QEGVAR(medical,ivBags), _ivBags, true];
