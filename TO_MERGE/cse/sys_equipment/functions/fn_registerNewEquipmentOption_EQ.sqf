/**
 * fn_registerNewEquipmentOption_EQ.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_name","_condition","_code"];
_name = _this select 0;
_condition = _this select 1;
_code = _this select 2;

if (typeName _name != typeName "" || typeName _condition != typeName {} || typeName _code != typeName{}) exitwith {};

if (isnil "CSE_REGISTERING_EQUIPMENT_OPTION") then {
	CSE_REGISTERING_EQUIPMENT_OPTION = false;
};
sleep (random(0.5));
waituntil {!CSE_REGISTERING_EQUIPMENT_OPTION};
CSE_REGISTERING_EQUIPMENT_OPTION = true;

if (isnil "CSE_EQUIPMENT_OPTIONS_EQ") then {
	CSE_EQUIPMENT_OPTIONS_EQ = [];
};
CSE_EQUIPMENT_OPTIONS_EQ pushback [_name,_condition,_code];

CSE_REGISTERING_EQUIPMENT_OPTION = false;