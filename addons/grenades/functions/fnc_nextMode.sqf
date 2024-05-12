#include "..\script_component.hpp"
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

// Skip rolling if throwable can't be rolled (detonation time has to be >= 1 second)
if (
    _mode == 3 &&
    {GVAR(currentThrowable) select 0 != ""} &&
    {getNumber (configFile >> "CfgAmmo" >> getText (configFile >> "CfgMagazines" >> GVAR(currentThrowable) select 0 >> "ammo") >> "explosionTime") < MIN_EXPLOSION_TIME_FOR_ROLL}
) then {
    _mode = _mode + 1;
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
