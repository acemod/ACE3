/**
 * fn_ivLocal_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_treatingPerson","_injuredPerson","_selectionName","_removeItem","_attributes","_patient", "_value"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;



_attributes = switch (_removeItem) do {
	case "cse_blood_iv": {[QGVAR(bloodIVVolume),1000,"Blood IV"]};
	case "cse_saline_iv": {[QGVAR(salineIVVolume),1000,"Saline IV"]};
	case "cse_plasma_iv": {[QGVAR(plasmaIVVolume),1000,"Plasma IV"]};

	case "cse_blood_iv_500": {[QGVAR(bloodIVVolume),500,"Blood IV"]};
	case "cse_saline_iv_500": {[QGVAR(salineIVVolume),500,"Saline IV"]};
	case "cse_plasma_iv_500": {[QGVAR(plasmaIVVolume),500,"Plasma IV"]};

	case "cse_blood_iv_250": {[QGVAR(bloodIVVolume),250,"Blood IV"]};
	case "cse_saline_iv_250": {[QGVAR(salineIVVolume),250,"Saline IV"]};
	case "cse_plasma_iv_250": {[QGVAR(plasmaIVVolume),250,"Plasma IV"]};

	default {[]};
};
if (count _attributes > 1) then {

	_value = [_injuredPerson,(_attributes select 0)] call EFUNC(common,getDefinedVariable);
	_value = _value + (_attributes select 1);
	[format["Has given patient: %1",[_value, _attributes select 0, _attributes select 1]]] call EFUNC(common,debug);
	[_injuredPerson,(_attributes select 0),_value] call EFUNC(common,setDefinedVariable);
	[format["Confirm: %1",[_injuredPerson getvariable [_attributes select 0, 0], _injuredPerson]]] call EFUNC(common,debug);

	_patient = "patient";
	if (_injuredPerson == _treatingPerson) then {
		_patient = "himself";
	};
	[_injuredPerson,"treatment",format["%1 has given %4 a %2(%3ml)",[_treatingPerson] call EFUNC(common,getName),_attributes select 2,_attributes select 1,_patient]] call FUNC(addActivityToLog_CMS);
	[_injuredPerson,_removeItem] call FUNC(addToTriageList_CMS);
};