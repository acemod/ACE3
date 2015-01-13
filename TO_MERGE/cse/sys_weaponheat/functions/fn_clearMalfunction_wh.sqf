/**
 * fn_jamWeapon_wh.sqf
 * @Descr: Clears the malfunction of a given unit/weapon/muzzle combination
 * @Author: Ruthberg
 *
 * @Arguments: [unit OBJECT, weapon STRING, muzzle STRING]
 * @Return: nil
 * @PublicAPI: true
 */
 
#define SUCCESS_RATE 0.9

private ["_unit", "_weapon", "_muzzle"];
_unit   = _this select 0;
_weapon = _this select 1;
_muzzle = _this select 2;

if ((currentMuzzle _unit) != _muzzle) exitWith {};
if (_unit getVariable["CSE_ClearingMalfunction", false]) exitWith {};
if (!(_unit getVariable[format["CSE_Malfunction_%1_%2", _weapon, _muzzle], false])) exitWith {};

// Beginning of the procedure to clear the malfunction
_unit setVariable["CSE_ClearingMalfunction", true, false];

_unit playActionNow "reloadMagazine";
sleep 2; // TODO: This should depend on the weapon type (maybe consider the weapon mass)
if (SUCCESS_RATE > random 1) then {
	_unit setVariable [format["CSE_Malfunction_%1_%2", _weapon, _muzzle], false, !(_unit isKindOf "Man")];
};

// End of the procedure to clear the malfunction
_unit setVariable["CSE_ClearingMalfunction", false, false];
