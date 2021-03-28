#include "script_component.hpp"
/*
 * Author: commy2
 * Select the next throwing mode and display message.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Handeled <BOOL>
 *
 * Example:
 * [] call ace_grenades_fnc_nextMode
 *
 * Public: No
 */

private _mode = missionNamespace getVariable [QGVAR(currentThrowMode), 0];

if (_mode == 4) then {
    _mode = 0;
} else {
    _mode = _mode + 1;
};

// ROLL GRENADE DOESN'T WORK RIGHT NOW
if (_mode == 3) then {
    _mode = 4;
};

private _hint = localize ([
    LSTRING(NormalThrow),
    LSTRING(HighThrow),
    LSTRING(PreciseThrow),
    LSTRING(RollGrenade),
    LSTRING(DropGrenade)  
] select _mode);

[_hint] call EFUNC(common,displayTextStructured);

GVAR(currentThrowMode) = _mode;

true
