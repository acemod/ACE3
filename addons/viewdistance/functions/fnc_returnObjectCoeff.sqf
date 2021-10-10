#include "script_component.hpp"
/*
 * Author: Winter
 * Returns the object view distance coefficient according to the given index
 *
 * Arguments:
 * 0: Object View Distance setting Index <NUMBER>
 *
 * Return Value:
 * Object View Distance <NUMBER>
 *
 * Example:
 * [2] call ace_viewdistance_fnc_returnObjectCoeff;
 *
 * Public: No
 */

params ["_index"];

switch (_index) do {
    case 0: {0.00}; // Off
    case 1: {0.20}; // Very Low
    case 2: {0.40}; // Low
    case 3: {0.60}; // Medium
    case 4: {0.80}; // High
    case 5: {1.00}; // Very High
    case 6: {"fov"}; // FoV Based
    default {0.50}; // something broke if this returns
};
