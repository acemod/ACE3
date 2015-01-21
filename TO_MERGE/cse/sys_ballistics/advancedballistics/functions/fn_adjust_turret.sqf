#include "defines.h"

#define __dsp (uiNamespace getVariable "RscTurretDial")
#define __ctrl (__dsp displayCtrl 132949)

private ["_opticsName", "_opticType", "_scopeStep", "_turretAndDirection", "_majorStep", "_elevation", "_windage", "_zero"];
_turretAndDirection = _this select 0;
_majorStep = _this select 1;

if (!cse_AB_MilTurretsEnabled) exitWith { false };
if (weaponLowered player) exitWith { false };
if (vehicle player != player) exitWith { false };
if (currentWeapon player != primaryWeapon player) exitWith { false };
if (count primaryWeaponItems player < 3) exitWith { false };

_opticsName = (primaryWeaponItems player) select 2;
_opticType = getNumber(configFile >> "cfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");

if (_opticType != 2) exitWith { false };

_elevation = player getVariable [format["cse_AB_Elevation:%1", _opticsName], 0];
_windage = player getVariable [format["cse_AB_Windage:%1", _opticsName], 0];
_zero = player getVariable [format["cse_AB_Zero:%1", _opticsName], profileNamespace getVariable [format["cse_AB_Zero:%1", _opticsName], 0]];

_scopeStep = 0.1;

switch (_turretAndDirection) do
{
	case 0: { _elevation = _elevation + _scopeStep };
	case 1: { _elevation = _elevation - _scopeStep };
	case 2: { _windage = _windage - _scopeStep };
	case 3: { _windage = _windage + _scopeStep };
	case 4: { _zero = _zero + _scopeStep };
	case 5: { _zero = _zero - _scopeStep };
};

if (_majorStep) then {
	switch (_turretAndDirection) do
	{
		case 0: { _elevation = ceil(_elevation) };
		case 1: { _elevation = floor(_elevation) };
		case 2: { _windage = floor(_windage) };
		case 3: { _windage = ceil(_windage) };
	};
};

_zero = -4 max _zero min 30;
_elevation = (-4 - _zero) max _elevation min (30 - _zero);
_windage = -20 max _windage min 20;

cse_AB_WindInfo = false;
0 cutText ["", "PLAIN"];
cse_AB_Protractor = false;
1 cutText ["", "PLAIN"];

2 cutRsc ["RscTurretDial", "PLAIN"];

switch (_turretAndDirection) do
{
	case 0;
	case 1: {
		__ctrl ctrlSetText format["%1 Mil", round(_elevation * 10) / 10];
		__ctrl ctrlSetTextColor [1.0, 1.0, 0.5, 1.0];
	};
	case 2;
	case 3: {
		__ctrl ctrlSetText format["%1 Mil", round(_windage * 10) / 10];
		__ctrl ctrlSetTextColor [0.8, 0.8, 1.0, 1.0];
	};
	case 4;
	case 5: {
		__ctrl ctrlSetText format["%1 Mil", round(_zero * 10) / 10];
		__ctrl ctrlSetTextColor [0, 0.5, 0.0, 1.0];
	};
};

if (_elevation != player getVariable [format["cse_AB_Elevation:%1", _opticsName], 0]) then {
	player setVariable [format["cse_AB_Elevation:%1", _opticsName], _elevation, true];
	PlaySound "cse_AB_scope_click";
};
if (_windage != player getVariable [format["cse_AB_Windage:%1", _opticsName], 0]) then {
	player setVariable [format["cse_AB_Windage:%1", _opticsName], _windage, true];
	PlaySound "cse_AB_scope_click";
};
if (_zero != player getVariable [format["cse_AB_Zero:%1", _opticsName], 0]) then {
	profileNamespace setVariable [format["cse_AB_Zero:%1", _opticsName], _zero];
	player setVariable [format["cse_AB_Zero:%1", _opticsName], _zero, true];
	PlaySound "cse_AB_scope_click";
};

true
