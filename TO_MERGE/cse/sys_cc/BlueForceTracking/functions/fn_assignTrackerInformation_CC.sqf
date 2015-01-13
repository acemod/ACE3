/*
	fnc_assignTrackerInfo.sqf
	Usage: Assigns tracker info for the BFT
	Author: Glowbal

	Arguments: array [logic (OBJECT)]
	Returns: void

	Affects: All localities
	Executes: All Localities

*/

_logic = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (!isNull _logic) then {

	_type = _logic getvariable ["type","Infantry"];
	_callsign = _logic getvariable ["callSign",""];
    _objects = synchronizedObjects _logic;
    {
    	_x setvariable ["cse_bft_info_cc",[_type,_callsign,true,false]];
	}foreach _objects;
 };

true