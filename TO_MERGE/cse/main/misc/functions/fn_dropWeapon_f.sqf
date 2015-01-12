/**
 * fn_dropWeapon_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_currentWeapon","_currentAnimation", "_WeaponHolder"];
_unit = [_this, 0, ObjNull,[ObjNull]] call BIS_fnc_Param;

_currentWeapon = currentWeapon _unit;
_currentAnimation = animationState _unit;
_WeaponHolder = "GroundWeaponHolder" createVehicle position _unit;

_unit removeWeapon _currentWeapon;
_weaponHolder addWeaponCargoGlobal [_currentWeapon, 1];
//_unit action [ "DropWeapon", _WeaponHolder, _currentWeapon ];
_WeaponHolder setPos (getPos _unit);
//_unit switchMove _currentAnimation;

_primairyWeapon = primaryWeapon _unit;
_secondairyWeapon = secondaryWeapon _unit;
_handGunWeapon = handgunWeapon _unit;

switch (_currentWeapon) do {
	case _primairyWeapon: {

	};
	case _secondairyWeapon: {

	};
	case _handGunWeapon: {

	};
	default {};
};