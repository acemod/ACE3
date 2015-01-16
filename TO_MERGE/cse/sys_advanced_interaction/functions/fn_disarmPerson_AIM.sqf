/**
 * fn_disarmPerson_AIM.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_caller","_cursor", "_weaponHolder"];
_caller = _this select 0;
_target = _this select 1;

_weaponHolder = createVehicle ["GroundWeaponHolder" , getPos _target, [], 0, "NONE"];

{
	_target action ["DropWeapon", _weaponHolder, _X];
}foreach weapons _target;