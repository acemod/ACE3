/**
 * fn_getNewDamageBodyPart_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_unit","_selectionName","_newDamage", "_previousDamage", "_origDamage"];
_unit = _this select 0;
_amountOfDamage = _this select 1;
_number = _this select 2;

_previousDamage = _unit getvariable ["cse_bodyPartStatusPrevious_cms", [0,0,0,0,0,0]];
_newDamage = _amountOfDamage - (_previousDamage select _number);
_previousDamage set [_number, _newDamage];
[_unit,"cse_bodyPartStatusPrevious_cms",_previousDamage] call cse_fnc_setVariable;


_origDamage = [_unit,"cse_bodyPartStatus",[0,0,0,0,0,0]] call cse_fnc_getVariable;
_origDamage set [_number, (_origDamage select _number) + _newDamage]; /* We are storing the total Damage done on a body part for determining the damage properly */
[_unit,"cse_bodyPartStatus",_origDamage] call cse_fnc_setVariable;

_newDamage