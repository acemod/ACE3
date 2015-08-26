/*
 * Author: commy2
 * Get the compass direction the wind is blowing from.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Wind cardinal direction <STRING>
 *
 * Public: No
 */
#include "script_component.hpp"

switch (round (windDir / 360 * 16)) do {
    case 1 :  {localize LSTRING(SSW)};
    case 2 :  {localize LSTRING(SW)};
    case 3 :  {localize LSTRING(WSW)};
    case 4 :  {localize LSTRING(W)};
    case 5 :  {localize LSTRING(WNW)};
    case 6 :  {localize LSTRING(NW)};
    case 7 :  {localize LSTRING(NNW)};
    case 8 :  {localize LSTRING(N)};
    case 9 :  {localize LSTRING(NNE)};
    case 10 : {localize LSTRING(NE)};
    case 11 : {localize LSTRING(ENE)};
    case 12 : {localize LSTRING(E)};
    case 13 : {localize LSTRING(ESE)};
    case 14 : {localize LSTRING(SE)};
    case 15 : {localize LSTRING(SSE)};
    default   {localize LSTRING(S)};
};
