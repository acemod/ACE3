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
	ace_dropzones pushBackUnique _vehicle;
	publicVariable "ace_dropzones";

	// Create Marker
	_name = "DZ" + str (CBA_MissionTime);
	private _marker = createMarker [_name,_vehicle];
	_marker setMarkerType "m_dz";
	_marker setMarkerColor "colorBLUFOR";
};
