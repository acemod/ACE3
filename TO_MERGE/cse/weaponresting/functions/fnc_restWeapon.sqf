/**
 * fn_restWeapon_WR.sqf
 * @Descr: N/A
 * @Author: Ruthberg
 *
 * @Arguments: []
 * @Return: nil
 * @PublicAPI: false
 */

#include "script_component.hpp"

#define RESTED_RECOIL 0.8
#define CAM_SHAKE [1.0, 0.5, 6.0]

private ["_playerAnimationState"];


player setVariable [QGVAR(isWeaponRested), true, false];

playSound QGVAR(SoundWeaponRest);
addCamShake CAM_SHAKE;
[QGVAR(bipodDeployed), true, QUOTE(PATHTOF(data\icon\icon_bipod.paa)), [1,1,1,1]] call EFUNC(gui,displayIcon); // TODO: Make a separate icon for weapon resting

_playerAnimationState = animationState player;
player switchMove format["%1_ACE_rested", _playerAnimationState];
player setUnitRecoilCoefficient RESTED_RECOIL;

// Watcher that unrests if we rotate/move too much
[] spawn {
	while {player getVariable [QGVAR(isWeaponRested), false]} do {
		if !(call FUNC(canRestWeapon)) exitWith {};
		sleep 0.1;
	};
	call FUNC(unrestWeapon);
};
