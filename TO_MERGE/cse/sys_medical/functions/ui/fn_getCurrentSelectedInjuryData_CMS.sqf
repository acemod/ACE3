/**
 * fn_getCurrentSelectedInjuryData_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_return", "_current"];

_return = "";
if (dialog) then {
	_current = lbCurSel 213;
	_return = lbData [213,_current];
};
_return;