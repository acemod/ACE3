/*
 * Author: Winter
 * Returns the view distance value according to the given index.
 *
 * Arguments:
 * 0: View Distance Index <NUMBER>
 *
 * Return Value:
 * View Distance <NUMBER>
 *
 * Example:
 * [2] call ace_viewdistance_fnc_returnViewDistanceValue
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_index"];

switch (_index) do {
    case 0: {viewDistance}; // Video Settings option
    case 1: {500};
    case 2: {1000};
    case 3: {1500};
    case 4: {2000};
    case 5: {2500};
    case 6: {3000};
    case 7: {3500};
    case 8: {4000};
    case 9: {5000};
    case 10: {6000};
    case 11: {7000};
    case 12: {8000};
    case 13: {9000};
    case 14: {10000};
    default {1000};
};
