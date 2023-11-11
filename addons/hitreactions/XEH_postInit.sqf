#include "script_component.hpp"

["ace_firedNonPlayer", {
    private _roll = random 1;
    if !(_roll < GVAR(weaponDropChanceGunHit) || _roll < GVAR(weaponDropChanceArmHit)) exitWith {};
    
    params ["", "", "", "", "", "", "_projectile"];
    
    _projectile addEventHandler ["HitPart", {
        params ["", "", "", "_pos", "", "", "_components", "" ,"_surfaceType"];
        [_surfaceType, _components, _pos] call FUNC(checkWeaponDrop);
    }];
}] call CBA_fnc_addEventHandler;

if (!hasInterface) exitWith {};

["ace_firedPlayer", {
    private _roll = random 1;
    if !(_roll < GVAR(weaponDropChanceGunHit) || _roll < GVAR(weaponDropChanceArmHit)) exitWith {};
    
    params ["", "", "", "", "", "", "_projectile"];
    
    _projectile addEventHandler ["HitPart", { 
       params ["", "", "", "_pos", "", "", "_components", "" ,"_surfaceType"];
        [_surfaceType, _components, _pos] call FUNC(checkWeaponDrop);
    }];
}] call CBA_fnc_addEventHandler;

[QGVAR(dropGun), {
    params ["_unit"];
    private _weapon = currentWeapon _unit;
    private _thrownGun = _unit call EFUNC(common,throwWeapon);
    if (isPlayer _unit) exitWith {}; // Don't make the player pick its own gun up.
    [
        {
            params ["_thrownGun", "_weapon", "_unit"];
            handgunWeapon _unit == "" && primaryWeapon _unit == "" || {(_unit distance (_unit findNearestEnemy _unit)) > GVAR(safePickupDistance)}
        },
        {
            params ["_thrownGun", "_weapon", "_unit"];
            [
                {
                    params ["_thrownGun", "_weapon", "_unit"];
                    _unit action ["TakeWeapon", _thrownGun, _weapon];
                },
                [_thrownGun, _weapon, _unit],
                random [1,2,3]
            ] call CBA_fnc_waitAndExecute;
        },
        [_thrownGun, _weapon, _unit]
    ] call CBA_fnc_waitUntilAndExecute;
}] call CBA_fnc_addEventHandler;
