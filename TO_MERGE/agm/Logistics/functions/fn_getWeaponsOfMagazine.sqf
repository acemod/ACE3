// by commy2

private ["_vehicle", "_magazine", "_weapons", "_weaponMagazines", "_magazineWeapons"];

_vehicle = _this select 0;
_magazine = _this select 1;

if (isNil "_magazine") exitWith {[]};

_weapons = weapons _vehicle;
_weaponMagazines = [];
{
	_weaponMagazines set [_forEachIndex, getArray (configFile >> "CfgWeapons" >> _x >> "AGM_Magazines")]
} forEach _weapons;

_magazineWeapons = [];
{
	if (_magazine in _x) then {_magazineWeapons pushBack (_weapons select _forEachIndex);};
} forEach _weaponMagazines;
_magazineWeapons
