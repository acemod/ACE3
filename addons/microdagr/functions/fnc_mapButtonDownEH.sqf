#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles right clicking on the map ('dragging' the map)
 * Release autotrack if enabled.
 *
 * Arguments:
 * 0: The Map <CONTROL>
 * 1: MouseButton <NUMBER>
 * 2: MousePosX <NUMBER>
 * 3: MousePosY <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [minimap,0,0.5,0.5] call ace_microdagr_fnc_mapButtonDownEH
 *
 * Public: No
 */

params ["", "_mouseButton"];

//Only handle RMB
if (_mouseButton != 1) exitWith {};

if (GVAR(mapAutoTrackPosition)) then {
    GVAR(mapAutoTrackPosition) = false;
    [] call FUNC(showApplicationPage);
};
