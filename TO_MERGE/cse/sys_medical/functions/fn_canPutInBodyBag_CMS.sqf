/**
 * fn_canPutInBodyBag_CMS.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

private ["_unit","_caller"];
_unit = _this select 0;
_caller = _this select 1;

([_caller, "cse_itemBodyBag"] call cse_fnc_hasItem && {(!(alive _unit) || (_unit getvariable ["cse_isDead",false]) || (_unit getvariable ["cse_inReviveState", false]))} && {(_unit distance _caller) < 7.5} && (vehicle _unit == _unit)); // return