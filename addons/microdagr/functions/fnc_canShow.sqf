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
 * [mode] call ace_microdagr_fnc_canShow
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_1(_showType);

private ["_returnValue"];

_returnValue = false;

switch (_showType) do {
case (DISPLAY_MODE_CLOSED): {_returnValue = true}; //Can always close
case (DISPLAY_MODE_HIDDEN): {_returnValue = true}; //Can always hide

case (DISPLAY_MODE_DIALOG): {
        _returnValue = ("ACE_microDAGR" in (items ACE_player)) && {[ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)};
    };
case (DISPLAY_MODE_DISPLAY): {
        //Can't have minimap up while zoomed in
        _returnValue = (cameraview != "GUNNER") && {"ACE_microDAGR" in (items ACE_player)} && {[ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)};
    };
};

_returnValue
