//fnc_firingSolution.sqf
#define MILPREC 17.7777777777778
#define DEG2MIL(deg)	(((deg*MILPREC)) min 6400)
#define MIL2DEG(mil)	mil/MILPREC
#define ELEVATION(sol)	(floor DEG2MIL((sol select 0)))
#define TOF(sol)		((sol select 2))

if((count DEMO_btabHigh) < 1) then {
	DEMO_btabHigh = [DEMO_MAGAZINE, 45, 69, 1, -2000, 2000, 50] call DEMO_fnc_getBTable;
	DEMO_btabLow = [DEMO_MAGAZINE, 0, 45, 1, -2000, 2000, 50] call DEMO_fnc_getBTable;
};

_ammo = getText(configFile >> "CfgMagazines" >> DEMO_MAGAZINE >> "ammo");
_isBaseEjecting = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_ARTY_ISBASEEJECTING");
_baseEjectingHob = 0;
_baseEjectingSpeed = 1;
_doBaseEjectCompensate = 0;
if(_isBaseEjecting == 1) then {
	_baseEjectingHob = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_ARTY_BASEEJECT_HOB");
	_baseEjectingSpeed = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_ARTY_BASEEJECT_POWER");
	_doBaseEjectCompensate = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_ARTY_BASEEJECT_COMPENSATE");
};

_gun = _this select 0;
_targetPos = _this select 1;
_dof = _this select 2; // direction of fire in mils
player sideChat format["c: %1", _doBaseEjectCompensate];
_targetPos set[2, (getTerrainHeightASL _targetPos) + _baseEjectingHob];

_x1 = (getPosASL _gun) select 0;
_x2 = _targetPos select 0;
_y1 = (getPosASL _gun) select 1;
_y2 = _targetPos select 1;
_azimuth = (180 + (((_x1 - _x2) atan2 (_y1 - _y2))) mod 360);


_azimuth = DEG2MIL(_azimuth);
_deflection = _azimuth - _dof;




//ensure return is between 0-360
//if (_deflection < 0) then {_deflection = _deflection + 6400};
if (_deflection > 6400) then {_deflection = _deflection - 6400};

_deflection = round(3200 + _deflection);
_out = "Solutions:\n";
_firingPos = (getPosASL _gun);
_deltaX = [_firingPos select 0, _firingPos select 1, 0] distance [_targetPos select 0, _targetPos select 1, 0];
_deltaY = (_targetPos select 2) - (_firingPos select 2);

player sideChat format["alt dif: %1", _deltaY];



_high = [_deltaX, _deltaY, DEMO_btabHigh] call DEMO_fnc_calcFiringSolution;
if((count _high) > 0) then {
	if(_isBaseEjecting == 1 && _doBaseEjectCompensate == 1) then {
		_d = [-0.001064, (_high select 4)*0.65, (_high select 5), _baseEjectingHob] call DEMO_fnc_simpleBallistics;
		if(_d > 20) then {
			_high = [_deltaX-(_d*0.65), _deltaY, DEMO_btabHigh] call DEMO_fnc_calcFiringSolution;
		};
	};
	_out = _out + format["High | El: %1 Df: %2 TOF: %3\n", ELEVATION(_high), _deflection, TOF(_high)];
};
_low = [_deltaX, _deltaY, DEMO_btabLow] call DEMO_fnc_calcFiringSolution;
if((count _low) > 0) then {
	if(_isBaseEjecting == 1 && _doBaseEjectCompensate == 1) then {
		player sideChat "CCCCCCC";
		_d = [-0.001064, (_low select 4)*0.65, (_low select 5), _baseEjectingHob] call DEMO_fnc_simpleBallistics;
		if(_d > 20) then {
			_low = [_deltaX-(_d*0.65), _deltaY, DEMO_btabLow] call DEMO_fnc_calcFiringSolution;
		};
	};
	_out = _out + format["Low | El: %1 Df: %2 TOF: %3", ELEVATION(_low), _deflection, TOF(_low)];
};
hintSilent _out;