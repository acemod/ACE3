#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Toggles the unit's current weapon's light & laser.
 * API for persistent lasers. Doesn't work on AI, as they have their own logic.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon light/laser state <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_common_fnc_setWeaponLightLaserState
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_state", false, [false]]];

if (!local _unit || {!alive _unit} || {!(_unit call FUNC(isPlayer))}) exitWith {};

if !(_unit call CBA_fnc_canUseWeapon) exitWith {};

private _currentWeapon = currentWeapon _unit;

// Exit if unit has no weapon selected
if (_currentWeapon == "") exitWith {};

private _weaponIndex = [_unit, _currentWeapon] call FUNC(getWeaponIndex);

// Ignore binoculars
if (_weaponIndex == -1) exitWith {};

_unit setVariable [QGVAR(laserEnabled_) + str _weaponIndex, _state];

// Turn off light/laser (switching between weapons can leave previous weapon laser on)
action ["GunLightOff", _unit];
action ["IRLaserOff", _unit];

// Light/laser is off, don't need to do anything more
if (!_state) exitWith {};

// Turn laser on next frame (if weapon hasn't changed)
[{
    params ["_unit", "_currentWeapon"];

    private _weaponState = (weaponState _unit) select [0, 3];

    if (_weaponState select 0 != _currentWeapon) exitWith {};

    action ["GunLightOn", _unit];
    action ["IRLaserOn", _unit];

    _unit selectWeapon _weaponState;
}, [_unit, _currentWeapon]] call CBA_fnc_execNextFrame;

nil
