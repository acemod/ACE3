#include "script_component.hpp"
/*
 * Author: Ir0n1E and mjc4wilton
 * Swap primary weapon and weapon in gunbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, target] call ace_gunbag_fnc_swapGunbag
 *
 * Public: No
 */

params ["_unit", "_target"];

private _gunbag = backpackContainer _target;

_unit call EFUNC(common,goKneeling);

// play sound
if (["ace_backpacks"] call EFUNC(common,isModLoaded)) then {
    [_target, _gunbag] call EFUNC(backpacks,backpackOpened);
};

[(PROGRESSBAR_TIME * 1.5), _this, {
    (_this select 0) call FUNC(swapGunbagCallback)
}, {}, LLSTRING(swapGunbag),
{(_this select 0) call FUNC(canInteract) == 2}
] call EFUNC(common,progressBar);
