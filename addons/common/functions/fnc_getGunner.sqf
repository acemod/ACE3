/*
 * Author: commy2
 * Returns gunner using specified weapon type in vehicle. Only works if all turrets have different weapons.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * Gunner <OBJECT>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_vehicle", "_weapon"];

// on foot
if (gunner _vehicle == _vehicle && {_weapon in weapons _vehicle || {toLower _weapon in ["throw", "put"]}}) exitWith {gunner _vehicle};

// inside vehicle
private "_gunner";
_gunner = objNull;

{
    if (_weapon in (_vehicle weaponsTurret _x)) exitWith {
        _gunner = _vehicle turretUnit _x;
    };
} count allTurrets [_vehicle, true];

// ensure that at least the pilot is returned if there is no gunner
if (isManualFire _vehicle && {isNull _gunner}) then {
  _gunner = driver _vehicle;
};

_gunner
