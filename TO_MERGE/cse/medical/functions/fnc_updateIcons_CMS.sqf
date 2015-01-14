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
_display = uiNamespace getVariable QGVAR(medicalMenuIDD);
_startIDC = 111;

_options = ["triage" , "examine", "bandage", "medication", "airway", "advanced", "drag", "toggle"];
for "_idc" from _startIDC to 118 step 1 do
{
	_name = _options select (_idc - 111);
	_amount = switch (_name) do {
		case "advanced": {[_name] call FUNC(getAdvancedOptions_CMS)};
		case "examine": {[_name] call FUNC(getExamineOptions_CMS)};
		case "bandage": {[_name] call FUNC(getBandageOptions_CMS)};
		case "medication": {[_name] call FUNC(getMedicationOptions_CMS)};
		case "airway": {[_name] call FUNC(getAirwayOptions_CMS)};
		case "triage": {[_name] call FUNC(getTriageCardOptions_CMS)};
		case "drag": {[_name] call FUNC(getDragOptions_CMS)};
		case "toggle": {[_name] call FUNC(getToggleOptions_CMS)};
		default {[]};
	};
	if ((count _amount) > 0 || _idc == 111 || _idc == 118) then {
		(_display displayCtrl _idc) ctrlSettextColor [1,1,1,1];
	} else {
		(_display displayCtrl _idc) ctrlSettextColor [0.4,0.4,0.4,1];
	};
};