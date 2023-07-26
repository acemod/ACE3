/*
Author: Kerc, original by www.3commandobrigade.com
Remove all ammo from static weapon
NOTE: As this is only called when a weapon is disassembled, the ammo is not actually removed from the weapon (for efficiency purposes)
Arguments:
0: static weapon platform
Return Value:
None
*/

//////////////////////////////////////////////////////////////////////////////////////////
// Main
//////////////////////////////////////////////////////////////////////////////////////////

params
[
	["_weaponPlatform",objNull,[objNull]],
    ["_holder",objNull,[objNull]]
];

private ["_magazines", "_first", "_magName", "_ammoCount"];

if (alive (call SPE_fnc_findPlayer)) then {
	_magazines = _weaponPlatform magazinesTurret [0];
	if ((count _magazines) > 0) then {
		_first = true;
		{
			_magName = _x;
			if (_first) then {
				_first = false;
				_ammoCount = _weaponPlatform magazineTurretAmmo [_magName, [0]];
			} else {
				_ammoCount = -1;
			};

			[_magName, _ammoCount,_holder] call SPE_Weapons_Static_fnc_drop_magazine;

		} forEach _magazines;
	};
};
