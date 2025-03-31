#include "script_component.hpp"
/*
 * Author: Dextro
 * Add Rally to Array.
 *
 * Arguments:
 * 0: VEHICLE <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_entity] call ace_fortify_fnc_initRally
 *
 * Public: No
 */

params ["_vehicle"];

if (_vehicle getVariable ["ace_fortify_CTIME",0] > 0 && local _vehicle) then {
	// Add to Rally array
	ace_rally pushBackUnique _vehicle;
	publicVariable "ace_rally";

	// Create Marker
	private _marker = createMarker [str(_vehicle),_vehicle];
	_marker setMarkerType "m_rally";
	_marker setMarkerColor "colorBLUFOR";
};