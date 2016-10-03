/*
 * Author: Alexus, Zabuza, SzwedzikPL, Sargken
 * GAU-8 muzzle effect.
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 * 3: Muzzle <STRING>
 * 4: Ammo <STRING>
 * 5: Magazine <STRING>
 * 6: Projectile <OBJECT>
 *
 * Return value:
 * None
 *
 * Example:
 * [unit, "weapon", "muzzle", "ammo", "magazine", projectile] call ace_aircraft_fnc_gau8_muzzleEffect;
 *
 * Public: No
 */
#include "script_component.hpp"

private _weapon = _this select 1;
private _projectile = _this select 6;

if (_weapon != "Gatling_30mm_Plane_CAS_01_F") exitWith {};

for "_i" from 1 to 8 do {
    drop [
        ["\A3\data_f\ParticleEffects\Universal\Universal", 16, 12, 8], "", "Billboard", 1, 10, [0, 0, 0],
        [-1.5+random 2.5,1+_i,-1.5 + random 2.5], 1, 1, 0.80, 0.08, [_i,10,13 + random 1],
        [[0.9, 0.9, 0.9, 0.1 + random 0.07],[1, 1, 1, 0]],
        [2,0.7,0.5],
        1,
        0,
        "",
        "",
        _projectile
    ];
    _i = _i + 1;
};
