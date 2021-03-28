#include "script_component.hpp"
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
 * Example:
 * [] call ace_common_fnc_getWindDirection
 *
 * Public: Yes
 */

localize ([
    LSTRING(S),
    LSTRING(SSW),
    LSTRING(SW),
    LSTRING(WSW),
    LSTRING(W),
    LSTRING(WNW),
    LSTRING(NW),
    LSTRING(NNW),
    LSTRING(N),
    LSTRING(NNE),
    LSTRING(NE),
    LSTRING(ENE),
    LSTRING(E),
    LSTRING(ESE),
    LSTRING(SE),
    LSTRING(SSE),
    LSTRING(S)
] select (round (windDir / 360 * 16))) // return
