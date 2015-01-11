/*
 * Author: commy2
 *
 * Get the compass direction the wind is blowing from.
 *
 * Argument:
 * None.
 *
 * Return value:
 * Wind direction. (String)
 */

switch (round (windDir / 360 * 16)) do {
  case 1 :  {localize "STR_GVAR(SSW)"};
  case 2 :  {localize "STR_GVAR(SW)"};
  case 3 :  {localize "STR_GVAR(WSW)"};
  case 4 :  {localize "STR_GVAR(W)"};
  case 5 :  {localize "STR_GVAR(WNW)"};
  case 6 :  {localize "STR_GVAR(NW)"};
  case 7 :  {localize "STR_GVAR(NNW)"};
  case 8 :  {localize "STR_GVAR(N)"};
  case 9 :  {localize "STR_GVAR(NNE)"};
  case 10 : {localize "STR_GVAR(NE)"};
  case 11 : {localize "STR_GVAR(ENE)"};
  case 12 : {localize "STR_GVAR(E)"};
  case 13 : {localize "STR_GVAR(ESE)"};
  case 14 : {localize "STR_GVAR(SE)"};
  case 15 : {localize "STR_GVAR(SSE)"};
  default   {localize "STR_GVAR(S)"};
};
