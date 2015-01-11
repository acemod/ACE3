
/*
input
_ownPos = _this select 0;
_targetPos = _this select 1;
_vehicle = _this select 2;
_weapon = _this select 3;
_magazine = _this select 4;
_charge = _this select 5;
*/

_table = [];
for "_range" from 100 to 2000 step 25 do {
	_firingSolution =         [[0, 0, 0], [_range, 0, 0],    "M252", "M252", "ACE_1Rnd_81mmHE_M252", "Single1"] call bArty_fnc_getSolution;
	_firingSolutionAltitude = [[0, 0, 0], [_range, 0, -100], "M252", "M252", "ACE_1Rnd_81mmHE_M252", "Single1"] call bArty_fnc_getSolution;

	// _return = [_azimuth, _elevation, _flightTime, _balca_target];
	_elevation = _firingSolution select 1;
	_flightTime = _firingSolution select 1;
	_elevationAltitude = (_firingSolutionAltitude select 1) - _elevation;
	
	_table = _table + [_range, _elevation, _elevationAltitude, _flightTime];
};
copyToClipboard format ["%1", _table];
