#include "..\script_component.hpp"
/*
Author: Kerc, original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
Check if resupply of ammo to a static weapon is available
Arguments:
0: static weapon platform
Return Value:
boolean
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

params ["_weaponPlatform", ["_checkForCSW", false, [false]]];
private _unit = (call SPE_fnc_findPlayer);
private _canAlterHeight = false;

if ((alive _unit) && (vehicle _unit == _unit) && (alive _weaponPlatform) && ((count (crew _weaponPlatform)) < 1 ) && (!(_weaponPlatform lockedTurret [0]))) then {
    _canAlterHeight = true;
};

// Part below is edited
if (_checkForCSW) then {
    _canAlterHeight && {!(CONDITION_NO_CSW(_unit))}
} else {
    _canAlterHeight && {CONDITION_NO_CSW(_unit)}
};
