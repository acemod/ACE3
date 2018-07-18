/*
 * Author: commy2
 * Server: Recives a dummy logic, sends marker data back to the owner.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [onUnloadEvent] call ace_markers_fnc_sendMarkerJIP;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_owner"];
TRACE_1("params",_owner);

[
    QGVAR(setMarkerJIP),
    [GETGVAR(allMapMarkers,[]), GETGVAR(allMapMarkersProperties,[])],
    _owner
] call CBA_fnc_ownerEvent;
