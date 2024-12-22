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
<<<<<<< HEAD
=======
 * 4: Item User <OBJECT>
 * 5: Used item <STRING>
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
 *
 * Return Value:
 * None
 *
 * Example:
<<<<<<< HEAD
 * [player, "RightArm", "BloodIV", player] call ace_medical_treatment_fnc_ivBagLocal
=======
 * [player, "RightArm", "BloodIV", player, player, "ACE_BloodIV"] call ace_medical_treatment_fnc_ivBagLocal
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
 *
 * Public: No
 */

<<<<<<< HEAD
params ["_patient", "_bodyPart", "_classname", "_medic"];
=======
params ["_patient", "_bodyPart", "_treatment", "_medic", "_itemUser", "_item"];
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673

// Exit if patient has max blood volume
private _bloodVolume = GET_BLOOD_VOLUME(_patient);
if (_bloodVolume >= DEFAULT_BLOOD_VOLUME) exitWith {
    // Return the bag if patient is topped up on blood
<<<<<<< HEAD
    if (_medic call EFUNC(common,isPlayer)) then {
        private _receiver = [_patient, _medic, _medic] select GVAR(allowSharedEquipment);
        [_receiver, _classname] call EFUNC(common,addToInventory);
    } else {
        // If the medic is AI, only return bag if enabled
        if (missionNamespace getVariable [QEGVAR(medical_ai,requireItems), 0] > 0) then {
            [_medic, _classname] call EFUNC(common,addToInventory);
        };
=======
    if (_medic call EFUNC(common,isPlayer) || {missionNamespace getVariable [QEGVAR(medical_ai,requireItems), 0] > 0}) then {
        [_itemUser, _item] call EFUNC(common,addToInventory);
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
    };
};

private _partIndex = ALL_BODY_PARTS find toLowerANSI _bodyPart;

// Get attributes for the used IV
private _defaultConfig = configFile >> QUOTE(ADDON) >> "IV";
<<<<<<< HEAD
private _ivConfig = _defaultConfig >> _classname;
=======
private _ivConfig = _defaultConfig >> _treatment;
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673

private _volume   = GET_NUMBER(_ivConfig >> "volume",getNumber (_defaultConfig >> "volume"));
private _type     = GET_STRING(_ivConfig >> "type",getText (_defaultConfig >> "type"));
private _rateCoef = GET_NUMBER(_ivConfig >> "rateCoef",getNumber (_defaultConfig >> "rateCoef"));

// Add IV bag to patient's ivBags array
private _ivBags = _patient getVariable [QEGVAR(medical,ivBags), []];
<<<<<<< HEAD
_ivBags pushBack [_volume, _type, _partIndex, _classname, _rateCoef];
=======
_ivBags pushBack [_volume, _type, _partIndex, _treatment, _rateCoef, _item];
>>>>>>> 5285ec4585ab6754993bc5c5f10c5a71e15c9673
_patient setVariable [QEGVAR(medical,ivBags), _ivBags, true];
