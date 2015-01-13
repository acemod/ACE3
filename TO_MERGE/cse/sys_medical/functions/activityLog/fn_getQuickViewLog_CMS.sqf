/**
 * fn_getQuickViewLog_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private["_unit"];
_unit = _this select 0;
_log = [_unit,"cse_quickviewLog_CMS"] call cse_fnc_getVariable;
if (isnil "_log") then {
	_log = [];
};
if (typeName _log != typeName []) then {
	_log = [];
};
_log
