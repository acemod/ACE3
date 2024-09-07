#include "..\script_component.hpp"
/*
Author: Kerc, edited by johnb43 to be made CSW compatible
Check if weapon can be reloaded
Arguments:
0: static weapon platform
Return Value:
boolean
*/

private _vehicle = _this select 0;
private _unit = (call SPE_fnc_findPlayer);
private _canResupply = false;

if (alive _unit && alive _vehicle && (vehicle _unit == _unit || vehicle _unit == _vehicle)) then
{
    if ((count magazines _vehicle) isEqualTo 0) then
    {
        private _selectedMagazine = toLower (_unit getVariable ["SPE_Static_Weapon_Magazine",""]);
        if !(_selectedMagazine isEqualTo "") then
        {
            private _staticWeapon = (_vehicle weaponsTurret [0]) select 0;
            private _listOfMagNames = (compatibleMagazines _staticWeapon) apply {toLower _x};
            _canResupply = (_selectedMagazine in _listOfMagNames);
        };
    };
};
_canResupply && {CONDITION_NO_CSW(_vehicle)} // Edited
