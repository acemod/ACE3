/*
 * Author: PabstMirror
 * Tests if the dagr can be shown in a mode
 *
 * Arguments:
 * The display mode to test showing <NUMBER>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [] call ace_microdagr_fnc_canShow
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_showType);

//Can always do closed or hidden
if (_showType in [DISPLAY_MODE_CLOSED, DISPLAY_MODE_HIDDEN]) exitWith {true};

//Can't interact then hide gps:   TODO: any exceptions?
if (!([ACE_player, objNull, []] call EGVAR(common,canInteractWith))) exitWith {false};

 //Can't have minimap up while zoomed in
if ((_showType == DISPLAY_MODE_DISPLAY) && {cameraview == "GUNNER"}) exitWith {false};

true
