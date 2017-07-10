/*
 * Author: Ruthberg
 * Restores the truing drop defaults
 *
 * Arguments:
 * update display <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_atragmx_fnc_restore_truing_drop
 *
 * Public: No
 */
#include "script_component.hpp"

private _updateDisplay = _this;

GVAR(truingDropMode) = 0;
GVAR(truingDropRangeData) = [0, 0];
GVAR(truingDropDropData) = [0, 0, 0];
GVAR(truingDropReferenceDropData) = [0, 0, 0];
GVAR(truingDropC1) = 0;
GVAR(truingDropMuzzleVelocity) = 0;

// Resets input fields
call FUNC(update_truing_drop_selection);

if (_updateDisplay) then {
    // Repopulates input fields
    false call FUNC(calculate_truing_drop);
};
