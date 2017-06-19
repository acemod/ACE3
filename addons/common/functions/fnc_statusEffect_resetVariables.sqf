/*
 * Author: PabstMirror
 * Resets all effect numbers to 0 when an object respawns (but does not apply the effect event).
 *
 * Arguments:
 * 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true] call ace_common_fnc_statusEffect_resetVariables
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params [["_object", objNull, [objNull]], ["_setObjectRef", false, [false]]];
TRACE_2("params",_object,_setObjectRef);

if (isNull _object) exitWith {};

private _objectRef = _object getVariable QGVAR(statusEffect_object);
TRACE_2("testing",_object,_objectRef);

// If nothing was ever set, or objects match, exit (always true unless respawned)
if (isNil "_objectRef") exitWith {
    if (_setObjectRef) then {
        _object setVariable [QGVAR(statusEffect_object), _object, true]; //explicitly set new object ref
    };
};
if (_object == _objectRef) exitWith {};

//Mismatch, so if effect has ever been defined, reset to 0
{
    private _effectVarName = format [QGVAR(effect_%1), _x];
    private _effectNumber = _object getVariable [_effectVarName, -1];
    if (_effectNumber != -1) then {
        TRACE_2("forced reset defined array on object mismatch",_x,_effectNumber);
        _object setVariable [_effectVarName, 0, true]; //This always resets to 0 (not -1/nil)!
    };
} forEach GVAR(statusEffect_Names);

_object setVariable [QGVAR(statusEffect_object), _object, true];
