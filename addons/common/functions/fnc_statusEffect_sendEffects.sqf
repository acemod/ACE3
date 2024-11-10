#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Sends all status effects for an object (can be run on non-local objects)
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Effect name (or "" to send all) <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, ""] call ace_common_fnc_statusEffect_sendEffects
 *
 * Public: No
 */

params [["_object", objNull, [objNull]], ["_effectName", "", [""]]];
TRACE_2("params",_object,_effectName);

if (isNull _object) exitWith {};

if (_effectName == "") exitWith { // Recurse through all possible effects
    {
        [_object, _x] call FUNC(statusEffect_sendEffects)
    } forEach (keys GVAR(statusEffects)); 
};


private _effectVarName = format [QGVAR(effect_%1), _effectName];
private _effectNumber = _object getVariable [_effectVarName, -1];

// We only do anything if the effect has been defined at some point in the game for this unit
TRACE_2("checking if event is nil",_effectName,_effectNumber);
if (_effectNumber != -1) then {
    (GVAR(statusEffects) get toLowerANSI _effectName) params ["_isGlobal", "_sendJIP", "_eventName"];
    switch (true) do {
        case (_sendJIP): {
            TRACE_2("Sending Global JIP Event",_object,_effectNumber);
            private _jipID = format [QGVAR(effect_%1_%2), _eventName, hashValue _object];
            [_eventName, [_object, _effectNumber], _jipID] call CBA_fnc_globalEventJIP;
            [_jipID, _object] call CBA_fnc_removeGlobalEventJIP;
        };
        case (_isGlobal): {
            TRACE_2("Sending Global Event",_object,_effectNumber);
            [_eventName, [_object, _effectNumber]] call CBA_fnc_globalEvent;
        };
        default {
            TRACE_2("Sending Target Event",_object,_effectNumber);
            [_eventName, [_object, _effectNumber], _object] call CBA_fnc_targetEvent;
        };
    };
};
