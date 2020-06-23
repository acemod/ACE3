#include "script_component.hpp"
/*
 * Author: joko // Jonas
 * Binds Draw EventHandlers to Spectator map.
 *
 * Arguments:
 * 0: Map Handle from a spectator gui <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * _mapCtrl call ace_map_gestures_fnc_initDisplaySpectator
 *
 * Public: No
 */
params ["_mapCtrl"];
TRACE_1("initDisplaySpectator",_mapCtrl);

_mapCtrl ctrlAddEventHandler ["Draw", {
    private _targets = [positionCameraToWorld [0, 0, 0]];

    private _aceSpectatorFocus = missionNamespace getVariable [QEGVAR(spectator,camFocus), objNull];
    if (!isNull _aceSpectatorFocus) then {
        _targets pushback _aceSpectatorFocus;
    };
    private _vanillaSpectatorFocus = uiNamespace getVariable ["RscEGSpectator_focus", objNull];
    if (!isNull _vanillaSpectatorFocus) then {
        _targets pushback _vanillaSpectatorFocus;
    };
    [_this select 0, _targets] call FUNC(drawMapGestures);
}];
