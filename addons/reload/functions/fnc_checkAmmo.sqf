#include "script_component.hpp"
/*
 * Author: commy2 and esteldunedain
 * Count the ammo of the currently loaded magazine or count rifle grenades. Play animation and display message.
 *
 * Arguments:
 * 0: Target. <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_reload_fnc_checkAmmo
 *
 * Public: No
 */

params ["_target", "_player"];

if (_player == _target) then {
    if ((vehicle _target) isKindOf "StaticWeapon") then {
        _target = vehicle _target;
    };
    [_player, "Gear", 1] call EFUNC(common,doGesture);
};

[FUNC(displayAmmo), [_target], 1] call CBA_fnc_waitAndExecute;
