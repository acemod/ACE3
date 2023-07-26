/*
Author: Kerc, original by www.3commandobrigade.com 
EH to stand the weapon upright when a player picks it up
Arguments:
0: unit
Return Value:
none
*/
	
/////////////////////////////////////////////////////////////////////////////////////////////
// Main - executed local to the weapon
//////////////////////////////////////////////////////////////////////////////////////////

private ["_weaponPlatform"];
_weaponPlatform = _this select 0;

//diag_log format ["****** GetIn EH %1", _weaponPlatform];

// Stand the weapon up
_weaponPlatform animate ["DropWeapon", 0];

// Ensures the weapon platform is horizontal - required, otherwise sight is inaccurate
_weaponPlatform setVectorUp [0, 0, 1]; 
