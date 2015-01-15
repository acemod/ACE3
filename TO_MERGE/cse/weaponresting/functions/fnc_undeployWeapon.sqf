/**
 * fn_undeployWeapon_WR.sqf
 * @Descr: N/A
 * @Author: Ruthberg
 *
 * @Arguments: []
 * @Return: nil
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_playerAnimationState"];

_playerAnimationState = animationState player;
player switchMove (([_playerAnimationState, "_"] call BIS_fnc_splitString) select 0);
player setUnitRecoilCoefficient 1;

player setVariable [QGVAR(isWeaponDeployed), false, false];

playSound QGVAR(SoundWeaponUnrest);
[QGVAR(bipodDeployed), false, QUOTE(PATHTOF(data\icon\icon_bipod.paa)), [1,1,1,1]] call EFUNC(gui,displayIcon);