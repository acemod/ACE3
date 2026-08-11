#include "..\script_component.hpp"
/*
 * Author: commy2
 * Server: Recives a dummy logic, sends marker data back to the owner.
 *
 * Arguments:
 * 0: Client ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [6] call ace_markers_fnc_sendMarkersJIP;
 *
 * Public: No
 */

params ["_owner"];
TRACE_1("params",_owner);

[
    QGVAR(setMarkerJIP),
    [GETGVAR(allMapMarkers,[]), GETGVAR(allMapMarkersProperties,[])],
    _owner
] call CBA_fnc_ownerEvent;
