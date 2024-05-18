#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Returns if the GPS on the map can be used.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * GPS can be used <BOOL>
 *
 * Example:
 * call ace_maptools_fnc_canUseMapGPS
 *
 * Public: No
 */

if (!visibleMap || {!alive ACE_player}) exitWith {false};

private _assignedGPS = ACE_player getSlotItemName TYPE_GPS;
if (_assignedGPS == "") exitwith { false };

GVAR(gpsDevicesCache) getOrDefaultCall [_assignedGPS, {
    (_assignedGPS call BIS_fnc_itemType) params ["", "_type"];
    _type in ["GPS", "UAVTerminal"]
}, true]
