#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Initilizaes the map texture display
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [findDisplay "ace_s_0"] call ace_slideshow_fnc_mapImage_init
 *
 * Public: No
 */

params ["_display"];
private _displayID = displayUniqueName _display;
TRACE_2("",_display,_displayID);

// seems like display can sometimes not exist even though it does???
// it won't be updated correctly, seems to depend on resolution???
if (isNull findDisplay _displayID) then { WARNING_1("problem with texture %1",_displayID); };

(GVAR(mapData) get displayUniqueName _display) params ["_posCenter", "_scale", "_markers", "_mapType", "_userCode"];
TRACE_4("data",_posCenter,_scale,count _markers,_mapType);

private _map = _display ctrlCreate [_mapType, 1];
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
    systemChat format ["updating %1", _this];
    displayUpdate _display;
};
[_update, _displayID] call CBA_fnc_execNextFrame; // update after a frame so the map anim has time to take effect
[_update, _displayID, 3] call CBA_fnc_waitAndExecute; // update a sec later so textures hopefully have time to load
