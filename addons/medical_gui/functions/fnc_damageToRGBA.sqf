#include "script_component.hpp"
/*
 * Author: ShackTac, SilentSpike
 * Converts a damage value into a representative RGBA colour.
 * Damage colouring follows a "white, cyan, blue" colour scale with 10 steps, Bezier interpolation and Correct lightness gradient.
 * See: https://gka.github.io/palettes
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

[
    [1.00, 1.00, 1.00, 1], // #ffffff
    [0.75, 0.95, 1.00, 1], // #bff2ff
    [0.63, 0.87, 1.00, 1], // #a0ddff
    [0.54, 0.77, 1.00, 1], // #8ac4ff
    [0.48, 0.67, 1.00, 1], // #7aacff
    [0.42, 0.57, 1.00, 1], // #6c91ff
    [0.37, 0.47, 1.00, 1], // #5e77ff
    [0.31, 0.35, 1.00, 1], // #4e5aff
    [0.22, 0.23, 1.00, 1], // #383bff
    [0.00, 0.00, 1.00, 1]  // #0000ff
] select _colorInt
