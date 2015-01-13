/**
 * fn_isALiVECivilianSystemActive.sqf
 * Descr: Check if the ALiVE Civilian system is active
 * Author: Glowbal
 *
 * Arguments: []
 * Return: BOOL true if ALiVE civilian system is active
 * PublicAPI: true
 */

if ([] call cse_fnc_isLoaded_ALiVE_Mod) then {
	(["server","Subject",[[1],{[] call ALIVE_fnc_isCivilianSystemActive}]] call ALiVE_fnc_BUS)
} else {
	false;
};