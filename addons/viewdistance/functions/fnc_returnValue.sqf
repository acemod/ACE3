/*
 * Author: Winter
 * Returns the view distance value according to the given index
 * 
 *
 * Arguments:
 * 0: View Distance Index <SCALAR>
 *
 * Return Value:
 * View Distance <SCALAR>
 *
 * Example:
 * [2] call ace_viewdistance_fnc_returnViewDistanceValue;
 *
 * Public: Yes
 */

#include "script_component.hpp"

PARAMS_1(_index);

private ["_return"];

_return = switch (_index) do {
    case 0:   {1500};
    case 1:   {2000};
    case 2:   {2500};
    case 3:   {3000};
    case 4:   {3500};
    case 5:   {4000};
    case 6:   {5000};
    case 7:   {6000};
    case 8:   {7000};
    case 9:   {8000};
    case 10:  {9000};
    case 11:  {10000};
    default   {1000};
};

_return;