#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Handles logic for units in the "Dazed" state in the medical statemachine.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Returns:
 * None
 *
 * Example:
 * [player] call ace_medical_statemachine_fnc_handleStateDazed
 *
 * Public: No
 */

// possible to Spontaneous wake up
call FUNC(handleStateUnconscious);
