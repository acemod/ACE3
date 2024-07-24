#include "..\script_component.hpp"
/*
 * Author: commy2
 * Select the next throwing mode and display message.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Handled <BOOL>
 *
 * Example:
 * call ace_grenades_fnc_nextMode
 *
 * Public: No
 */

// _mode is 0-4, don't overflow
private _mode = (GVAR(currentThrowMode) + 1) % 5;

private _currentThrowable = currentThrowable ACE_player;

// Make sure grenade can be rolled if in roll mode (detonation time has to be >= 1 second and player isn't in a vehicle)
if (
    _mode == 3 &&
    {_currentThrowable isNotEqualTo []} &&
    {
        !isNull objectParent ACE_player ||
        {getNumber (configFile >> "CfgAmmo" >> getText (configFile >> "CfgMagazines" >> _currentThrowable select 0 >> "ammo") >> "explosionTime") < MIN_EXPLOSION_TIME_FOR_ROLL}
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

GVAR(throwModePFEH) call CBA_fnc_removePerFrameHandler;
GVAR(currentThrowMode) = _mode;

// If in rolling mode, check every frame if current throwable is rollable
if (GVAR(currentThrowMode) == 3) then {
    GVAR(currentThrowable) = _currentThrowable;

    GVAR(throwModePFEH) = {
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
        [format [LLSTRING(RollGrenadeDisabled), LLSTRING(NormalThrow)], 2] call EFUNC(common,displayTextStructured);

        GVAR(throwModePFEH) call CBA_fnc_removePerFrameHandler;
        GVAR(currentThrowMode) = 0;
    } call CBA_fnc_addPerFrameHandler;
};

true
