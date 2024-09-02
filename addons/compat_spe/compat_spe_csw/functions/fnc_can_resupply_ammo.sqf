#include "..\script_component.hpp"
/*
Author: Kerc, original by www.3commandobrigade.com
Check if resupply of ammo to a static weapon is available
Arguments:
0: static weapon platform
1: default magazine to load [optional]
Return Value:
boolean
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////
params ["_weaponPlatform",["_defaultMag",""]];
private _unit = (call SPE_fnc_findPlayer);
private _canResupply = false;

if ((alive _unit) && (alive _weaponPlatform) && (vehicle _unit == _unit || vehicle _unit == _weaponPlatform)) then {

    // Limit the reload capacity of a static weapon to 1 magazines
    if ((count (_weaponPlatform magazinesTurret [[0],false])) isEqualTo 0) then {
        _canResupply = true;
    };
};

_canResupply && {CONDITION_NO_CSW(_weaponPlatform)} // Edited
