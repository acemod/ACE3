/*
 * Author: Glowbal
 * Apply a tourniquet to the patient
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 *
 * Return Value:
 * <BOOL>
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_caller","_target","_part","_selectionName","_removeItem", "_tourniquets", "_items", "_output"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_items = _this select 4;

if (count _items == 0) exitwith {};

_part = [_selectionName] call FUNC(selectionNameToNumber);
if (_part == 0 || _part == 1) exitwith {
   // [_caller,"You cannot apply a CAT on this body part!"] call EFUNC(common,sendHintTo);
    false;
};

_tourniquets = _target getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]];
if ((_tourniquets select _part) > 0) exitwith {
   _output = "There is already a tourniquet on this body part!"; // TODO localization
   ["displayTextStructured", [_caller], [_output, 1.5, _caller]] call EFUNC(common,targetEvent);
    false;
};

if ([_caller, _target, _items] call FUNC(useItems)) then {
    _removeItem = _items select 0;
    [[_target, _removeItem], QUOTE(DFUNC(treatmentTourniquetLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
    ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _className, true]] call ace_common_fnc_localEvent;
    [_target, _removeItem] call FUNC(addToTriageCard);
    [_target, "activity", "STR_ACE_HAS_APPLIED_TOURNIQUET_ACTIVITY", [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog);
};

true;
