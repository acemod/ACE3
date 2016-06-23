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
if ((_this getVariable [QGVAR(treatmentOverAt), CBA_missionTime]) >= CBA_missionTime) exitWith {};

private _needsBandaging   = ([_this] call EFUNC(medical,getBloodLoss)) > 0;
private _needsMorphine    = (_this getVariable [QEGVAR(medical,pain), 0]) > 0.5;
private _needsEpinephrine = (_this getVariable [QEGVAR(medical,heartRate), 70]) < 40;

switch (true) do {
    case _needsBandaging: {
        private _selection = "";
        [_this, _selection] call EFUNC(medical,treatmentBasic_bandageLocal);
        _this setVariable [QGVAR(treatmentOverAt), CBA_missionTime + 5];
    };
};
