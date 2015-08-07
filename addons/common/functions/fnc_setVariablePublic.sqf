/*
 * Author: commy2
 *
 * Sets a public variable, but wait a certain amount of ACE_time to transfer the value over the network. Changing the value by calling this function again resets the windup timer.
 *
 * Argument:
 * 0: Object the variable should be assigned to (Object)
 * 1: Name of the variable (String)
 * 2: Value of the variable (Any)
 * 3: Windup ACE_time (Number, optional. Default: 1)
 *
 * Return value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_idName", "_allIdNames", "_syncTime"];
params ["_object", "_varName", "_value", ["_sync", 1]];

// set value locally
_object setVariable [_varName, _value];

// "duh"
if (!isMultiplayer) exitWith {};

// generate stacked eventhandler id

_idName = format ["ACE_setVariablePublic_%1", _varName];

// exit now if an eh for that variable already exists
_allIdNames = [GETMVAR(BIS_stackedEventHandlers_onEachFrame,[]), {_this select 0}] call FUNC(map);

if (_idName in _allIdNames) exitWith {};

// when to push the value
_syncTime = ACE_diagTime + _sync;

// add eventhandler
[_idName, "onEachFrame", {
    params ["_object", "_varName", "_syncTime", "_idName"];
    // wait to sync the variable
    if (ACE_diagTime > _syncTime) then {
        // set value public
        _object setVariable [_varName, _object getVariable _varName, true];

        // remove eventhandler
        [_idName, "onEachFrame"] call BIS_fnc_removeStackedEventHandler
    };
}, [_object, _varName, _syncTime, _idName]] call BIS_fnc_addStackedEventHandler; // replace with CBA if Posible?
