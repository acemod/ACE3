/*
 * Author: PabstMirror
 * Tests if the dagr can be shown in a mode
 *
 * Arguments:
 * The display mode to test showing <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1] call ace_microdagr_fnc_canShow
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_showType"];

private _returnValue = false;

_returnValue = switch (_showType) do {
    case (DISPLAY_MODE_CLOSED): { true }; //Can always close
    case (DISPLAY_MODE_HIDDEN): { true }; //Can always hide
    case (DISPLAY_MODE_DIALOG): {
         ("ACE_microDAGR" in (items ACE_player)) && {[ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)}
    };
    case (DISPLAY_MODE_DISPLAY): {
        //Can't have minimap up while zoomed in on foot, but allow drivers to use while in "Gunner" to handle non-3d vehicles like most tanks
        ((cameraView != "GUNNER") || {(vehicle ACE_player != ACE_player) && {driver vehicle ACE_player == ACE_player}}) &&
        {"ACE_microDAGR" in (items ACE_player)} && 
        {[ACE_player, objNull, ["notOnMap", "isNotInside", "isNotSitting"]] call EFUNC(common,canInteractWith)}
    };
    default { false };
};

_returnValue
