#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Disarm Event Handler, Starting func, called on the target.
 * If target has to remove uniform/vest, this will add all uniform/vest items to the drop list.
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Target <OBJECT>
 * 2: Item to remove (even if it's 1 item, array is kept for BWC) <ARRAY of STRING>
 * 3: Amount of item to remove (not used) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, cursorTarget, [vest cursorTarget], 1] call ace_disarming_fnc_eventTargetStart
 *
 * Public: No
 */

params ["_caller", "_target", "_itemToRemove"];

{
    switch (true) do {
        case (_x == (uniform _target)): {
            _itemToRemove append (uniformItems _target);
        };
        case (_x == (vest _target)): {
            _itemToRemove append (vestItems _target);
        };
    };
} forEach _itemToRemove;

[_caller, _target, _itemToRemove arrayIntersect _itemToRemove] call FUNC(disarmDropItems);
