/*
	Name: AGM_Parachute_fnc_onEachFrame
	
	Author: Garth de Wet (LH)
	
	Description:
		Checks if a unit can defuse an explosive
	
	Parameters: 
		0: OBJECT - unit
	
	Returns:
		Nothing
	
	Example:
		call AGM_Parachute_fnc_onEachFrame;
*/
private "_player";
_player = AGM_player;
if (isNull _player) exitWith {["AGM_ParachuteFix", "OnEachFrame"] call BIS_fnc_removeStackedEventHandler;AGM_Parachuting_PFH = false;};
if !((vehicle _player) isKindOf "ParachuteBase") exitWith {};
if (isTouchingGround _player) exitWith {};

private ["_pos", "_intersects"];
_pos = getPosASL (Vehicle _player);

if ((lineIntersects [_pos, _pos vectorAdd [0,0,-0.5], vehicle _player, _player]) || {((ASLtoATL _pos) select 2) < 0.75}) then {
// I believe this will not work for Zeus units.
	deleteVehicle (vehicle _player);
	[_player] call AGM_Parachute_fnc_doLanding;
};
