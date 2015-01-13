/**
 * fn_getBarrelMass_wh.sqf
 * @Descr: Calculates the mass of the barrel
 * @Author: Ruthberg
 *
 * @Arguments: [unit OBJECT, weapon STRING, muzzle STRING]
 * @Return: barrel mass in gramm
 * @PublicAPI: false
 */

 
private ["_unit", "_weapon", "_muzzle", "_barrelMass"];
_unit   = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;

_barrelMass = 0.40 * (getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass")) * 50;  // estimated barrel mass in gramm
if (_barrelMass == 0) then {
	// TODO: Find a way to estimate the barrel mass in this case
	_barrelMass = 4000;
	if (!(_unit isKindOf "Man")) then {
		_barrelMass = _barrelMass * 10;
	};
};
switch (_weapon) do {
	case (primaryWeapon _unit)   : { _barrelMass = 1000 max _barrelMass };
	case (secondaryWeapon _unit) : { _barrelMass = 2000 max _barrelMass };
	case (handgunWeapon _unit)   : { _barrelMass = 400  max _barrelMass };
};

_barrelMass
