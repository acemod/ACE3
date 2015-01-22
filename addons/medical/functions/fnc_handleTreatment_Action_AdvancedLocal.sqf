/**
 * fnc_handleTreatment_Action_AdvancedLocal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit", "_caller", "_selectionName", "_removeItem", "_prevAnim", "_value"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;
_prevAnim = _this select 4;

// TODO old code, has to be replaced by something more dynamic.
_attributes = switch (_removeItem) do {
    case "ACE_blood_iv": {[QGVAR(bloodIVVolume),1000,"Blood IV"]};
    case "ACE_saline_iv": {[QGVAR(salineIVVolume),1000,"Saline IV"]};
    case "ACE_plasma_iv": {[QGVAR(plasmaIVVolume),1000,"Plasma IV"]};

    case "ACE_blood_iv_500": {[QGVAR(bloodIVVolume),500,"Blood IV"]};
    case "ACE_saline_iv_500": {[QGVAR(salineIVVolume),500,"Saline IV"]};
    case "ACE_plasma_iv_500": {[QGVAR(plasmaIVVolume),500,"Plasma IV"]};

    case "ACE_blood_iv_250": {[QGVAR(bloodIVVolume),250,"Blood IV"]};
    case "ACE_saline_iv_250": {[QGVAR(salineIVVolume),250,"Saline IV"]};
    case "ACE_plasma_iv_250": {[QGVAR(plasmaIVVolume),250,"Plasma IV"]};

    default {[]};
};

if (count _attributes > 1) then {
    _value = [_target,(_attributes select 0)] call EFUNC(common,getDefinedVariable);
    _value = _value + (_attributes select 1);
    [_target,(_attributes select 0),_value] call EFUNC(common,setDefinedVariable);

    // TODO localization
    [_target,"treatment",format["%1 has given %4 a %2(%3ml)",[_caller] call EFUNC(common,getName),_attributes select 2,_attributes select 1,_target]] call FUNC(addActivityToLog);
    [_target,_removeItem] call FUNC(addToTriageList);
};
