/*
 * Author: PabstMirror
 * Handles the double tapping either of the 2 mini-maps
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
 * [minimap,0,0.5,0.5] call ace_microdagr_fnc_mapDoubleTapEH
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_theMap", "_mouseButton", "_xPos", "_yPos"];

//Only handle LMB
if (_mouseButton != 0) exitWith {};

private _worldPos = _theMap ctrlMapScreenToWorld [_xPos, _yPos];
_worldPos pushBack (getTerrainHeightASL _worldPos);

GVAR(newWaypointPosition) = _worldPos;
[APP_MODE_MARK] call FUNC(saveCurrentAndSetNewMode);
