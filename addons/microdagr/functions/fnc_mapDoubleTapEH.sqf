/*
 * Author: PabstMirror
 * Takes some arguments and returns something or other.
 *
 * Arguments:
 * 0: The first argument <STRING>
 * 1: The second argument <OBJECT>
 * 2: Third Optional Argument <BOOL><OPTIONAL>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * _bool = ["something", player] call ace_common_fnc_imanexample
 *
 * Public: Yes
 */
#include "script_component.hpp"

PARAMS_4(_theMap,_mouseButton,_xPos,_yPos);
if (_mouseButton != 0) exitWith {};

_worldPos = _theMap ctrlMapScreenToWorld [_xPos, _yPos];
_worldPos set [2, (getTerrainHeightASL _worldPos)];

GVAR(newWaypointPosition) = _worldPos;
[APP_MODE_MARK] call FUNC(saveCurrentAndSetNewMode);
