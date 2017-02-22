/*
 * Author: commy2 and CAA-Picard and joko and PabstMirror
 * Publish a variable, but wait a certain amount of time before allowing it to be published it again.
 *
 * Arguments:
 * 0: Object the variable should be assigned to <OBJECT>
 * 1: Name of the variable <STRING>
 * 2: Value of the variable <ANY>
 * 3: Embargo delay <NUMBER> (Optional. Default: 1)
 *
 * Return Value:
 * Nothing.
 *
 * Example:
 * [player, "balls", 2, 1] call ace_common_fnc_setVariablePublic;
 *
 * Public: No
 */
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

params ["_object", "_varName", "_value", ["_delay", 1]];
TRACE_4("params",_object,_varName,_value,_delay);

// set value locally
_object setVariable [_varName, _value];

// Exit if in SP - "duh"
if (!isMultiplayer) exitWith {};

// If we are on embargo, exit
if (_object isEqualTo (_object getVariable [format ["ACE_onEmbargo_%1", _varName], objNull])) exitWith {};

// Publish Now and set last update time:
_object setVariable [_varName, _value, true];
_object setVariable [format ["ACE_onEmbargo_%1", _varName], _object];

TRACE_2("Starting Embargo", _varName, _delay);

[{
    params ["_object", "_varName", "_value"];
    if (isNull _object) exitWith {TRACE_1("objNull",_this);};

    _object setVariable [format ["ACE_onEmbargo_%1", _varName], nil]; //Remove Embargo
    private _curValue = _object getVariable _varName;

    TRACE_4("End of embargo", _object, _varName, _value, _curValue);

    //If value at start of embargo doesn't equal current, then broadcast and start new embargo
    if (!(_value isEqualTo _curValue)) then {
        _this set [2, _curValue];
        _this call FUNC(setVariablePublic);
    };
}, _this, _delay] call CBA_fnc_waitAndExecute;
