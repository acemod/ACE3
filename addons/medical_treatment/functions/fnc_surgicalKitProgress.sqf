#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles the surgical kit treatment by periodically closing bandaged wounds.
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *   0: Medic (not used) <OBJECT>
 *   1: Patient <OBJECT>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * Continue Treatment <BOOL>
 *
 * Example:
 * [[objNull, player], 5, 10] call ace_medical_treatment_fnc_surgicalKitProgress
 *
 * Public: No
 */

params ["_args", "_elapsedTime", "_totalTime"];
_args params ["", "_patient"];

private _bandagedWounds = _patient getVariable [QEGVAR(medical,bandagedWounds), []];
private _stitchedWounds = _patient getVariable [QEGVAR(medical,stitchedWounds), []];

// Stop treatment if there are no wounds that can be stitched remaining
if (_bandagedWounds isEqualTo []) exitWith {false};

// Check if enough time has elapsed to stitch another wound
if (_totalTime - _elapsedTime <= (count _bandagedWounds - 1) * 5) then {
    _stitchedWounds pushBack (_bandagedWounds deleteAt 0);
    _patient setVariable [QEGVAR(medical,bandagedWounds), _bandagedWounds, true];
    _patient setVariable [QEGVAR(medical,stitchedWounds), _stitchedWounds, true];
};

true
