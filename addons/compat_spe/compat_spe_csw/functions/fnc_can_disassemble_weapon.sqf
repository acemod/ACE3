#include "..\script_component.hpp"
/*
Author: Kerc, original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
Check if weapon can be disassembled
Arguments:
0: static weapon platform
Return Value:
boolean
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

params ["_weaponPlatform"];
private _unit = (call SPE_fnc_findPlayer);
private _canDisassemble = false;

if ((alive _unit) && (vehicle _unit == _unit) && (alive _weaponPlatform) && ((count (crew _weaponPlatform)) < 1 ) && (weaponDisassemblyEnabled _unit && weaponDisassemblyEnabled _weaponPlatform) && (!(_weaponPlatform lockedTurret [0]))) then {
    _canDisassemble = true;
};

_canDisassemble && {CONDITION_NO_CSW(_unit)} // Edited
