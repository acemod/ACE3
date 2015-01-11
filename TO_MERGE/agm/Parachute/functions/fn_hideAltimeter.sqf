/*
	Name: AGM_Parachute_fnc_hideAltimeter
	
	Author: Garth de Wet (LH)
	
	Description:
		Removes the altimeter from the screen.
	
	Parameters: 
	
	Returns:
		Nothing
	
	Example:
		call AGM_Parachute_fnc_hideAltimeter
*/
terminate AGM_Parachute_AltimeterFnc;
(["AGM_Altimeter"] call BIS_fnc_rscLayer) cutText ["","PLAIN",0,true];
