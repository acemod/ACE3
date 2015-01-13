/**
 * fn_keyPressed_WR.sqf
 * @Descr: N/A
 * @Author: Glowbal, Ruthberg
 *
 * @Arguments: []
 * @Return: nil
 * @PublicAPI: false
 */
 
 
#define ALLOWED_ANIMATION_STATES ["amovpercmstpsraswrfldnon","aadjpercmstpsraswrfldup","aadjpercmstpsraswrflddown","aadjpknlmstpsraswrfldup","amovpknlmstpsraswrfldnon","aadjpknlmstpsraswrflddown","aadjppnemstpsraswrfldup","amovppnemstpsraswrfldnon","aadjpknlmstpsraswrfldright","aadjpknlmstpsraswrfldleft","aadjpercmstpsraswrfldright","aadjpercmstpsraswrfldleft","aadjppnemstpsraswrfldright","aadjppnemstpsraswrfldleft","aadjppnemstpsraswrflddown"]

private ["_playerAnimationState", "_canDeployBipod"];

if (weaponLowered player) exitWith {};
if (!([player] call cse_fnc_canInteract)) exitWith {};
if (player getVariable ["cse_isWeaponDeployed_WR", false]) exitWith {};

_playerAnimationState = (([animationState player, "_"] call BIS_fnc_splitString) select 0);
if (!(_playerAnimationState in ALLOWED_ANIMATION_STATES)) exitWith {};

// not deployed -> try to deploy now
_canDeployBipod = call cse_fnc_canDeployBipod_WR;
if (_canDeployBipod select 0) then {
	if (player getVariable ["cse_isWeaponRested_WR", false]) then {
		call cse_fnc_unrestWeapon_WR;
	};
	(_canDeployBipod select 1) call cse_fnc_deployWeapon_WR;
};

if (!(player getVariable ["cse_isWeaponRested_WR", false]) && !(player getVariable ["cse_isWeaponDeployed_WR", false])) then {
	// not deployed and not rested -> try to rest now
	if (call cse_fnc_canRestWeapon_WR) then {
		call cse_fnc_restWeapon_WR;
	};
};
