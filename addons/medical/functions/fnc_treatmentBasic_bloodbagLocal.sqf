/*
 * Author: KoffeinFlummi
 * Local callback when the bloodbag treatment is complete
 *
 * Arguments:
 * 0: The patient <OBJECT>
 * 1: Treatment Classname <STRING>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"
#define BLOODBAGHEAL 70

params ["_target", "_treatmentClassname"];

private ["_blood", "_bloodAdded"];

_bloodAdded = switch (true) do {
    case (_treatmentClassname == "BloodIV_250"): {0.25 * BLOODBAGHEAL};
    case (_treatmentClassname == "BloodIV_500"): {0.5 * BLOODBAGHEAL};
    default {BLOODBAGHEAL};
};

_blood = ((_target getVariable [QGVAR(bloodVolume), 100]) + _bloodAdded) min 100;
_target setVariable [QGVAR(bloodVolume), _blood, true];
