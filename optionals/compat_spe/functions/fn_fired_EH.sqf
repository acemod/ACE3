/*
Author: Kerc, original by www.3commandobrigade.com
EH to remove spent magazine from static weapon
Arguments:
0: unit
5: magname
Return Value:
none
*/

/////////////////////////////////////////////////////////////////////////////////////////////
// Main - executed local to the weapon
//////////////////////////////////////////////////////////////////////////////////////////

//diag_log format["Fired EH: 1=%1, 2=%2, 3=%3, 4=%4, 5=%5, 6=%6, 7=%7", _this select 0, _this select 1,_this select 2,_this select 3,_this select 4,_this select 5,_this select 6 ];

private _veh = _this select 0;
private _playerIsCrew = (call SPE_fnc_findPlayer) in (crew _veh);

// Must include local vehicles so the removeMagazineTurret command works
if ((local _veh) || _playerIsCrew) then {

	private _weapon = _this select 1;
	private _ammoName = _this select 4;
	private _magName = _this select 5;

	// Remove empty magazines
	if ((_veh magazineTurretAmmo [_magName, [0]]) == 0) then {
		_veh removeMagazineTurret [_magName, [0]];
	};
};
