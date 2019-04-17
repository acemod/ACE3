#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Handles treatment via surgical kit per frame
 *
 * Arguments:
 * 0: Arguments <ARRAY>
 *  0: Caller <OBJECT>
 *  1: Target <OBJECT>
 * 1: Elapsed Time <NUMBER>
 * 2: Total Time <NUMBER>
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Example:
 * [[bob, kevin], 5, 5] call ace_medical_treatment_fnc_treatmentAdvanced_surgicalKit_onProgress
 *
 * Public: No
 */

params ["_args", "_elapsedTime", "_totalTime"];
_args params ["_caller", "_target"];

private _bandagedWounds = _target getVariable [QEGVAR(medical,bandagedWounds), []];
private _stitchedWounds = _target getVariable [QEGVAR(medical,stitchedWounds), []];

//In case two people stitch up one patient and the last wound has already been closed we can stop already
if (_bandagedWounds isEqualTo []) exitWith { false };

//Has enough time elapsed that we can close another wound?
if (_totalTime - _elapsedTime <= (count _bandagedWounds - 1) * 5) then {
    private _treatedWound = _bandagedWounds deleteAt 0;
    _stitchedWounds pushBack _treatedWound;
    _target setVariable [QEGVAR(medical,bandagedWounds), _bandagedWounds, true];
    _target setVariable [QEGVAR(medical,stitchedWounds), _stitchedWounds, true];
    TRACE_3("stitched",_treatedWound,count _bandagedWounds,count _stitchedWounds);

    // Check if we fixed limping from this treatment
    if ((EGVAR(medical,limping) == 2) && {_target getVariable [QEGVAR(medical,isLimping), false]}) then {
        _treatedWound params ["", "_partN"];
        if (_partN < 4) exitWith {};
        [_target] call EFUNC(medical_engine,setLimping);
    };
};

true
