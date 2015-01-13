/**
 * fn_updateIcons_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_display","_startIDC","_idc","_options","_name","_amount"];
disableSerialization;
_display = uiNamespace getVariable 'cse_sys_medicalMenu';
_startIDC = 111;

_options = ["triage" , "examine", "bandage", "medication", "airway", "advanced", "drag", "toggle"];
for "_idc" from _startIDC to 118 step 1 do
{
	_name = _options select (_idc - 111);
	_amount = switch (_name) do {
		case "advanced": {[_name] call cse_fnc_getAdvancedOptions_CMS};
		case "examine": {[_name] call cse_fnc_getExamineOptions_CMS};
		case "bandage": {[_name] call cse_fnc_getBandageOptions_CMS};
		case "medication": {[_name] call cse_fnc_getMedicationOptions_CMS};
		case "airway": {[_name] call cse_fnc_getAirwayOptions_CMS};
		case "triage": {[_name] call cse_fnc_getTriageCardOptions_CMS};
		case "drag": {[_name] call cse_fnc_getDragOptions_CMS};
		case "toggle": {[_name] call cse_fnc_getToggleOptions_CMS};
		default {[]};
	};
	if ((count _amount) > 0 || _idc == 111 || _idc == 118) then {
		(_display displayCtrl _idc) ctrlSettextColor [1,1,1,1];
	} else {
		(_display displayCtrl _idc) ctrlSettextColor [0.4,0.4,0.4,1];
	};
};