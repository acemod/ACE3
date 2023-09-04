#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Checks if healer has items
 *
 * Arguments:
 * 0: Healer <OBJECT>
 * 1: Treatment Type <STRING>
 *
 * Return Value:
 * 0: Has Item <BOOL>
 * 1: Item Classname <STRING>
 * 2: Treatment <STRING>
 *
 * Example:
 * [cursorObject, "@bandage"] call ACE_medical_ai_fnc_itemCheck
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
