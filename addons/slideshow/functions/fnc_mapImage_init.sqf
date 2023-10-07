#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Initializes the map texture display.
 *
 * Arguments:
 * 0: Display <DISPLAY> (default: displayNull)
 * 1: Disply ID <STRING> (default: "")
 *
 * Return Value:
 * None
 *
 * Example:
 * [findDisplay "ace_s_0"] call ace_slideshow_fnc_mapImage_init
 *
 * Public: No
 */

params [["_display", displayNull], ["_displayID", ""]]; // only one of these will be valid
// On primary call from the display's onload we will only have the actual display
if (_displayID == "") then { _displayID = displayUniqueName _display; };
// On the delayed call (due to hash missing) we will only have the displayID
if (isNull _display) then { _display = findDisplay _displayID; };
TRACE_2("mapImage_init",_display,_displayID);

// seems like display can sometimes not exist even though it does
// it won't be updated correctly, seems to depend on resolution, seems to be fixed mostly by the 2nd update run
if (isNull findDisplay _displayID) then { WARNING_1("possible problem with texture %1",_displayID); };

// make sure data exists in hash, there can be a race if server broadcasts texture before client can finish init.sqf
if (isNil QGVAR(mapData) || {!(_displayID in GVAR(mapData))}) exitWith {
    WARNING_1("texture %1 has no data in hash",_displayID);
    if (!isNull (param [0, displayNull])) then { // not a retry, checking using value from _this
        [FUNC(mapImage_init), [displayNull, _displayID], 5] call CBA_fnc_waitAndExecute;
    };
};

(GVAR(mapData) get _displayID) params ["_posCenter", "_scale", "_markers", "_mapType", "_userCode"];
TRACE_4("data",_posCenter,_scale,count _markers,_mapType);

private _map = _display ctrlCreate [_mapType, -1];
_map ctrlSetPosition [0, 0, 1, 1];
_map ctrlCommit 0;
_map ctrlMapSetPosition [];

_map ctrlMapAnimAdd [0, _scale, _posCenter];
ctrlMapAnimCommit _map;

[_map, _display, _displayID] call _userCode;

// add drawEH to draw markers next update (they will get drawn 3 times total)
_map setVariable ["markers", _markers];
_map ctrlAddEventHandler ["draw", {
    params ["_map"];
    private _markers = _map getVariable ["markers", []];
    TRACE_2("drawing markers",_map,count _markers);
    { _map drawIcon _x } forEach _markers;
}];

private _update = {
    private _display = findDisplay _this;
    if (isNull _display) exitWith {};
    TRACE_2("updating",_display,displayUniqueName _display);
    displayUpdate _display;
};
[_update, _displayID] call CBA_fnc_execNextFrame; // update after a frame so the map anim has time to take effect
[_update, _displayID, 2] call CBA_fnc_waitAndExecute; // update a bit later so textures hopefully have time to load
