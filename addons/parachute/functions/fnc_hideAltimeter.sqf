/*
	Name: ACE_Parachute_fnc_hideAltimeter

	Author: Garth de Wet (LH)

	Description:
		Removes the altimeter from the screen.

	Parameters:

	Returns:
		Nothing

	Example:
		call ACE_Parachute_fnc_hideAltimeter
*/
#include "script_component.hpp"
terminate ACE_Parachute_AltimeterFnc;
(["ACE_Altimeter"] call BIS_fnc_rscLayer) cutText ["","PLAIN",0,true];
