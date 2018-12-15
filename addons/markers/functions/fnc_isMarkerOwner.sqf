#include "script_component.hpp"
/*
 * Author: McDiod
 * Checks whether player created the passed marker.
 *
 * Arguments:
 * 0: Marker <String>
 *
 * Return Value:
 * Whether the player created the marker. <BOOL>
 *
 * Example:
 * [_marker] call ace_markers_fnc_isMarkerOwner
 *
 * Public: No
 */

params [["_marker",""]];

// user has never created a marker
if (isNil QGVAR(directPlayID)) exitWith {false};

if !((_marker find "_USER_DEFINED") isEqualTo 0) exitWith {false};

private _markerData = (_marker splitString " ") param [1,""];
private _ownerDirectPlayID = (_markerData splitString "/") param [0,""];

if (_ownerDirectPlayID == "") exitWith {false};

_ownerDirectPlayID == GVAR(directPlayID)
