#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Makes the unit heal itself.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_medical_ai_fnc_healSelf
 *
 * Public: No
 */

// Player will have to do this manually of course
if ([_this] call EFUNC(common,isPlayer)) exitWith {};
// Can't heal self when unconscious
if (_this getVariable ["ACE_isUnconscious", false]) exitWith {};
// Check if we're still treating
if ((_this getVariable [QGVAR(treatmentOverAt), CBA_missionTime]) > CBA_missionTime) exitWith {};

private _needsBandaging = ([_this] call EFUNC(medical,getBloodLoss)) > 0;
private _needsMorphine  = (_this getVariable [QEGVAR(medical,pain), 0]) > 0.2;

switch (true) do {
    case _needsBandaging: {
        // Select first wound and bandage it
        private _openWounds = _this getVariable [QEGVAR(medical,openWounds), []];
        private _partIndex = {
            _x params ["", "", "_index", "_amount", "_percentage"];
            if (_amount * _percentage > 0) exitWith {
                _index
            };
        } forEach _openWounds;
        private _selection = ["head","body","hand_l","hand_r","leg_l","leg_r"] select _partIndex;
        [_this, "Bandage", _selection] call EFUNC(medical,treatmentAdvanced_bandageLocal);

        #ifdef DEBUG_MODE_FULL
            systemChat format ["%1 is bandaging selection %2", _this, _selection];
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
            systemChat format ["%1 is giving himself morphine", _this];
        #endif
    };
};
