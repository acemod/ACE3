/*
 * Author: Ir0n1E
 * get weapon out of gunbag
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

private _gunbag = backpackContainer _target;

_unit call EFUNC(common,goKneeling);

// play sound
if (!isNil "ACE_Backpacks") then {
    [_target, _gunbag] call EFUNC(backpacks,backpackOpened);
};

[PROGRESSBAR_TIME, _this, {
    (_this select 0) call FUNC(offGunbagCallback)
}, {}, localize LSTRING(offGunbag), {
    (_this select 0) call FUNC(canInteract) == 1
}] call EFUNC(common,progressBar);
