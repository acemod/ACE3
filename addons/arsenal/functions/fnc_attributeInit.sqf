#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Initializes the objects 3DEN's ace arsenal attribute at scenario start.
 *
 * Arguments:
 * 0: Attribute target <OBJECT>
 * 1: Attribute value <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [box, [[], 1]] call ace_arsenal_fnc_attributeInit
 *
 * Public: No
 */

params ["_object", "_value"];
_value params ["_items", "_mode"];
TRACE_2("Initializing object with attribute",_object,_value);

if (_mode > 0) then {
    // Blacklist: add full arsenal and take items away
    [_object, true, true] call FUNC(initBox);

    // Wait until all items have been added, so that the blacklisted items can be removed
    [{
        !isNil {(_this select 0) getVariable QGVAR(virtualItems)}
    }, {
        [_this select 0, _this select 1, true] call FUNC(removeVirtualItems);
    }, [_object, _items], 20] call CBA_fnc_waitUntilAndExecute; // 20s timeout in case of failure
} else {
     // Exit on whitelist mode with no items
    if (_items isEqualTo []) exitWith {};

    // Whitelist: add only selected items
    [_object, _items, true] call FUNC(initBox);
};
