#include "script_component.hpp"

["ace_firedNonPlayer", {
    params ["", "", "", "", "", "", "_projectile"];
    private _willDrop = (random 1) > GVAR(weaponDropChance);
    if (!_willDrop) exitWith {};
    _projectile addEventHandler ["HitPart", { 
        params ["_projectile", "_hitEntity", "_projectileOwner", "_pos", "_velocity", "_normal", "_components", "_radius" ,"_surfaceType"];
        [_surfaceType, _components, _pos] call FUNC(checkWeaponDrop);
    }];
}] call CBA_fnc_addEventHandler;

["ace_firedPlayer", {
    params ["", "", "", "", "", "", "_projectile"];
    private _willDrop = (random 1) > GVAR(weaponDropChance);
    if (!_willDrop) exitWith {};
    _projectile addEventHandler ["HitPart", { 
        params ["_projectile", "_hitEntity", "_projectileOwner", "_pos", "_velocity", "_normal", "_components", "_radius" ,"_surfaceType"];
        [_surfaceType, _components, _pos] call FUNC(checkWeaponDrop);
    }];
}] call CBA_fnc_addEventHandler;
