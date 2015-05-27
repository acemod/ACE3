/*
 * Author: commy2
 * Select the next throwing mode and display message.
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Handeled <BOOL>
 *
 * Example:
 * [] call ace_grenades_fnc_nextMode
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_mode", "_hint"];

_mode = missionNamespace getVariable [QGVAR(currentThrowMode), 0];

if (_mode == 4) then {
    _mode = 0;
} else {
    _mode = _mode + 1;
};

// ROLL GRENADE DOESN'T WORK RIGHT NOW
if (_mode == 3) then {
    _mode = 4;
};

_hint = [
localize STRING(NormalThrow),
localize STRING(HighThrow),
localize STRING(PreciseThrow),
localize STRING(RollGrenade),
localize STRING(DropGrenade)
] select _mode;

[_hint] call EFUNC(common,displayTextStructured);

GVAR(currentThrowMode) = _mode;

true
