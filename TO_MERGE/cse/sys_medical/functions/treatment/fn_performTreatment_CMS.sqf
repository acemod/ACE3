/**
 * fn_performTreatment_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_unit","_caller","_treatment","_removeOnSuccess","_params"];
_caller = _this select 0;
_unit = _this select 1;
_treatment = _this select 2;
_removeOnSuccess = _this select 3;

CMS_PERFORMING_TREATMENT = true;
if (!isnil "_removeOnSuccess") then {

	if (([_caller,_removeOnSuccess] call cse_fnc_hasMagazine)) then {
		_params = [_unit,_caller, (call cse_fnc_getSelectedBodyPart_CMS),_removeOnSuccess];
		[_params, _treatment, _unit, false] spawn BIS_fnc_MP;
	};
    [//-1, cms_fnc_clutter, [_unit, _removeOnSuccess]] call CBA_fnc_globalExecute;
};
call cms_ui_hideSubMenus;
// waituntil {(!CMS_PERFORMING_TREATMENT || time>5 seconds)};
//sleep 5;
CMS_PERFORMING_TREATMENT = false;