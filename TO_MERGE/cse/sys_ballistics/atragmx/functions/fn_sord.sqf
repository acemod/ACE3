#include "script_component.hpp"

cse_ab_ATragMX_COMPAT_LRF = ["Rangefinder", "Laserdesignator"];

private ["_fnc_atragmx"];

_fnc_atragmx = {
	private ["_target", "_position", "_range", "_inclinationAngle"];

	if ((local player) && (currentWeapon player) in cse_ab_ATragMX_COMPAT_LRF && (!isNull (_this select 0))) then {
		_target = getPosATL (_this select 0);
		_position = getPosATL player;

		_inclinationAngle = asin((player weaponDirection currentWeapon player) select 2);
		_range = _position distance _target;

		cse_ab_ATragMX_inclinationAngle set [cse_ab_ATragMX_currentTarget, _inclinationAngle];
		cse_ab_ATragMX_targetRange set [cse_ab_ATragMX_currentTarget, _range];
	};
};

//["ace_sys_rangefinder_Lazing", _fnc_atragmx] call CBA_fnc_addEventHandler;
