/*
 * Author: PabstMirror
 * Sends all status effects for an object (can be run on non-local objects)
 *
 * Arguments:
 * 0: Object <OBJECT>
 * 1: Effect name (or "" or send all) <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, ""] call ace_common_fnc_statusEffect_sendEffects
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params [["_object", objNull, [objNull]], ["_effectName", "", [""]]];
TRACE_2("params",_object,_effectName);

if (isNull _object) exitWith {};

{
    if ((_effectName == "") || {_effectName == _x}) then {
        private _effectVarName = format [QGVAR(effect_%1), _x];
        private _effectNumber = _object getVariable [_effectVarName, -1];

        //We only do anything if the effect has been defined at some point in the game for this unit
        TRACE_2("checking if event is nil",_x,_effectNumber);
        if (_effectNumber != -1) then {
            if (GVAR(statusEffect_isGlobal) select _forEachIndex) then {
                TRACE_2("Sending Global Event", _object, _effectNumber);
                [_x, [_object, _effectNumber]] call FUNC(globalEvent);
            } else {
                if (local _object) then {
                    //If local, send directly to bypass network delay of targetEvent call
                    TRACE_2("Sending Target Local Event", _object, _effectNumber);
                    [_x, [_object, _effectNumber]] call FUNC(localEvent);
                } else {
                    TRACE_2("Sending Target Non-Local Event", _object, _effectNumber);
                    [_x, [_object], [_object, _effectNumber]] call FUNC(targetEvent);
                };
            };
        };
    };
} forEach GVAR(statusEffect_Names);
