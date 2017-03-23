/*
 * Author: Zakant
 * Handels the progress of the CPR treatment.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *  0: Caller <OBJECT>
 *  1: Target <OBJECT>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * Treatment may continue <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"
params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_caller", "_target"];

// If the patient awakes my mysterious force, no cpr is needed!
if(_target call EFUNC(common,isAwake)) exitWith {false};
if(!(_target getVariable [QEGVAR(medical,inCardiacArrest), false])) exitWith {false};

[_target] call FUNC(calculateBlood); // Calculate blood volume. If their is no pulse, nothing happens!

(alive _target) // CPR may only proceed if the patient is not dead
