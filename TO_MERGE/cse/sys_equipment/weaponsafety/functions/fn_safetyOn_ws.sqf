/**
 * fn_safetyOn_ws.sqf
 * @Descr: Puts the given unit/weapon/muzzle combination on safe
 * @Author: Ruthberg
 *
 * @Arguments: [unit OBJECT, weapon STRING, muzzle STRING]
 * @Return: nil
 * @PublicAPI: true
 */
 
 
private ["_unit", "_weapon", "_muzzle", "_ID"];
_unit   = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;

_unit setVariable[format["CSE_WeaponSafety_%1_%2", _weapon, _muzzle], true, false];
playSound "click";

_ID = format["CSE_WeaponSafety_ID_%1_%2_%3", _unit, _weapon, _muzzle];

[_ID, "onEachFrame", {
	private ["_unit", "_weapon", "_muzzle", "_ID"];
	_unit   = _this select 0;
	_weapon = _this select 1;
	_muzzle = _this select 2;
	_ID     = _this select 3;

	if (!(_unit getVariable[format["CSE_WeaponSafety_%1_%2", _weapon, _muzzle], false]) || !(_weapon in (weapons (vehicle _unit)))) exitWith {
		[_ID, "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
	};

	if (currentWeapon _unit == _weapon && currentMuzzle _unit == _muzzle) then {
		(vehicle _unit) setWeaponReloadingTime [_unit, _muzzle, 1];
	};

}, [_unit, _weapon, _muzzle, _ID]] call BIS_fnc_addStackedEventHandler;
