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

private _mode = GVAR(currentThrowMode);

if (_mode == 4) then {
    _mode = 0;
} else {
    _mode = _mode + 1;
};

// Make sure grenade can be rolled if in roll mode (detonation time has to be >= 1 second and player isn't in a vehicle)
if (
    _mode == 3 &&
    {GVAR(currentThrowable) isNotEqualTo []} &&
    {
        !isNull objectParent ACE_player ||
        {getNumber (configFile >> "CfgAmmo" >> getText (configFile >> "CfgMagazines" >> GVAR(currentThrowable) select 0 >> "ammo") >> "explosionTime") < MIN_EXPLOSION_TIME_FOR_ROLL}
    }
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
