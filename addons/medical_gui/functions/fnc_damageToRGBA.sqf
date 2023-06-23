#include "script_component.hpp"
/*
 * Author: ShackTac, SilentSpike
 * Converts a damage value into a representative RGBA colour.
 *
 * Arguments:
 * 0: The damage value (range [0,1]) <NUMBER>
 *
 * Return Value:
 * Representative RGBA colour <ARRAY>
 *
 * Example:
 * [0.4] call ace_medical_gui_fnc_damageToRGBA
 *
 * Public: No
 */

params ["_damage"];

private _frD = 0 max (_damage / DAMAGE_BLUE_THRESHOLD) min 1;
private _colorInt = ceil (_frD * (DAMAGE_TOTAL_COLORS - 1));

missionNamespace getVariable format ["%1_%2", QGVAR(damageColor), _colorInt]
