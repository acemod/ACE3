/*
 * Author: commy2 and joko // Jonas
 * Sets a public variable, but wait a certain amount of time to transfer the value over the network. Changing the value by calling this function again resets the windup timer.
 *
 * Arguments:
 * 0: Object the variable should be assigned to <OBJECT>
 * 1: Name of the variable <STRING>
 * 2: Value of the variable <ANY>
 * 3: Windup time <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_object", "_varName", "_value", ["_sync", 1]];

// set value locally
_object setVariable [_varName, _value];

// Exit if in SP
if (!isMultiplayer) exitWith {};

private ["_idName", "_syncTime"];

_idName = format ["ACE_setVariablePublic_%1", _varName];

if (_idName in GVAR(setVariableNames)) exitWith {};

_syncTime = ACE_diagTime + _sync;

GVAR(setVariableNames) pushBack _idName;

GVAR(setVariablePublicArray) pushBack [_object, _varName, _syncTime, _idName];

if (isNil QGVAR(setVariablePublicPFH)) exitWith {};

GVAR(setVariablePublicPFH) = [{
    {
        _x params ["_object", "_varName", "_syncTime", "_idName"];
        if (ACE_diagTime > _syncTime) then {
            // set value public
            _object setVariable [_varName, _object getVariable _varName, true];
            GVAR(setVariablePublicArray) deleteAt (GVAR(setVariablePublicArray) find _x);
            GVAR(setVariableNames) deleteAt (GVAR(setVariableNames) find _x);
        };
        nil
    } count +GVAR(setVariablePublicArray);

    if (GVAR(setVariablePublicArray) isEqualTo []) then {
        [GVAR(setVariablePublicPFH)] call CBA_fnc_removePerFrameHandler;
        GVAR(setVariablePublicPFH) = nil;
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
