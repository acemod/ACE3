#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Binds Draw EventHandlers to Spectator map.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display] call ace_map_gestures_fnc_initDisplayCurator
 *
 * Public: No
 */
params ["_display"];

private _mapCtrl = _display displayCtrl 50;

_mapCtrl ctrlAddEventHandler ["Draw", {
    private _targets = [positionCameraToWorld [0, 0, 0]];
    if !(isNull EGVAR(spectator,camFocus)) then {
        _targets pushback EGVAR(spectator,camFocus);
    };
    [_this select 0, _targets] call FUNC(drawMapGestures)
}];
