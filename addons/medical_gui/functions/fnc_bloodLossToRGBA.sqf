#include "script_component.hpp"
/*
 * Author: ShackTac, SilentSpike
 * Converts a blood loss value into a representative RGBA colour.
 * Blood loss colouring follows a "white, yellow, red" colour scale with 10 steps, Bezier interpolation and Correct lightness gradient.
 * See: https://gka.github.io/palettes
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

[
    [1.00, 1.00, 1.00, 1], // #ffffff
    [1.00, 0.95, 0.63, 1], // #fff1a1
    [1.00, 0.88, 0.46, 1], // #ffe075
    [1.00, 0.80, 0.33, 1], // #ffcb55
    [1.00, 0.72, 0.24, 1], // #ffb73c
    [1.00, 0.63, 0.15, 1], // #ffa127
    [1.00, 0.53, 0.08, 1], // #ff8815
    [1.00, 0.43, 0.02, 1], // #ff6d05
    [1.00, 0.29, 0.00, 1], // #ff4b00
    [1.00, 0.00, 0.00, 1]  // #ff0000
] select _colorInt;
