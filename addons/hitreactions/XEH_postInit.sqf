#include "script_component.hpp"

["ace_firedNonPlayer", {
    params ["", "", "", "", "", "", "_projectile"];
    _projectile addEventHandler ["HitPart", { 
        params ["_projectile", "_hitEntity", "_projectileOwner", "_pos", "_velocity", "_normal", "_components", "_radius" ,"_surfaceType"];
        [_surfaceType, _components, _position] call FUNC(checkWeaponDrop);
    }];
}] call CBA_fnc_addEventHandler;

["ace_firedPlayer", {
    params ["", "", "", "", "", "", "_projectile"];
    _projectile addEventHandler ["HitPart", { 
        params ["_projectile", "_hitEntity", "_projectileOwner", "_pos", "_velocity", "_normal", "_components", "_radius" ,"_surfaceType"];
        [_surfaceType, _components, _position] call FUNC(checkWeaponDrop);
    }];
}] call CBA_fnc_addEventHandler;
