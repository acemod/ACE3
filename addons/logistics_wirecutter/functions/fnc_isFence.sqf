/*
 * Author: PabstMirror
 * Checks if object is a fence.  Should work on any fence type, even (typeOf == "").
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

private ["_typeOf", "_returnValue"];

_typeOf = typeOf _object;
_returnValue = false;

if (_typeOf != "") then {
    //If the fence has configEntry we can check it directly
    _returnValue = (1 == (getNumber (configFile >> "CfgVehicles" >> _typeOf >> QGVAR(isFence))));
} else {
    //TODO: 1.50 use getModelInfo
    _typeOf = toLower (str _object);  //something like "123201: wall_indfnc_9.p3d"
    {
        if ((_typeOf find _x) != -1) exitWith {
            _returnValue = true;
        };
        nil
    } count FENCE_P3DS;
};

_returnValue
