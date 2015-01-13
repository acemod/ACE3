/**
 * fn_deployWeapon_WR.sqf
 * @Descr: N/A
 * @Author: Ruthberg
 *
 * @Arguments: [pivotPosition PositionASL]
 * @Return: nil
 * @PublicAPI: false
 */


#define DEPLOYED_RECOIL 0.5
#define CAM_SHAKE [1.0, 0.5, 6.0]

private ["_pivotPosition", "_playerAnimationState"];
_pivotPosition = _this;

player setVariable ["cse_isWeaponDeployed_WR", true, false];

playSound "cse_weaponrest_rest";
addCamShake CAM_SHAKE;
["cse_bipodDeployed", true, "cse\cse_sys_equipment\weaponresting\data\icons\icon_bipod.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;

_playerAnimationState = animationState player;
player switchMove format["%1_cse_deployed", _playerAnimationState];
player setUnitRecoilCoefficient DEPLOYED_RECOIL;

// Watcher that undeploys if we rotate/move too much
[_pivotPosition] spawn {
	private ["_pivotPosition", "_canDeployBipod"];
	_pivotPosition = _this select 0;
	while {player getVariable ["cse_isWeaponDeployed_WR", false]} do {
		_canDeployBipod = call cse_fnc_canDeployBipod_WR;
		if !(_canDeployBipod select 0) exitWith {};
		if ((_canDeployBipod select 1) vectorDistance _pivotPosition > 0.30) exitWith {};
		sleep 0.1;
	};
	call cse_fnc_undeployWeapon_WR;
};
