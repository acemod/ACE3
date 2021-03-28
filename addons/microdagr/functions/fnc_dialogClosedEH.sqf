#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Handles the dialog closeing, switches back to display mode
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_microdagr_fnc_dialogClosedEH
 *
 * Public: No
 */

if (GVAR(currentShowMode) == DISPLAY_MODE_DIALOG) then {
    [-1] call FUNC(saveCurrentAndSetNewMode);
    [DISPLAY_MODE_DISPLAY] call FUNC(openDisplay);
};
