#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Binds Draw EventHandlers to Zeus map.
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

_mapCtrl ctrlAddEventHandler ["Draw", { [_this select 0, [ACE_player, positionCameraToWorld [0, 0, 0]]] call FUNC(drawMapGestures);}];
