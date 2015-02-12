/*
 * Author: commy2 and CAA-Picard
 * Publish a variable, but wait a certain amount of time before allowing it to be published it again.
 *
 * Argument:
 * 0: Object the variable should be assigned to <OBJECT>
 * 1: Name of the variable <STRING>
 * 2: Value of the variable <ANY>
 * 3: Embargo delay <NUMBER> (Optional. Default: 1)
 *
 * Return value:
 * Nothing.
 *
 * Public: No
 */
#include "script_component.hpp"

EXPLODE_4_PVT(_this,_object,_varName,_value,_delay);

if (isNil "_delay") then {
    _delay = 1;
};

// set value locally
_object setVariable [_varName, _value];

// "duh"
if (!isMultiplayer) exitWith {};

// Generate object variable to store embargo status
private "_embargoTimeVarName";
_embargoTimeVarName = format ["ACE_PE_%1", _varName];

// If we are on embargo, exit
if !(isNil {_object getVariable _embargoTimeVarName}) exitWith {};

// Publish
_object setVariable [_varName, _value, true];

// Generate embargo PFH
_object setVariable [_embargoTimeVarName, diag_tickTime + _delay];

[{
    EXPLODE_5_PVT(_this select 0,_object,_varName,_value,_delay,_embargoTimeVarName);

    if (diag_tickTime < (_object getVariable _embargoTimeVarName)) exitWith {};

    // If the value has changed since last update
    if !(_value isEqualTo (_object getVariable _varName)) then {
        // Republish new value and reset embargo
        _object setVariable [_varName, (_object getVariable _varName), true];
        _object setVariable [_embargoTimeVarName, diag_tickTime + _delay];
    } else {
        // Remove embargo
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        _object setVariable [_embargoTimeVarName, nil];
    };

}, 0.1, [_object, _varName, _value, _delay, _embargoTimeVarName]] call CBA_fnc_addPerFrameHandler;
