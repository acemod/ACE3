/**
 * fn_keyPressed_WR.sqf
 * @Descr: N/A
 * @Author: Glowbal, Ruthberg
 *
 * @Arguments: []
 * @Return: nil
 * @PublicAPI: false
 */

 #include "script_component.hpp"

#define ALLOWED_ANIMATION_STATES ["amovpercmstpsraswrfldnon","aadjpercmstpsraswrfldup","aadjpercmstpsraswrflddown","aadjpknlmstpsraswrfldup","amovpknlmstpsraswrfldnon","aadjpknlmstpsraswrflddown","aadjppnemstpsraswrfldup","amovppnemstpsraswrfldnon","aadjpknlmstpsraswrfldright","aadjpknlmstpsraswrfldleft","aadjpercmstpsraswrfldright","aadjpercmstpsraswrfldleft","aadjppnemstpsraswrfldright","aadjppnemstpsraswrfldleft","aadjppnemstpsraswrflddown"]

private ["_playerAnimationState", "_canDeployBipod"];

if (weaponLowered player) exitWith {};
if (!([player] call cse_fnc_canInteract)) exitWith {};
if (player getVariable [QGVAR(isWeaponDeployed), false]) exitWith {};

_playerAnimationState = (([animationState player, "_"] call BIS_fnc_splitString) select 0);
if (!(_playerAnimationState in ALLOWED_ANIMATION_STATES)) exitWith {};

// not deployed -> try to deploy now
_canDeployBipod = call FUNC(canDeployBipod);
if (_canDeployBipod select 0) then {
	if (player getVariable [QGVAR(isWeaponRested), false]) then {
		call FUNC(unrestWeapon);
	};
	(_canDeployBipod select 1) call FUNC(deployWeapon);
};

if (!(player getVariable [QGVAR(isWeaponRested), false]) && !(player getVariable [QGVAR(isWeaponDeployed), false])) then {
	// not deployed and not rested -> try to rest now
	if (call FUNC(canRestWeapon)) then {
		call FUNC(restWeapon);
	};
};
