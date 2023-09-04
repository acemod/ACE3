#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut, PabstMirror
 * Applies healing to target
 *
 * Arguments:
 * 0: Healer <OBJECT>
 * 1: Treatment Type <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [a, b] call ACE_medical_ai_fnc_healingLogic
 *
 * Public: No
 */

params ["_healer", "_treatementType"];

if (GVAR(ignoreItemRequirements)) exitWith { [true] };

private _return = [false];
private _items = _healer call EFUNC(common,uniqueItems);
private _treatment = GVAR(itemHash) get _treatementType;
{
    if (_x in _items) exitWith {
        _return = [true, _x, _y];
    };
} forEach _treatment;

_return
