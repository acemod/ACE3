#include "..\script_component.hpp"
/*
 * Author: commy2, esteldunedain
 * Play animation and display message.
 *
 * Arguments:
 * 0: Unit equipped with the weapon <OBJECT>
 * 1: Unit wanting to check the ammo <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_reload_fnc_checkAmmo
 *
 * Public: No
 */

params ["_target", "_unit"];

if (_unit == _target) then {
    if ((vehicle _target) isKindOf "StaticWeapon") then {
        _target = vehicle _target;
    };

    [_unit, "Gear", 1] call EFUNC(common,doGesture);
};

[FUNC(displayAmmo), _target, 1] call CBA_fnc_waitAndExecute;
