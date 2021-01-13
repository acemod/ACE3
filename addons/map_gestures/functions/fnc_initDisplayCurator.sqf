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
 * _mapCtrl call ace_map_gestures_fnc_initDisplayCurator
 *
 * Public: No
 */
params ["_mapCtrl"];
TRACE_1("initDisplayCurator",_mapCtrl);

_mapCtrl ctrlAddEventHandler ["Draw", {
    if (!GVAR(allowCurator)) exitWith {};
    [_this select 0, [[ACE_player, GVAR(maxRange)], [positionCameraToWorld [0, 0, 0], GVAR(maxRangeCamera)]]] call FUNC(drawMapGestures);
}];
