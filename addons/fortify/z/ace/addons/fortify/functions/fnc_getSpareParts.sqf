#include "script_component.hpp"
/*
 * Author: Dextro
 * Get spare vehicle parts.
 *
 * Arguments:
 * 0: OBJECT <OBJECT>
 * 1: Player <OBJECT>
 * 2: Spare <STRING> (default: ACE_Wheel)
 * 3: Info <STRING> (default: "Getting Spare Parts")
 *
 * Return Value:
 *
 * Example:
 * [_target,_player,'wheel'] call ace_fortify_fnc_getSpareParts
 *
 * Public: Yes
 */


params ["_target","_player",["_part","ACE_Wheel"],["_info","Getting Spare Parts"]];

_player playMove "AinvPercMstpSrasWrflDnon_Putdown_AmovPercMstpSrasWrflDnon";

[2, _this, {
	(_this select 0) params ["_target","_player","_part"];
	private _parts = _part createVehicle (position _target);
	[_player, _parts] call ace_dragging_fnc_startCarry;
},{["Canceled", 1.5] call ace_common_fnc_displayTextStructured;}, _info] call ace_common_fnc_progressBar;



