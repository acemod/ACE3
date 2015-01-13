/**
 * fn_addToTriageList_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_caller","_type","_activity","_log"];
_unit = _this select 0;
_newItem = _this select 1;

if (!local _unit) exitwith {
	[_this, "FUNC(addToTriageList_CMS)", _unit, false] spawn BIS_fnc_MP;
};

_log = [_unit,QGVAR(triageCard)] call EFUNC(common,getDefinedVariable);
_inList = false;
_counter = 0;
{
	if ((_x select 0) == _newItem) exitwith {
		_info = _log select _counter;
		_info set [1,(_info select 1) + 1];
		_log set [ _counter, _info];
		_inList = true;
	};
	_counter = _counter + 1;
}foreach _log;
if (!_inList) then {
	_log pushback [_newItem,1];
};
[_unit,QGVAR(triageCard),_log] call EFUNC(common,setDefinedVariable);