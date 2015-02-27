#include "script_component.hpp"

PARAMS_1(_target);

_allGear = [[],[]];

{
    //todo: Use 1.40 Append
    _allGear set [0, (_allGear select 0) + (_x select 0)];
    _allGear set [1, (_allGear select 1) + (_x select 1)];
} forEach [(getWeaponCargo _target), (getItemCargo _target), (getMagazineCargo _target), (getBackpackCargo _target)];

_allGear
