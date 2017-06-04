/*
 * Author: SilentSpike
 * Handles integrating the counter respawn template into the spectator UI
 *
 * Should be called from both RscRespawnCounter XEH and spectator init to account for arbitrary order
 *
 * Arguments:
 * 0: RscRespawnCounter <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [GETUVAR(RscRespawnCounter,displayNull)] call ace_spectator_fnc_compat_counter
 *
 * Public: No
 */

#include "script_component.hpp"
#define IDC_COUNTER_TITLE 1001
#define IDC_COUNTER_BACK 1002
#define IDC_COUNTER_TEXT 1003

params ["_display"];

if (isNull _display) exitWith {};

{
    private _ctrl = _display displayCtrl _x;

    (ctrlPosition _ctrl) params ["_xOld","","_w","_h"];

    // Center controls at top middle of screen
    _ctrl ctrlSetPosition [_xOld, safeZoneY, _w, _h];
    _ctrl ctrlCommit 0;
} forEach [IDC_COUNTER_TITLE, IDC_COUNTER_BACK, IDC_COUNTER_TEXT];
