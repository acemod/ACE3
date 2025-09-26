#include "..\script_component.hpp"
/*
 * Author: Glowbal, mharis001, Cplhardcore
 * Local callback for administering an IV bag to a patient.
 *
 * Arguments:
 * 0: Patient <OBJECT>
 * 1: Body Part <STRING>
 * 2: Treatment <STRING>
 * 3: Medic <OBJECT>
 * 4: Item User <OBJECT>
 * 5: Used item <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "RightArm", "BloodIV", player, player, "ACE_BloodIV"] call ace_medical_treatment_fnc_ivBagLocal
 *
 * Public: No
 */

params ["_patient", "_bodyPart", "_treatment", "_medic", "_itemUser", "_item"];

// Exit if patient has max blood volume
private _bloodVolume = GET_BLOOD_VOLUME(_patient);
if (_bloodVolume >= DEFAULT_BLOOD_VOLUME) exitWith {
    // Return the bag if patient is topped up on blood
    if (_medic call EFUNC(common,isPlayer) || {missionNamespace getVariable [QEGVAR(medical_ai,requireItems), 0] > 0}) then {
        [_itemUser, _item] call EFUNC(common,addToInventory);
    };
};

private _partIndex = ALL_BODY_PARTS find toLowerANSI _bodyPart;

// Get attributes for the used IV
private _defaultConfig = configFile >> QUOTE(ADDON) >> "IV";
private _ivConfig = _defaultConfig >> _treatment;

private _volume     = GET_NUMBER(_ivConfig >> "volume",getNumber (_defaultConfig >> "volume"));
private _type       = GET_STRING(_ivConfig >> "type",getText (_defaultConfig >> "type"));
private _rateCoef   = GET_NUMBER(_ivConfig >> "rateCoef",getNumber (_defaultConfig >> "rateCoef"));
private _ratio      = GET_ARRAY(_ivConfig >> "ratio",getArray (_defaultConfig >> "ratio"));

// Add IV bag to patient's ivBags array
private _ivBags = _patient getVariable [QEGVAR(medical,ivBags), []];

// Simulate mixed fluid bags by using multiple smaller ivs. rateCoef is lowered to compensate
if (count _ratio > 2) then {
    private _totalRatio = 0;

    // Add an iv bag for each item in _ratio
    {
        if (_x isEqualType 1) then { continue }; // Skip over the numbers directly

        private _ratioCoef = _ratio select (_forEachIndex + 1);
        _totalRatio = _totalRatio + _ratioCoef;
        _ivBags pushBack [_volume * _ratioCoef, _x, _partIndex, _treatment, _rateCoef * _ratioCoef, _item];
    } forEach _ratio;

    if (abs (_totalRatio - 1) > 0.001) then {
        WARNING_2("Total fluid ratio for '%1' treatment does not equal 1 (%2)",_treatment,_totalRatio);
    };
} else {
    _ivBags pushBack [_volume, _type, _partIndex, _treatment, _rateCoef, _item];
};

_patient setVariable [QEGVAR(medical,ivBags), _ivBags, true];
