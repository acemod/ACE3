/*
 * Author: Glowbal
 * IV Treatment callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 *
 * Return Value:
 * Succesful treatment started <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_caller", "_target", "_selectionName", "_className", "_items", "_removeItem"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_items = _this select 4;

if (count _items == 0) exitwith {};

if ([_caller, _target, _items] call FUNC(useItems)) then {
    [[_target, _className], QUOTE(DFUNC(treatmentBandageLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
    {
        if (_x != "") then {
            [_target, _x] call FUNC(addToTriageCard);
        };
    }foreach _items;

    ["Medical_treatmentCompleted", [_caller, _target, _selectionName, _className, true]] call ace_common_fnc_localEvent;
    [_target, "activity", "STR_ACE_HAS_BANDAGED_ACTIVITY", [[_caller] call EFUNC(common,getName)]] call FUNC(addToLog);
};

true;
