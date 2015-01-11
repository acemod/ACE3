
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
for "_range" from 25 to 2000 step 25 do {



  _vehicle = "ACE_M252";
	_weapon = "ACE_M252_Tri";
	_magazine = "ACE_1Rnd_81mmHE_M252";
	_charge = "Single1";
	
  /*
	_firingSolution =         [[0, 0, 0], [_range, 0, 0],    _vehicle, _weapon, _magazine, _charge] call bArty_fnc_getSolution;
	_firingSolutionAltitude = [[0, 0, 0], [_range, 0, -100], _vehicle, _weapon, _magazine, _charge] call bArty_fnc_getSolution;
  */
	
	_firingSolution =         [[0, 0, 0], [_range, 0, 0],    _vehicle, _weapon, _magazine, _charge] call bArty_fnc_getSolution;
	_firingSolutionAltitude = [[0, 0, 0], [_range, 0, -100], _vehicle, _weapon, _magazine, _charge] call bArty_fnc_getSolution;
	
	// _return = [_azimuth, _elevation, _flightTime, _balca_target];
	_elevation = _firingSolution select 1;
	_flightTime = _firingSolution select 2;
	//_elevationAltitude = (_firingSolutionAltitude select 1) - _elevation;
	_elevationAltitude = _firingSolutionAltitude select 1;
	
	_table = _table + [[_range, _elevation, _elevationAltitude, _flightTime]];
};
copyToClipboard format ["%1", _table];

hint "table generation done";