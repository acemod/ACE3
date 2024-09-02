#include "..\script_component.hpp"
/*
Author: Kerc, original by www.3commandobrigade.com, edited by johnb43 to be made CSW compatible
Determines whether the player can assemble the weapon
Arguments:
0: weapon component
Return Value:
boolean
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

params ["_tripod", "_weaponComponent"];
private _unit = (call SPE_fnc_findPlayer);
private _canAssemble = false;

if ((alive _unit) && (vehicle _unit == _unit) && (alive _tripod) && (_weaponComponent in (weapons _unit))) then {
    _canAssemble = true;
};

_canAssemble && {CONDITION_NO_CSW(_unit)} // Edited
