#include "script_component.hpp"
/*
 * Author: Kingsley
 * Reminds about lowered volume.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_volume_fnc_remind
 *
 * Public: No
 */

// Exit if reminder not enabled or not lowered
if (!XGVAR(remindIfLowered) || {!GVAR(isLowered)}) exitWith {};

[LLSTRING(LoweredReminder)] call EFUNC(common,displayTextStructured);

// Fire another reminder in 60s
[FUNC(remind), [], REMINDER_DELAY] call CBA_fnc_waitAndExecute;
