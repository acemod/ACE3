#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Detects and disables third party medical systems.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_medical_engine_fnc_disableThirdParty
 *
 * Public: No
 */

// SOG:PF CDLC revive system
// Pretend revive system was already initialized.
// See: vn_fnc_module_advancedrevive
vn_advanced_revive_started = true;

// Farooq Revive
// Overwrite player initialization.
far_player_init = compileFinal "";
[{!isNil "far_debugging"}, {
    far_isDragging = nil;  // Disable "Drag & Carry animation fix" loop - cannot be killed because spawned while true.
    far_muteRadio = nil;   // Disable initialization hint.
    far_muteACRE = nil;    // Same, but for very old versions.
    far_debugging = false; // Disable adding event handlers to AI in SP.
}, [], 5] call CBA_fnc_waitUntilAndExecute;
