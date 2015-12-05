/*
 * Author: PabstMirror
 * Checks if object is a fence.  Should work on any fence type, even (typeof == "").
 * Call is fairly expensive because of all of the string checking.
 *
 * Arguments:
 * 0: An Object To Test <OBJECT>
 *
 * Return Value:
 * Is it a fence <BOOL>
 *
 * Example:
 * [aFence] call ace_logistics_wirecutter_fnc_isFence
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object"];
TRACE_1("params",_object);

private _typeOf = typeOf _object;

private _returnValue = if (_typeOf != "") then {
    //If the fence has configEntry we can check it directly
    (1 == (getNumber (configFile >> "CfgVehicles" >> _typeOf >> QGVAR(isFence))));
} else {
    //Check the p3d name against list (in script_component.hpp)
    ((getModelInfo _object) select 0) in FENCE_P3DS;
};

_returnValue
