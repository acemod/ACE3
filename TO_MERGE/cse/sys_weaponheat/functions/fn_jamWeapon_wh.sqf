/**
 * fn_jamWeapon_wh.sqf
 * @Descr: Adds a malfunction to the given unit/weapon/muzzle combination
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

_unit setVariable[format["CSE_Malfunction_%1_%2", _weapon, _muzzle], true, !(_unit isKindOf "CaManBase")];
_ID = format["CSE_Malfunction_ID_%1_%2_%3", _unit, _weapon, _muzzle];

[_ID, [_unit, _weapon, _muzzle, _ID], {
	private ["_unit", "_weapon", "_muzzle", "_ID"];
	_unit   = _this select 0;

	// necessary to prefent weapon jam from resetting when jumping in and out of vehicles.
	if (vehicle _unit == _unit) then {
		_weapon = _this select 1;
		_muzzle = _this select 2;
		_ID     = _this select 3;

		if (!(_unit getVariable[format["CSE_Malfunction_%1_%2", _weapon, _muzzle], false]) || !(_weapon in (weapons (vehicle _unit)))) exitWith {
			_unit setVariable[format["CSE_Malfunction_%1_%2", _weapon, _muzzle], nil, !(_unit isKindOf "CaManBase")]; // clean up the malfunction variable.
			[_ID] call cse_fnc_removeTaskFromPool_F;
		};

		if (currentWeapon _unit == _weapon && currentMuzzle _unit == _muzzle) then {
			(vehicle _unit) setWeaponReloadingTime [_unit, _muzzle, 1];
		};
	};
}] call cse_fnc_addTaskToPool_f;
