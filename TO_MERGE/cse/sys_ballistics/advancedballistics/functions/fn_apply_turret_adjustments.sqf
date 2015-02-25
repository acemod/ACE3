#include "defines.h"

private ["_bullet", "_unit", "_opticsName", "_opticType", "_windage", "_elevation", "_zero", "_bulletVelocity", "_dir", "_elev", "_mag3D", "_mag2D"];
_bullet = _this select 0;
_unit   = _this select 1;

_opticsName = "";
_opticType = 0;
if (currentWeapon _unit == primaryWeapon _unit && count primaryWeaponItems _unit > 2) then {
	_opticsName = (primaryWeaponItems _unit) select 2;
	_opticType = getNumber(configFile >> "cfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
};

if (_opticType == 2) then {
	_windage = _unit getVariable [format["cse_AB_Windage:%1", _opticsName], 0];
	_elevation = _unit getVariable [format["cse_AB_Elevation:%1", _opticsName], 0];
	_zero = _unit getVariable [format["cse_AB_Zero:%1", _opticsName], 0];

	_elevation = _elevation + _zero;

	if (_windage != 0 || _elevation != 0) then {
		_windage = _windage * 3.47 / 60;
		_elevation = _elevation * 3.47 / 60;

		_bulletVelocity = (velocity _bullet);
		_mag3D = vectorMagnitude _bulletVelocity;
		_dir = (_bulletVelocity select 0) atan2 (_bulletVelocity select 1);
		_elev = asin((_bulletVelocity select 2) / _mag3D);

		_dir = _dir + _windage;
		_elev = _elev + _elevation;

		_mag2D = _mag3D * cos(_elev);

		_bullet setVelocity [_mag2D * sin(_dir), _mag2D * cos(_dir), _mag3D * sin(_elev)];
	};
};
