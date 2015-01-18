/**
 * fn_canPutInBodyBag.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit","_caller"];
_caller = _this select 0;
_target = _this select 1;

([_caller, "ACE_itemBodyBag"] call EFUNC(common,hasItem) && {(!(alive _target) || (_target getvariable [QEGVAR(common,isDead),false]) || (_target getvariable [QEGVAR(common,inReviveState), false]))} && {(_target distance _caller) < 7.5} && (vehicle _target == _unit)); // return