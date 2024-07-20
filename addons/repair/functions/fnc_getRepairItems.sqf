#include "..\script_component.hpp"
/*
 * Author: veteran29
 * Returns the items required for repair.
 *
 * Arguments:
 * 0: Repair config <CONFIG>
 *
 * Return Value:
 * 0: Required items <ARRAY>
 *
 * Example:
 * [_config] call ace_repair_fnc_getRepairItems
 *
 * Public: No
 */

params [["_config", configNull]];

// Items can be an array of required items or a string to a missionNamespace variable
private _items = if (isArray (_config >> "items")) then {
    getArray (_config >> "items");
} else {
    missionNamespace getVariable [getText (_config >> "items"), []]
};

// handle "any toolkit" setting
if (_items isEqualTo [ANY_TOOLKIT_FAKECLASS]) then {
    TRACE_1("any toolkit",_items);

    // array element inside items array means "any of these items"
    _items = [GVAR(allToolKits)];
};

TRACE_2("get repair items",_config,_items);

_items
