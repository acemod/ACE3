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

GVAR(thowModePFEH) call CBA_fnc_removePerFrameHandler;
GVAR(currentThrowMode) = _mode;

if (GVAR(currentThrowMode) == 3) then {
    GVAR(thowModePFEH) = {
        private _currentThrowable = currentThrowable ACE_player;

        if (GVAR(currentThrowable) isEqualTo _currentThrowable) exitWith {};

        GVAR(currentThrowable) = _currentThrowable;

        // Make sure grenade can be rolled if in roll mode (detonation time has to be >= 1 second and player isn't in a vehicle)
        if !(
            GVAR(currentThrowMode) == 3 &&
            {_currentThrowable isNotEqualTo []} &&
            {
                !isNull objectParent ACE_player ||
                {getNumber (configFile >> "CfgAmmo" >> getText (configFile >> "CfgMagazines" >> _currentThrowable select 0 >> "ammo") >> "explosionTime") < MIN_EXPLOSION_TIME_FOR_ROLL}
            }
        ) exitWith {};

        // Force the user into the normal throw mode
        // Next throw mode after roll would be drop, which isn't ideal if the user tries to throw unknowingly...
        [format [LLSTRING(RollGrenadeDisabled), LLSTRING(NormalThrow)], 2.5] call EFUNC(common,displayTextStructured);

        GVAR(thowModePFEH) call CBA_fnc_removePerFrameHandler;
        GVAR(currentThrowMode) = 0;
    } call CBA_fnc_addPerFrameHandler;
};

true
