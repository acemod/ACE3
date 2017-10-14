/*
 * Author: commy2
 * Executed when the filter list box is changed.
 * Sets new filter list index.
 *
 * Arguments:
 * 0: Filter list box <CONTROL>
 * 1: Filter list index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [CONTROL, 5] call ACE_inventory_fnc_onLBSelChanged
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
params ["_filter", "_index"];

GVAR(selectedFilterIndex) = _index;

[{
    disableSerialization;
    params ["_display"];

    [_display] call FUNC(forceItemListUpdate);
}, [ctrlParent _filter]] call CBA_fnc_execNextFrame;
