#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Update Memory of Kestrel
 *
 * Arguments:
 * 0: Slot <NUMBER>
 * 1: Value <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [1, "test"] call ace_kestrel4500_fnc_updateMemory
 *
 * Public: No
 */
params ["_slot", "_value"];
GVAR(MIN)   set [_slot, (GVAR(MIN) select _slot) min _value];
GVAR(MAX)   set [_slot, _value max (GVAR(MAX) select _slot)];
GVAR(TOTAL) set [_slot, (GVAR(TOTAL) select _slot) + _value];
