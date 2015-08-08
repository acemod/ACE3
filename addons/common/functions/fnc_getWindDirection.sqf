/*
 * Author: commy2
 *
 * Get the compass direction the wind is blowing from.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Wind direction. (String)
 *
 * Public: No
 */
#include "script_component.hpp"

switch (round (windDir / 360 * 16)) do {
    case 1 :  {localize QUOTE(DOUBLES(STR,GVAR(SSW)))};
    case 2 :  {localize QUOTE(DOUBLES(STR,GVAR(SW)))};
    case 3 :  {localize QUOTE(DOUBLES(STR,GVAR(WSW)))};
    case 4 :  {localize QUOTE(DOUBLES(STR,GVAR(W)))};
    case 5 :  {localize QUOTE(DOUBLES(STR,GVAR(WNW)))};
    case 6 :  {localize QUOTE(DOUBLES(STR,GVAR(NW)))};
    case 7 :  {localize QUOTE(DOUBLES(STR,GVAR(NNW)))};
    case 8 :  {localize QUOTE(DOUBLES(STR,GVAR(N)))};
    case 9 :  {localize QUOTE(DOUBLES(STR,GVAR(NNE)))};
    case 10 : {localize QUOTE(DOUBLES(STR,GVAR(NE)))};
    case 11 : {localize QUOTE(DOUBLES(STR,GVAR(ENE)))};
    case 12 : {localize QUOTE(DOUBLES(STR,GVAR(E)))};
    case 13 : {localize QUOTE(DOUBLES(STR,GVAR(ESE)))};
    case 14 : {localize QUOTE(DOUBLES(STR,GVAR(SE)))};
    case 15 : {localize QUOTE(DOUBLES(STR,GVAR(SSE)))};
    default   {localize QUOTE(DOUBLES(STR,GVAR(S)))};
};
