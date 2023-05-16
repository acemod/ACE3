#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Checks if object is a fence. Should work on any fence type, even when (typeOf == "").
 * Call is fairly expensive because of string checking.
 *
 * Arguments:
 * 0: Object to test <OBJECT>
 *
 * Return Value:
 * Is fence <BOOL>
 *
 * Example:
 * [cursorObject] call ace_logistics_wirecutter_fnc_isFence
 *
 * Public: No
 */

params ["_object"];
TRACE_1("Checking if fence",_object);

private _configOf = configOf _object;
if !(isNull _configOf) then {
    // Check for isFence entry since we have valid configOf
    if (getNumber (_configOf >> QGVAR(isFence)) == 1) exitWith { true };
};

// Check the p3d name against list (in script_component.hpp)
(getModelInfo _object select 0) in FENCE_P3DS // return
