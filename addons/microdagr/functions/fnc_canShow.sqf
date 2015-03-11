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

PARAMS_1(_showType);

//Can always do closed or hidden
if (_showType in [DISPLAY_MODE_CLOSED, DISPLAY_MODE_HIDDEN]) exitWith {true};

//Can't interact then hide gps:   TODO: any exceptions?
if (!([] call EGVAR(common,canInteract))) exitWith {false};

 //Can't have minimap up while zoomed in
if ((_showType == DISPLAY_MODE_DISPLAY) && {cameraview == "GUNNER"}) exitWith {false};

true
