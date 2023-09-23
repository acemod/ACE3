#include "..\script_component.hpp"
/*
 * Author: Seb
 * Creates a map marker for a created static object but only for sides friendly to the creator side.
 *
 * Arguments:
 * 0: Unit placing <OBJECT>
 * 1: Created fortify object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorObject] call ace_fortify_fnc_createObjectMarker
 *
 * Public: No
 */

params ["_unit", "_object"];
TRACE_2("createObjectMarker",_unit,_object);

// Get Object size and direction
private _bbr = 0 boundingBoxReal _object;
private _p1 = _bbr select 0;
private _p2 = _bbr select 1;
private _maxWidth = abs ((_p2 select 0) - (_p1 select 0));
private _maxLength = abs ((_p2 select 1) - (_p1 select 1));
private _direction = getDir _object;

// Marker name unique to this object
private _markerNameStr = format [QGVAR(marker_%1), hashValue _object];
private _channel = if (GVAR(markObjectsOnMap) == 2) then { 0 } else { 1 };

private _marker = createMarkerLocal [_markerNameStr, _object, _channel, _unit];
TRACE_2("created",_marker,_channel);
_marker setMarkerShapeLocal "RECTANGLE";
_marker setMarkerBrushLocal "SolidFull";
_marker setMarkerSizeLocal [(_maxWidth / 2),(_maxLength / 2)];
_marker setMarkerDirLocal _direction;
_marker setMarkerColor "ColorGrey";
_object setVariable [QGVAR(mapMarker), _marker, false];

_object addEventHandler ["Deleted", {
    params ["_object"];
    private _marker = _object getVariable QGVAR(mapMarker);
    TRACE_2("cleaning up marker",_object,_marker);
    deleteMarker _marker
}];
