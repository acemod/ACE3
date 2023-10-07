#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Checks if AI healer has items
 *
 * Arguments:
 * 0: Healer <OBJECT>
 * 1: Treatment Type <STRING>
 *
 * Return Value:
 * 0: Has Item <BOOL>
 * 1: Item Classname <STRING> (Optional)
 * 2: Treatment <STRING> (Optional)
 *
 * Example:
 * [cursorObject, "@bandage"] call ACE_medical_ai_fnc_itemCheck
 *
 * Public: No
 */

if (GVAR(requireItems) == 0) exitWith { [true] };

params ["_healer", "_treatementType"];

private _return = [false];
private _items = _healer call EFUNC(common,uniqueItems);
private _treatment = GVAR(itemHash) get _treatementType;
{
    if (_x in _items) exitWith {
        _return = [true, _x, _y];
    };
} forEach _treatment;

_return
