#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Retrives list of current status effects
 *
 * Arguments:
 * 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 1: Effect Name <STRING>
 *
 * Return Value:
 * Effect status <ARRAY>
 *  0: is activly set (if false, the effect is ignored and never modified) <BOOL>
 *  1: reasons why it is set true (list of strings, count of 0 = false, 1+ = true) <ARRAY>
 *
 * Example:
 * [player, "forceWalk"] call ace_common_fnc_statusEffect_get
 *
 * Public: Yes
 */

params [["_object", objNull, [objNull]], ["_effectName", "", [""]]];
TRACE_2("params",_object,_effectName);

if (isNull _object) exitWith {
    TRACE_1("null",_object);
    [false, []]
};

[_object, false] call FUNC(statusEffect_resetVariables); //Check for mismatch

//List of reasons
private _statusReasons = missionNamespace getVariable [(format [QGVAR(statusEffects_%1), _effectName]), []];
if (_statusReasons isEqualTo []) exitWith {
    TRACE_1("no reasons - bad effect?",_statusReasons);
    [false, []]
};

//Get Effect Number
private _effectVarName = format [QGVAR(effect_%1), _effectName];
private _effectNumber = _object getVariable [_effectVarName, -1];
TRACE_2("current",_effectVarName,_effectNumber);

if (_effectNumber == -1) exitWith { //Nil array - no effect
    [false, []]
};
if (_effectNumber == 0) exitWith { //empty array - false effect
    [true, []]
};

//if no change: skip sending publicVar and events
private _effectBoolArray = [_effectNumber, count _statusReasons] call FUNC(binarizeNumber);
TRACE_2("bitArray",_statusIndex,_effectBoolArray);

private _activeEffects = [];
{
    if (_x) then {
        _activeEffects pushBack (_statusReasons select _forEachIndex);
    };
} forEach _effectBoolArray;

//non-empty array - true effect
[true, _activeEffects]
