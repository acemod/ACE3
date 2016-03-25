/*
 * Author: SzwedzikPL
 * Checks changes on map since last open and sends difference to server
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

private _assignedMap = ACE_player call FUNC(getAssignedMap);
if (_assignedMap == "") exitWith {};

//can't update markers data if map is not unique
if (!(_assignedMap call FUNC(isUniqueMap))) exitWith {};

//find any deleted markers
private _deletedMarkers = [];
{
    if (!(_x in allMapMarkers)) then {
        _deletedMarkers pushBack _x;
        private _markerIndex = GVAR(currentMapMarkers) find _x;
        if (_markerIndex >= 0) then {
            GVAR(currentMapMarkers) deleteAt _markerIndex;
            GVAR(currentMapMarkersProperties) deleteAt _markerIndex;
        };
    };
} forEach +GVAR(currentMapMarkers);

if (count GVAR(newMapMarkers) > 0 || {count _deletedMarkers > 0}) then {
    //update markers data on server
    [QGVAR(updateMapData), [_assignedMap, [GVAR(newMapMarkers), _deletedMarkers]]] call EFUNC(common,serverEvent);
};

GVAR(newMapMarkers) = [];
