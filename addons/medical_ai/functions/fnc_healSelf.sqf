/*
 * Author: BaerMitUmlaut
 * Makes the unit heal itself.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

// Can't heal self when unconscious
if (_this getVariable ["ACE_isUnconscious", false]) exitWith {};
// Check if we're still treating
if ((_this getVariable [QGVAR(treatmentOverAt), CBA_missionTime]) > CBA_missionTime) exitWith {};

private _needsBandaging   = ([_this] call EFUNC(medical,getBloodLoss)) > 0;
private _needsMorphine    = (_this getVariable [QEGVAR(medical,pain), 0]) > 0.2;
// Advanced only?
// private _needsEpinephrine = (_this getVariable [QEGVAR(medical,heartRate), 70]) < 40;

switch (true) do {
    case _needsBandaging: {
        // Find injured body part and bandage it
        private _bodyPartStatus = _this getVariable [QEGVAR(medical,bodyPartStatus), [0,0,0,0,0,0]];
        private _partIndex = {
            if (_x > 0) exitWith {_forEachIndex};
        } forEach _bodyPartStatus;
        private _selection = ["head","body","hand_l","hand_r","leg_l","leg_r"] select _partIndex;
        [_this, _selection] call EFUNC(medical,treatmentBasic_bandageLocal);

        #ifdef DEBUG_MODE_FULL
            systemChat systemChat format ["%1 is bandaging selection %2", _this, _selection];
        #endif

        // Play animation
        [_this, true, true] call FUNC(playTreatmentAnim);
        _this setVariable [QGVAR(treatmentOverAt), CBA_missionTime + 5];
    };
    case _needsMorphine: {
        [_this] call EFUNC(medical,treatmentBasic_morphineLocal);
        [_this, false, true] call FUNC(playTreatmentAnim);
        _this setVariable [QGVAR(treatmentOverAt), CBA_missionTime + 2];

        #ifdef DEBUG_MODE_FULL
            systemChat systemChat format ["%1 is giving himself morphine", _this];
        #endif
    };
};
