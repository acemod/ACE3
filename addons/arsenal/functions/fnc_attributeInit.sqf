#include "script_component.hpp"
/*
 * Author: mharis001
 * Initializes the objects 3DEN attribute at scenario start.
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
    // Blacklist: all full arsenal and take items away
    [_object, true, true] call FUNC(initBox);
    [_object, _items, true] call FUNC(removeVirtualItems);
} else {
     // Exit on whitelist mode with no items
    if (_items isEqualTo []) exitWith {};

    // Whitelist: add only selected items
    [_object, _items, true] call FUNC(initBox);
};
