/*
 * Author: BaerMitUmlaut
 * Handles treatment via surgical kit per frame.
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_args", "_target", "_caller", "_elapsedTime", "_totalTime", "_bandagedWounds"];
_args = _this select 0;
_caller = _args select 0;
_target = _args select 1;
_elapsedTime = _this select 1;
_totalTime = _this select 2;

_bandagedWounds = _target getVariable [QGVAR(bandagedWounds), []];

//In case two people stitch up one patient and the last wound has already been closed we can stop already
if (count _bandagedWounds == 0) exitWith {false};

//Has enough time elapsed that we can close another wound?
if ((_totalTime - _elapsedTime) <= (((count _bandagedWounds) - 1) * 5)) then {
	_bandagedWounds deleteAt 0;
	_target setVariable [QGVAR(bandagedWounds), _bandagedWounds, true];
};

true