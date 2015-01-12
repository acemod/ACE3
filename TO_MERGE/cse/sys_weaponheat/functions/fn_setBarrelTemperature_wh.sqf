/**
 * fn_setBarrelTemperature_wh.sqf
 * @Descr: Calculates the current barrel temperature
 * @Author: Ruthberg
 *
 * @Arguments: [unit OBJECT, weapon STRING, muzzle STRING]
 * @Return: barrel temperature in degree celsius
 * @PublicAPI: true
 */
 
 
private ["_unit", "_weapon", "_muzzle", "_barrelTemperature"];
_unit              = _this select 0;
_weapon            = _this select 1;
_muzzle            = _this select 2;
_barrelTemperature = _this select 3;

_unit setVariable [format["CSE_BarrelTemperature_%1", _weapon], _barrelTemperature, !(_unit isKindOf "Man")];
_unit setVariable [format["CSE_BarrelUpdateTime_%1" , _weapon], diag_tickTime, !(_unit isKindOf "Man")];
