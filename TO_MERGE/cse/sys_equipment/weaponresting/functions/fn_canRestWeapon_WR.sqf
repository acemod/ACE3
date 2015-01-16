/**
 * fn_canRestWeapon_WR.sqf
 * @Descr: Check if player can rest weapon.
 * @Author: Glowbal, Ruthberg
 *
 * @Arguments: []
 * @Return: BOOL Can rest weapon.
 * @PublicAPI: true
 */
 
 
#define ALLOWED_ANIMATION_STATES ["amovpercmstpsraswrfldnon","aadjpercmstpsraswrfldup","aadjpercmstpsraswrflddown","aadjpknlmstpsraswrfldup","amovpknlmstpsraswrfldnon","aadjpknlmstpsraswrflddown","aadjppnemstpsraswrfldup","amovppnemstpsraswrfldnon","aadjpknlmstpsraswrfldright","aadjpknlmstpsraswrfldleft","aadjpercmstpsraswrfldright","aadjpercmstpsraswrfldleft","aadjppnemstpsraswrfldright","aadjppnemstpsraswrfldleft","aadjppnemstpsraswrflddown"]
#define MAX_REST_DISTANCE_FORWARD 0.30
#define MAX_REST_DISTANCE_LEFT    0.40
#define MAX_REST_DISTANCE_RIGHT   0.30
#define MAX_REST_DISTANCE_BOTTOM  0.50
#define MAX_REST_ANGLE            45

private ["_weapon", "_canRestWeapon", "_playerAnimationState", "_weaponDirection", "_leftHandPosition", "_rightHandPosition"];
_weapon = currentWeapon player;
_canRestWeapon = false;
_playerAnimationState = (([animationState player, "_"] call BIS_fnc_splitString) select 0);

if (_weapon == primaryWeapon player && !(weaponLowered player) && _playerAnimationState in ALLOWED_ANIMATION_STATES) then {
	_weaponDirection = player weaponDirection _weapon;
	
	_leftHandPosition  = ATLtoASL (player modelToWorld (player selectionPosition "LeftHand"));
	_rightHandPosition = ATLtoASL (player modelToWorld (player selectionPosition "RightHand"));
	
	// calculate direction for side checks.
	_direction = (_weaponDirection select 0) atan2 (_weaponDirection select 1);
	
	// check left
	 if (lineIntersects [_rightHandPosition, _rightHandPosition vectorAdd [
		MAX_REST_DISTANCE_LEFT * sin ((_direction) - MAX_REST_ANGLE),
		MAX_REST_DISTANCE_LEFT * cos ((_direction) - MAX_REST_ANGLE),
		MAX_REST_DISTANCE_LEFT * 0.5 * (_weaponDirection select 2)
	]]) exitWith { _canRestWeapon = true };
	 
	// check right
	if (lineIntersects [_rightHandPosition, _rightHandPosition vectorAdd [
		MAX_REST_DISTANCE_RIGHT * sin ((_direction) + MAX_REST_ANGLE),
		MAX_REST_DISTANCE_RIGHT * cos ((_direction) + MAX_REST_ANGLE),
		MAX_REST_DISTANCE_RIGHT * 0.5 * (_weaponDirection select 2)
	]]) exitWith { _canRestWeapon = true };
	
	// check bottom (object)
	if (lineIntersects [
		_rightHandPosition vectorDiff [0, 0, MAX_REST_DISTANCE_BOTTOM],
		_leftHandPosition  vectorDiff [0, 0, MAX_REST_DISTANCE_BOTTOM] vectorAdd (_weaponDirection vectorMultiply MAX_REST_DISTANCE_FORWARD)]
	) exitWith { _canRestWeapon = true };
	
	// check bottom (ground)
	if (terrainIntersectASL [
		_rightHandPosition vectorDiff [0, 0, MAX_REST_DISTANCE_BOTTOM],
		_leftHandPosition  vectorDiff [0, 0, MAX_REST_DISTANCE_BOTTOM] vectorAdd (_weaponDirection vectorMultiply MAX_REST_DISTANCE_FORWARD)]
	) exitWith { _canRestWeapon = true };
};

_canRestWeapon
