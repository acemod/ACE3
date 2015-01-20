#include "script_component.hpp"
#define __enableWindClient (["ACE", "ACE_WIND_CONFIG", "enable_drift"] call ace_settings_fnc_getNumber)

private ["_unit","_weapon","_ammo","_bullet","_go"];

// mission global variables (force_drift_on/off) override clientside drift setting
_go = __enableWindClient;
if (isMultiplayer) then {
	if (GVAR(force_drift_off)) exitwith {_go = 0};
	if (GVAR(force_drift_on)) exitwith {_go = 1};
};
if (_go == 0) exitwith {};

[_this select 6,_this select 1,_this select 0,_this select 4] call FUNC(bulletflight);
