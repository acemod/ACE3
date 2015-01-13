/**
 * fn_unrestWeapon_WR.sqf
 * @Descr: N/A
 * @Author: Ruthberg
 *
 * @Arguments: []
 * @Return: nil
 * @PublicAPI: false
 */


private ["_playerAnimationState"];

_playerAnimationState = animationState player;
player switchMove (([_playerAnimationState, "_"] call BIS_fnc_splitString) select 0);
player setUnitRecoilCoefficient 1;

player setVariable ["cse_isWeaponRested_WR", false, false];

playSound "cse_weaponrest_unrest";
["cse_bipodDeployed", false, "cse\cse_sys_equipment\weaponresting\data\icons\icon_bipod.paa", [1,1,1,1]] call cse_fnc_gui_displayIcon;