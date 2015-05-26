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
 * Nothing.
 */
#include "script_component.hpp"

PARAMS_4(_object,_varName,_value,_sync);

if (isNil "_sync") then {
    _sync = 1;
};

// set value locally
_object setVariable [_varName, _value];

// "duh"
if (!isMultiplayer) exitWith {};

// generate stacked eventhandler id
private "_idName";
_idName = format ["ACE_setVariablePublic_%1", _varName];

// exit now if an eh for that variable already exists
private "_allIdNames";
_allIdNames = [GETMVAR(BIS_stackedEventHandlers_onEachFrame,[]), {_this select 0}] call FUNC(map);

if (_idName in _allIdNames) exitWith {};

// when to push the value
private "_syncTime";
_syncTime = ACE_diagTime + _sync;

// add eventhandler
[_idName, "onEachFrame", {
    // wait to sync the variable
    if (ACE_diagTime > _this select 2) then {
        // set value public
        (_this select 0) setVariable [_this select 1, (_this select 0) getVariable (_this select 1), true];

        // remove eventhandler
        [_this select 3, "onEachFrame"] call BIS_fnc_removeStackedEventHandler
    };
}, [_object, _varName, _syncTime, _idName]] call BIS_fnc_addStackedEventHandler;
nil
