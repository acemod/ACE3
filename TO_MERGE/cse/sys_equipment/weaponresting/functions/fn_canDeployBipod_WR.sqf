/**
 * fn_canDeployBipod_WR.sqf
 * @Descr: Check if player can deploy a bipod.
 * @Author: Glowbal, Ruthberg
 *
 * @Arguments: []
 * @Return: [BOOL, PositionASL]
 * @PublicAPI: true
 */
 
 
#define LEFT_HAND_BIPOD_DISTANCE_LONG_RIFLE 0.3
#define LEFT_HAND_BIPOD_DISTANCE_RIFLE 0.15
#define BIPOD_HEIGHT 0.40
#define ALLOWED_ANIMATION_STATES ["amovpercmstpsraswrfldnon","aadjpercmstpsraswrfldup","aadjpercmstpsraswrflddown","aadjpknlmstpsraswrfldup","amovpknlmstpsraswrfldnon","aadjpknlmstpsraswrflddown","aadjppnemstpsraswrfldup","amovppnemstpsraswrfldnon","aadjpknlmstpsraswrfldright","aadjpknlmstpsraswrfldleft","aadjpercmstpsraswrfldright","aadjpercmstpsraswrfldleft"]

private ["_weapon", "_playerAnimationState", "_canDeployBipod", "_weaponDirection", "_leftHandPosition", "_leftHandBipodDistance", "_isLongRifle", "_azimut", "_elevation", "_bipodTop", "_bipodBottom"];
_weapon = currentWeapon player;
_playerAnimationState = (([animationState player, "_"] call BIS_fnc_splitString) select 0);
_canDeployBipod = [false, [0, 0, 0]];

if ((call cse_fnc_hasBipod_WR) && _weapon == primaryWeapon player && !(weaponLowered player) && _playerAnimationState in ALLOWED_ANIMATION_STATES) then {	
	_weaponDirection = player weaponDirection _weapon;
	
	_leftHandPosition  = ATLtoASL (player modelToWorld (player selectionPosition "LeftHand"));
	
	_leftHandBipodDistance = LEFT_HAND_BIPOD_DISTANCE_RIFLE;
	_isLongRifle = [configFile >> "CfgWeapons" >> _weapon, "Rifle_Long_Base_F"] call cse_fnc_inheritsFrom;
	if (_isLongRifle) then {
		_leftHandBipodDistance = LEFT_HAND_BIPOD_DISTANCE_LONG_RIFLE;
	};
	
	_azimut = (_weaponDirection select 0) atan2 (_weaponDirection select 1);
	_elevation = asin(_weaponDirection select 2);
	
	_bipodTop    = _leftHandPosition vectorAdd (_weaponDirection vectorMultiply _leftHandBipodDistance);
	_bipodBottom = _bipodTop vectorAdd [sin(_azimut) * sin(_elevation) * BIPOD_HEIGHT, cos(_azimut) * sin(_elevation) * BIPOD_HEIGHT, cos(_elevation) * -BIPOD_HEIGHT];
	
	// Bipods can be deployed on ground or objects.
	_canDeployBipod = [_bipodTop, _bipodBottom, 0.05] call cse_fnc_getFirstObjectIntersection;
	if (_canDeployBipod select 0) exitWith {};
	_canDeployBipod = [_bipodTop, _bipodBottom, 0.05] call cse_fnc_getFirstTerrainIntersection;
	if (_canDeployBipod select 0) exitWith {};
};

_canDeployBipod
