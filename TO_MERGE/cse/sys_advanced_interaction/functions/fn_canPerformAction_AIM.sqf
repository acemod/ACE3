/**
 * fn_canPerformAction_AIM.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: true
 */

private [ "_caller", "_target", "_return", "_settingNumber", "_item"];
_caller = _this select 0;
_target = _this select 1;
_settingNumber = _this select 2;
_item = _this select 3;

if ((_target iskindof "CaManBase") && {((_caller distance _target) < 10)} && (_caller != _target) && (!CSE_USE_EQUIPMENT_AIM || [_caller, _item] call cse_fnc_hasItem || _item == "")) exitwith {

	_return = switch (_settingNumber ) do {
		case 3: {true};
		case 2: {side _caller != side _target};
		case 1: {!(isPlayer _target)};
		case 0: {side _caller != side _target && !(isPlayer _target)};
		default { false };
	};
	_return
};
false;