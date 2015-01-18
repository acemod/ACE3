/**
 * fnc_handleTreatment_Action_tourniquet.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_caller","_target","_part","_selectionName","_removeItem", "_tourniquets"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

systemChat format["fnc_handleTreatment_Action_tourniquet %1", _this];

_part =    [_selectionName] call FUNC(getBodyPartNumber);
if (_part == 0 || _part == 1) exitwith {
    [_caller,"You cannot apply a CAT on this body part!"] call EFUNC(common,sendHintTo);
    false;
};

[_caller, _target, _removeItem] call FUNC(useEquipment);

_tourniquets = [_target, QGVAR(tourniquets)] call EFUNC(common,getDefinedVariable);
if ((_tourniquets select _part) > 0) exitwith {
    [_caller,"There is already a tourniquet on this body part!"] call EFUNC(common,sendHintTo);
    false;
};

[_caller, _unit,_removeItem] call FUNC(useEquipment);
[[_caller, _target, _selectionName, _removeItem], QUOTE(FUNC(handleTreatment_Action_TourniquetLocal)), _unit] call EFUNC(common,execRemoteFnc);

true