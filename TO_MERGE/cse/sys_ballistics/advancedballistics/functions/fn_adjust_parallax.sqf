/**
 * fn_adjust_parralax.sqf
 * @Descr: N/A
 * @Author: Ruthberg
 *
 * @Arguments: []
 * @Return: []
 * @PublicAPI: false
 */


#include "defines.h"

#define __dsp (uiNamespace getVariable "RscTurretDial")
#define __ctrl (__dsp displayCtrl 132949)

private ["_direction", "_opticsName", "_opticType", "_parallax"];
_direction = _this;
_opticsName = currentWeapon player;
_opticType = 0;

if (!cse_AB_MirageEnabled) exitWith { false };
if (!(weaponLowered player) && currentWeapon player == primaryWeapon player && count primaryWeaponItems player > 2) then {
	_opticsName = (primaryWeaponItems player) select 2;
	_opticType = getNumber(configFile >> "cfgWeapons" >> _opticsName >> "ItemInfo" >> "opticType");
};
if (_opticType != 2 && !(currentWeapon player in ["Binocular", "Rangefinder", "Laserdesignator"])) exitWith { false };

_parallax = player getVariable [format["cse_AB_Parallax:%1", _opticsName], 0];

switch (_direction) do
{
	case 0:
	{
		if (_parallax > 0) then {
			_parallax = _parallax + 100;
		};
		if (_parallax > 1000) then {
			_parallax = 0;
		};
	};
	case 1:
	{
		if (_parallax > 100) then {
			_parallax = _parallax - 100;
		};
		if (_parallax == 0) then {
			_parallax = 1000;
		};
	};
};

cse_AB_WindInfo = false;
0 cutText ["", "PLAIN"];
cse_AB_Protractor = false;
1 cutText ["", "PLAIN"];

2 cutRsc ["RscTurretDial", "PLAIN"];

if (_parallax > 0) then {
	__ctrl ctrlSetText format["%1 m", round(_parallax)];
} else {
	__ctrl ctrlSetText "infinity";
};
__ctrl ctrlSetTextColor [0.8, 0.0, 0.0, 1.0];

if (_parallax != player getVariable [format["cse_AB_Parallax:%1", _opticsName], 0]) then {
	player setVariable [format["cse_AB_Parallax:%1", _opticsName], _parallax, false];
	PlaySound "cse_AB_scope_click";
};

true
