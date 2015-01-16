/**
 * fn_restWeapon_WR.sqf
 * @Descr: N/A
 * @Author: Ruthberg
 *
 * @Arguments: []
 * @Return: nil
 * @PublicAPI: false
 */


#define RESTED_RECOIL 0.8
#define CAM_SHAKE [1.0, 0.5, 6.0]

private ["_playerAnimationState"];


player setVariable ["cse_isWeaponRested_WR", true, false];

playSound "cse_weaponrest_rest";
addCamShake CAM_SHAKE;
["cse_bipodDeployed", true, "cse\cse_sys_equipment\weaponresting\data\icons\icon_bipod.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon; // TODO: Make a separate icon for weapon resting

_playerAnimationState = animationState player;
player switchMove format["%1_cse_rested", _playerAnimationState];
player setUnitRecoilCoefficient RESTED_RECOIL;

// Watcher that unrests if we rotate/move too much
[] spawn {
	while {player getVariable ["cse_isWeaponRested_WR", false]} do {
		if !(call cse_fnc_canRestWeapon_WR) exitWith {};
		sleep 0.1;
	};
	call cse_fnc_unrestWeapon_WR;
};
