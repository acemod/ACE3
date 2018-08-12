#include "script_component.hpp"
/*
 * Author: Zakant
 * Handles the progress of the CPR treatment.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Caller <OBJECT>
 *   1: Target <OBJECT>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * May Treatment continue <BOOL>
 *
 * Public: No
 */

params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_caller", "_target"];

// If the patient awakes by mysterious force, no cpr is needed!
if (_target call EFUNC(common,isAwake)) exitWith {false};
if !IN_CRDC_ARRST(_target) exitWith {false};

[_target] call FUNC(calculateBlood); // Calculate blood volume. If their is no pulse, nothing happens!
