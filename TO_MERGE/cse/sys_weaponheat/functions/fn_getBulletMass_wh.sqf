/**
 * fn_getBulletMass_wh.sqf
 * @Descr: Calculates the mass of the bullet
 * @Author: Ruthberg
 *
 * @Arguments: ammo STRING
 * @Return: bullet mass in gramm
 * @PublicAPI: false
 */

 
private ["_ammo", "_bulletMass", "_caliber"];
_ammo   = _this;

_bulletMass = getNumber(configFile >> "CfgAmmo" >> _ammo >> "AB_bulletMass");
if (_bulletMass == 0) then {
	// Try to estimate the mass based on BIS caliber
	// B_762x51_Ball: caliber 1.0 <--> 7.62 NATO M80: bullet mass 147 grain (9.46064086 g)
	_caliber = getNumber(configFile >> "CfgAmmo" >> _ammo >> "caliber");
	_bulletMass = _muzzleVelocity / 850 * _caliber * 9.46064086;
} else {
	_bulletMass = _bulletMass * 0.06479891;
};

_bulletMass
