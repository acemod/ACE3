/*
 * Author: Norrin, Rocko, Ruthberg
 *
 * Handles HuntIR projectiles
 *
 * Arguments:
 * 0: unit - Object the event handler is assigned to <OBJECT>
 * 1: weapon - Fired weapon <STRING>
 * 2: muzzle - Muzzle that was used <STRING>
 * 3: mode - Current mode of the fired weapon <STRING>
 * 4: ammo - Ammo used <STRING>
 * 5: magazine - magazine name which was used <STRING>
 * 6: projectile - Object of the projectile that was shot <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_7(_unit,_weapon,_muzzle,_mode,_ammo,_magazine,_projectile);

if (_ammo != "F_HuntIR") exitWith {};

private ["_dir", "_pos", "_dirDegree", "_b", "_a", "_y", "_x"];
_dir = ACE_player weaponDirection _weapon;
_pos = getPosATL ACE_player;

_dirDegree = (_dir select 0) atan2 (_dir select 1);
_b = 500 / (tan((asin(_dir select 2)) + 10));
_a = _b * sin(_dirDegree);
_b = _a / tan(_dirDegree);
_x = (_pos select 0) + _a;
_y = (_pos select 1) + _b;

[{
    PARAMS_3(_projectile,_x,_y);
    "ACE_HuntIR_Propell" createVehicle (getPosATL _projectile);
    [{
        PARAMS_3(_x,_y,_z);
        private ["_huntir"];
        _huntir = createVehicle ["ACE_HuntIR",  [_x, _y, _z], [], 0, "FLY"];
        _huntir setPosATL [_x, _y, _z];
    }, [_x, _y, ((getPosATL _projectile) select 2) + 400], 5, 0] call EFUNC(common,waitAndExecute);
}, [_projectile, _x, _y], 5, 0] call EFUNC(common,waitAndExecute);
