/**
 * fn_deployWeapon_WR.sqf
 * @Descr: N/A
 * @Author: Ruthberg
 *
 * @Arguments: [pivotPosition PositionASL]
 * @Return: nil
 * @PublicAPI: false
 */

#include "script_component.hpp"

#define DEPLOYED_RECOIL 0.5
#define CAM_SHAKE [1.0, 0.5, 6.0]

private ["_pivotPosition", "_playerAnimationState"];
_pivotPosition = _this;

player setVariable [QGVAR(isWeaponDeployed), true, false];

playSound QGVAR(SoundWeaponRest);
addCamShake CAM_SHAKE;
[QGVAR(bipodDeployed), true, QUOTE(PATHTOF(data\icon\icon_bipod.paa)), [1,1,1,1]] call EFUNC(gui,displayIcon);

_playerAnimationState = animationState player;
player switchMove format["%1_ACE_deployed", _playerAnimationState];
player setUnitRecoilCoefficient DEPLOYED_RECOIL;

// Watcher that undeploys if we rotate/move too much
[_pivotPosition] spawn {
	private ["_pivotPosition", "_canDeployBipod"];
	_pivotPosition = _this select 0;
	while {player getVariable [QGVAR(isWeaponDeployed), false]} do {
		_canDeployBipod = call FUNC(canDeployBipod);
		if !(_canDeployBipod select 0) exitWith {};
		if ((_canDeployBipod select 1) vectorDistance _pivotPosition > 0.30) exitWith {};
		sleep 0.1;
	};
	call FUNC(undeployWeapon);
};
