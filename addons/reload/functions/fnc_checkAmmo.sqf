#include "script_component.hpp"
/*
 * Author: commy2 and esteldunedain
 * Count the ammo of the currently loaded magazine or count rifle grenades. Play animation and display message.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target. Optional, if not suplied the player counts his personal or static weapon ammo <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, kevin] call ace_reload_fnc_checkAmmo
 *
 * Public: No
 */

#define COUNT_BARS 12

params ["_unit"];

private _target = vehicle _unit;

if (count _this > 1) then {
    _target = _this select 1;
} else {

    // If the unit is on foot, count it's own ammo
    if (_unit == _target) exitWith {};

    // If it's mounted on a movile weapon, count it's own ammo
    if !(_target isKindOf "StaticWeapon") then {
        _target = _unit;
    };
};

if (_unit == _target) then {
    [_unit, "Gear", 1] call EFUNC(common,doGesture);
};

[FUNC(displayAmmo), [_target], 1, 0.1] call CBA_fnc_waitAndExecute;
