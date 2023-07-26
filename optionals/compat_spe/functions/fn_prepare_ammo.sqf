/*
Author: Kerc, original by www.3commandobrigade.com
Prepare ammo for mortars
Arguments:
1: magazine
Return Value:
none
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

params ["_magazine"];
private _unit = (call SPE_fnc_findPlayer);

private _selectedMagazine = (_unit getVariable ["SPE_Static_Weapon_Magazine",""]);
if (_selectedMagazine isEqualTo _magazine) then {_magazine = ""};
_unit setVariable ['SPE_Static_Weapon_Magazine', _magazine];

//(call SPE_fnc_findPlayer) action ["SwitchWeapon", (call SPE_fnc_findPlayer), (call SPE_fnc_findPlayer), 99];
