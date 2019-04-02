#include "script_component.hpp"
/*
 * Author: Ir0n1E
 * Put weapon into gunbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, target] call ace_gunbag_fnc_toGunbag
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

[PROGRESSBAR_TIME, _this, {
    (_this select 0) call FUNC(toGunbagCallback)
}, {}, localize LSTRING(toGunbag), {
    (_this select 0) call FUNC(canInteract) == 0
}] call EFUNC(common,progressBar);
