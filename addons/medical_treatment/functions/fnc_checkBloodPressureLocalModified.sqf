#include "..\script_component.hpp"
/*
 * Author: Dextro
 * Local callback for checking the blood pressure of a patient.
 *
 * Arguments:
 * 0: Medic <OBJECT>
 * 1: Patient <OBJECT>
 * 2: Body Part <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject, "LeftArm"] call ace_medical_treatment_fnc_checkBloodPressureLocalModified
 *
 * Public: No
 */

params ["_medic", "_patient", "_bodyPart"];

private _bloodVolume = GET_BLOOD_VOLUME(_patient);
private _bloodPressureOutput = format ["%1 is dead",_patient call EFUNC(common,getName)];
private _logOutput = format ["%1 checked Blood: Fatal", _medic call EFUNC(common,getName)];

// When alive proceed
if (alive _patient && _bloodVolume > BLOOD_VOLUME_FATAL) then {
    // Check if medic
     if (_medic call FUNC(isMedic)) then {
         // Advanced diagnosis
         if (_bloodVolume == DEFAULT_BLOOD_VOLUME) then {
                _bloodPressureOutput = format ["%1 has not lost any blood", _patient call EFUNC(common,getName)];
                _logOutput = format ["%1 checked Blood: Normal", _medic call EFUNC(common,getName)];
        } else {
            // Check fatal blood level
            if (_bloodVolume <= BLOOD_VOLUME_FATAL) then {
                _bloodPressureOutput = format ["%1 is dead",_patient call EFUNC(common,getName)];
                _logOutput = format ["%1 checked Blood: Fatal", _medic call EFUNC(common,getName)];
            } else {
                // Check hemorrhage class
                {
                    if (_bloodVolume >= _x) exitWith {
                        _bloodPressureOutput = format ["%1 has Hemorrhage Class %2",_patient call EFUNC(common,getName),_forEachIndex];
                        _logOutput = format ["%1 checked Blood: Hemorrhage Class %2", _medic call EFUNC(common,getName),_forEachIndex];
                    };
                } forEach [BLOOD_VOLUME_CLASS_1_HEMORRHAGE,BLOOD_VOLUME_CLASS_2_HEMORRHAGE,BLOOD_VOLUME_CLASS_3_HEMORRHAGE,BLOOD_VOLUME_CLASS_4_HEMORRHAGE,BLOOD_VOLUME_FATAL];
            };
        };
     } else {
        // Basic diagnosis
        // Has lost some blood
        if (_bloodVolume == DEFAULT_BLOOD_VOLUME) then {
                _bloodPressureOutput = format ["%1 has not lost any blood", _patient call EFUNC(common,getName)];
                _logOutput = format ["%1 checked Blood: Normal", _medic call EFUNC(common,getName)];
        } else {
            // Has lost some blood
            if (_bloodVolume <= BLOOD_VOLUME_CLASS_1_HEMORRHAGE) then {
                _bloodPressureOutput = format ["%1 has lost some blood", _patient call EFUNC(common,getName)];
                _logOutput = format ["%1 checked Blood: Severe", _medic call EFUNC(common,getName)];
                // Has lost a lot of blood
                if (_bloodVolume <= BLOOD_VOLUME_CLASS_2_HEMORRHAGE) then {
                    _bloodPressureOutput = format ["%1 has lost a lot of blood", _patient call EFUNC(common,getName)];
                    _logOutput = format ["%1 checked Blood: Critical", _medic call EFUNC(common,getName)];
                    // Has lost a critical amount of blood
                    /*
                    if (_bloodVolume <= BLOOD_VOLUME_CLASS_3_HEMORRHAGE) then {
                        _bloodPressureOutput = format ["%1 has critical blood loss", _patient call EFUNC(common,getName)];
                        _logOutput = format ["%1 checked Blood: Critical", _medic call EFUNC(common,getName)];
                    };
                    */
                };
            };
        };
    };
};

// Log
[_patient, "quick_view", _logOutput, []] call FUNC(addToLog);
// Message
[QEGVAR(common,displayTextStructured), [_bloodPressureOutput, 1.75, _medic], _medic] call CBA_fnc_targetEvent;
