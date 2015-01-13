/**
 * fn_getALiVECivData_AIM.sqf
 * Descr: Get the ALiVE Civ data from a Civilian unit
 * Author: Glowbal
 *
 * Arguments: [unit OBJECT (Civilian unit to pull the data from.)]
 * Return: ARRAY Civlian Data if system is enabled. Otherwise returns empty array.
 * PublicAPI: true
 */


private ["_unit","_civData"];
_unit = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_Param;
if ([] call cse_fnc_isLoaded_ALiVE_Mod) then {
	//_civData = ["server","CSE_GET_AGENT_DATA_ALIVE_AIM",[[_unit],{call ALIVE_fnc_getAgentData}]] call ALiVE_fnc_BUS_RetVal;
	_civData = [_unit] call ALIVE_fnc_getAgentData; // format: [ int POSTURE, array POSITION (HOME Postion), array TOWN Position, int Home town Posture]
} else {
	_civData = [];
};
_civData