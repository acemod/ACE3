/*
Author: Kerc
Wrapper for addmagazineTurret
Arguments:
"_unit","_magName","_ammoCount"
Return Value:
boolean
*/

params ["_vehicle","_magName","_turret","_ammoCount"];

private _magazines = _vehicle magazinesTurret [[0],true];
{
    _vehicle removeMagazineTurret [_x,[0]]
} forEach _magazines;
_vehicle addMagazineTurret [_magName,_turret,_ammocount];
private _weapon = (_vehicle weaponsTurret _turret)#0;
_vehicle loadMagazine [_turret, _weapon, _magName];
