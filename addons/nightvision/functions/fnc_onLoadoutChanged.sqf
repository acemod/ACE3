#include "script_component.hpp"
/*
 * Author: Dslyecxi, PabstMirror
 * Refreshes nvg effect if switching NVG goggles.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_nightvision_fnc_onLoadoutChange
 *
 * Public: No
 */

params ["_player"];
TRACE_1("onLoadoutChange",_player);

private _newHMD = hmd _player;
if (_newHMD != GVAR(playerHMD)) then {
    GVAR(playerHMD) = _newHMD;
    [] call FUNC(refreshGoggleType);
};
