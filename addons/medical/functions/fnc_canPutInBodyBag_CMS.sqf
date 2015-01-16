/**
 * fn_canPutInBodyBag_CMS.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit","_caller"];
_unit = _this select 0;
_caller = _this select 1;

([_caller, "ACE_itemBodyBag"] call EFUNC(common,hasItem) && {(!(alive _unit) || (_unit getvariable [QEGVAR(common,isDead),false]) || (_unit getvariable [QEGVAR(common,inReviveState), false]))} && {(_unit distance _caller) < 7.5} && (vehicle _unit == _unit)); // return