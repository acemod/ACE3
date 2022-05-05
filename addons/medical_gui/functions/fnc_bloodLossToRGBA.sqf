#include "script_component.hpp"
/*
 * Author: ShackTac, SilentSpike
 * Converts a blood loss value into a representative RGBA colour.
 *
 * Arguments:
 * 0: The blood loss value (range [0,1]) <NUMBER>
 *
 * Return Value:
 * Representative RGBA colour <ARRAY>
 *
 * Example:
 * [0.4] call ace_medical_gui_fnc_bloodLossToRGBA
 *
 * Public: No
 */

params ["_bloodLoss"];

private _frBL = 0 max (_bloodLoss / BLOOD_LOSS_RED_THRESHOLD) min 1;
private _colorInt = ceil (_frBL * (BLOOD_LOSS_TOTAL_COLORS - 1));

missionNamespace getVariable format ["%1_%2", QGVAR(bloodLossColor), _colorInt]
