#include "..\script_component.hpp"
/*
 * Author: mharis001
 * Returns the refill action offset for given object.
 *
 * Arguments:
 * 0: Water source <OBJECT>
 *
 * Return Value:
 * Action offset <ARRAY>
 *
 * Example:
 * [cursorObject] call ace_field_rations_fnc_getActionOffset
 *
 * Public: No
 */

params ["_object"];

private _configOf = configOf _object;
if (isNull _configOf) then {
    // Check for offset corresponding to p3d list
    GVAR(cacheP3Ds) getOrDefault [getModelInfo _object select 0, [0, 0, 0]]
} else {
    // Check for offset in config since we have valid typeOf
    private _offset = getArray (_configOf >> QXGVAR(offset));
    if (_offset isEqualTo []) then {[0, 0, 0]} else {_offset};
};
