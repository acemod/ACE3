#include "script_component.hpp"
/*
 * Author: Dextro
 * Add FOB to Array.
 *
 * Arguments:
 * 0: VEHICLE <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_entity] call ace_fortify_fnc_initFob
 *
 * Public: No
 */

params ["_vehicle"];

if (_vehicle getVariable ["ace_fortify_CTIME",0] > 0) then {
	// Add to FOB array
	ace_fobs pushBackUnique _vehicle;
	publicVariable "ace_fobs";

	// Create Marker
	private _marker = createMarker [str(_vehicle),_vehicle];
	_marker setMarkerType "m_fob";
	_marker setMarkerColor "colorBLUFOR";
};
