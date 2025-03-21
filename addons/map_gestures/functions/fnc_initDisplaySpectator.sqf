#include "..\script_component.hpp"
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
    if (!GVAR(allowSpectator)) exitWith {};
    private _targets = [[positionCameraToWorld [0, 0, 0], GVAR(maxRangeCamera)]];

    private _aceSpectatorFocus = missionNamespace getVariable [QEGVAR(spectator,camFocus), objNull];
    if (!isNull _aceSpectatorFocus) then {
        _targets pushBack [_aceSpectatorFocus, GVAR(maxRange)];
    };
    private _vanillaSpectatorFocus = uiNamespace getVariable ["RscEGSpectator_focus", objNull];
    if (!isNull _vanillaSpectatorFocus) then {
        _targets pushBack [_vanillaSpectatorFocus, GVAR(maxRange)];
    };
    [_this select 0, _targets] call FUNC(drawMapGestures);
}];
