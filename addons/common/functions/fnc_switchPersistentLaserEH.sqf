#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Toggles weapon light/laser to match persistent behaviour.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_common_fnc_switchPersistentLaserEH
 *
 * Public: No
 */

params ["_unit"];

if !(_unit call CBA_fnc_canUseWeapon) exitWith {};

// Save current weapon state to reapply later
private _weaponState = (weaponState _unit) select [0, 3];

if (_weaponState select 0 == "") exitWith {};

// Turn off old light/laser
action ["GunLightOff", _unit];
action ["IRLaserOff", _unit];

// Light/laser is off
if !(_unit getVariable [QGVAR(laserEnabled_) + str ([_unit, _weaponState select 0] call EFUNC(common,getWeaponIndex)), false]) exitWith {
    _unit selectWeapon _weaponState;
};

// Turn laser back on next frame (if weapon hasn't changed)
[{
    params ["_unit", "_weaponState"];

    if (currentWeapon _unit != _weaponState select 0) exitWith {};

    action ["GunLightOn", _unit];
    action ["IRLaserOn", _unit];

    _unit selectWeapon _weaponState;
}, [_unit, _weaponState]] call CBA_fnc_execNextFrame;

nil
