/*
 * Author: Garth 'L-H' de Wet
 * Removes the altimeter from the screen.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_Parachute_fnc_hideAltimeter
 *
 * Public: No
 */
#include "script_component.hpp"
GVAR(AltimeterActive) = false;
"ACE_Altimeter" cutText ["","PLAIN",0,true];
