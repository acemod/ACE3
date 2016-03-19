/*
 * Author: SzwedzikPL
 * Loads all post briefing markers and saves them as unique to assigned map
 * Triggered by server on each client 0.5 sec after mission start
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

if (!hasInterface || {!GVAR(enableUniqueMaps)}) exitWith {};

private _assignedMap = ACE_player call FUNC(getAssignedMap);
if (_assignedMap == "") exitWith {};

//can't update markers data if map is not unique
private _mapID = _assignedMap call FUNC(getMapID);
if (_mapID <= 0) exitWith {};

//there are no post briefing markers on map
if (count GVAR(postBriefingMarkers) == 0) exitWith {};

//rewrite briefingMarkers to local markers, delete global copies and save local markers as unique to this map
private _newMapMarkers = [];
{
    _x params ["_marker", "_data"];
    if (_marker in GVAR(postBriefingMarkers)) then {
        if (_marker in allMapMarkers) then {deleteMarker _marker;};

        //use ":brief:" as separator for briefing markers becouse we can find it in case of copy markers action to no copy markers that user already have on his map
        private _markerLocal = createMarkerLocal [format ["%1:brief:%2", _marker, GVAR(currentMapID)], [0,0,0]];
        [_markerLocal, _data] call FUNC(setMarkerLocal);

        //save marker data
        GVAR(currentMapMarkers) pushBack _markerLocal;
        GVAR(currentMapMarkersProperties) pushBack _data;
        _newMapMarkers pushBack [_markerLocal, _data];
    };
} forEach GVAR(briefingMarkers);
GVAR(briefingMarkers) = nil;
GVAR(postBriefingMarkers) = nil;

//save data on server
[QGVAR(updateMapData), [_assignedMap, [_newMapMarkers, []]]] call EFUNC(common,serverEvent);
