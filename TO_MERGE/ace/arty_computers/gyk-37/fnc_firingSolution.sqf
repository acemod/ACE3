//fnc_firingSolution.sqf
#include "script_component.hpp"
#define MILPREC 17.7777777777778
#define DEG2MIL(deg)	(((deg*MILPREC)) min 6400)
#define MIL2DEG(mil)	mil/MILPREC
#define ELEVATION(sol)	(floor DEG2MIL((sol select 0)))
#define TOF(sol)		((sol select 2))

_fncDeflection = {
	private ["_gunPos", "_targetPos", "_x1", "_x2", "_y1", "_y2", "_azimuth", "_reversed", "_deflection"];
	_gunPos = _this select 0;
	_targetPos = _this select 1;
	_dof = _this select 2;
	_reversed = [] call CBA_fnc_northingReversed;
	_azimuth = 0;
	_x1 = _gunPos select 0;
	_x2 = _targetPos select 0;
	_y1 = _gunPos select 1;
	_y2 = _targetPos select 1;
	_azimuth = ((((_x1 - _x2) atan2 (_y1 - _y2))) mod 360);
	
	if(_reversed) then {
		_azimuth = (_azimuth*-1 + 360) mod 360;
	} else {
		_azimuth = _azimuth + 180 mod 360;
	};
	//player sideChat format["_az: %1", _azimuth];
	_azimuth = DEG2MIL(_azimuth);

	_deflection = _azimuth - _dof;


	//ensure return is between 0-6400
	if (_deflection < 0) then {_deflection = _deflection + 6400};
	if (_deflection > 6400) then {_deflection = _deflection - 6400};

	if(_deflection > 3200) then {
		_deflection = _deflection - 6400;
	};
	_deflection = round(3200 + _deflection);
	_deflection;
};

_gunPos 		= _this select 0;
_targetPos 		= _this select 1;
_dof 			= _this select 2; // direction of fire in mils
_magazine 		= _this select 3;
_tableLow 		= _this select 4;
_tableHigh 		= _this select 5;

_btabLow = [] call COMPILE_FILE2_SYS(_tableLow);
_btabHigh = [] call COMPILE_FILE2_SYS(_tableHigh);



_ammo = getText(configFile >> "CfgMagazines" >> _magazine >> "ammo");
_isBaseEjecting = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_ARTY_ISBASEEJECTING");
_baseEjectingHob = 0;
_baseEjectingSpeed = 1;
_doBaseEjectCompensate = 0;
_baseEjectingFriction = -0.001064;
if(_isBaseEjecting == 1) then {
	_baseEjectingHob = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_ARTY_BASEEJECT_HOB");
	_baseEjectingSpeed = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_ARTY_BASEEJECT_POWER");
	_doBaseEjectCompensate = getNumber(configFile >> "CfgAmmo" >> _ammo >> "ACE_ARTY_BASEEJECT_COMPENSATE");
};




_deltaX = [_gunPos select 0, _gunPos select 1, 0] distance [_targetPos select 0, _targetPos select 1, 0];
_deltaY = ((_targetPos select 2) - (_gunPos select 2)) + _baseEjectingHob + 1;

_return = [[],[]];
_low = [_deltaX, _deltaY, _btabLow] call FUNC(calcFiringSolution);
_wind = +GVAR(averageWind);
if((count _low) > 0) then {
	// _friction = getNumber(configFile >> "CfgAmmo" >> _ammo >> "airFriction");
	// _friction = 0.25;
	// _windOffset = [
				// ((_wind select 0)*_friction)*TOF(_low), 
				// ((_wind select 1)*_friction)*TOF(_low)
			// ];
	// player sideChat format["windoffset l: %1", _windOffset];
	// _windOffsetTarget = [(_targetPos select 0) + (_windOffset select 0), (_targetPos select 1) + (_windOffset select 1)];

	// _deltaX = [_gunPos select 0, _gunPos select 1, 0] distance [_windOffsetTarget select 0, _windOffsetTarget select 1, 0];
	// _low = [_deltaX, _deltaY, _btabLow] call FUNC(calcFiringSolution);
	
	if(_isBaseEjecting == 1 && _doBaseEjectCompensate == 1) then {
		_d = [_baseEjectingFriction, (_low select 4)*_baseEjectingSpeed, (_low select 5), _baseEjectingHob] call FUNC(simpleBallistics);
		if(_d > 20) then {
			_low = [_deltaX-(_d/2), _deltaY, _btabLow] call FUNC(calcFiringSolution);
		};
		
	};
	_deflection = [_gunPos, _targetPos, _dof] call _fncDeflection;
	_return set[0, [ELEVATION(_low), _deflection, TOF(_low)]];
};

_high = [_deltaX, _deltaY, _btabHigh] call FUNC(calcFiringSolution);
if((count _high) > 0) then {
	// _friction = getNumber(configFile >> "CfgAmmo" >> _ammo >> "airFriction");
	// _friction = 0.25;
	// _windOffset = [
				// ((_wind select 0)*_friction)*TOF(_high), 
				// ((_wind select 1)*_friction)*TOF(_high)
			// ];
	// player sideChat format["windoffset h: %1", _windOffset];
	// _windOffsetTarget = [(_targetPos select 0) + (_windOffset select 0), (_targetPos select 1) + (_windOffset select 1)];

	// _deltaX = [_gunPos select 0, _gunPos select 1, 0] distance [_windOffsetTarget select 0, _windOffsetTarget select 1, 0];
	// _high = [_deltaX, _deltaY, _btabHigh] call FUNC(calcFiringSolution);
	
	if(_isBaseEjecting == 1 && _doBaseEjectCompensate == 1) then {
		_d = [_baseEjectingFriction, (_high select 4)*_baseEjectingSpeed, (_high select 5), _baseEjectingHob] call FUNC(simpleBallistics);
		if(_d > 20) then {
			_high = [_deltaX-(_d/2), _deltaY, _btabHigh] call FUNC(calcFiringSolution);
		};
	};

	_deflection = [_gunPos, _targetPos, _dof] call _fncDeflection;
	_return set[1, [ELEVATION(_high), _deflection, TOF(_high)]];
};
_return