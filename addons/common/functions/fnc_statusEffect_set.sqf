/*
 * Author: PabstMirror
 * Adds or removes an id to a status effect and will send an event to apply.
 *
 * Arguments:
 * 0: vehicle that it will be attached to (player or vehicle) <OBJECT>
 * 1: Effect Name <STRING>
 * 2: Unique Reason ID <STRING>
 * 3: Is Set (true adds/false removes) <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "setCaptive", "reason1", true] call ace_common_fnc_statusEffect_set
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_object", objNull, [objNull]], ["_effectName", "", [""]], ["_ID", "", [""]], ["_set", true, [false]]];
TRACE_4("params",_object,_effectName,_ID,_set);

//Only run this after the settings are initialized
if !(GVAR(settingsInitFinished)) exitWith {
    TRACE_1("pushing to runAtSettingsInitialized", _this);
    GVAR(runAtSettingsInitialized) pushBack [FUNC(statusEffect_set), _this];
};

if (isNull _object) exitWith {TRACE_1("null",_object);};

[_object, true] call FUNC(statusEffect_resetVariables); //Check for mismatch, and set object ref

//check ID case and set globally if not already set:
_ID = toLower _ID;
private _statusReasons = missionNamespace getVariable [(format [QGVAR(statusEffects_%1), _effectName]), []];
private _statusIndex = _statusReasons find _ID;
if (_statusIndex == -1) then {
    TRACE_2("ID not in global reasons, adding",_statusReasons,_ID);
    _statusIndex = _statusReasons pushBack _ID;
    missionNamespace setVariable [(format [QGVAR(statusEffects_%1), _effectName]), _statusReasons, true];
};

private _effectVarName = format [QGVAR(effect_%1), _effectName];
private _effectNumber = _object getVariable [_effectVarName, -1];
TRACE_2("current",_effectVarName,_effectNumber);

if ((_effectNumber == -1) && {!_set}) exitWith {
    //Optimization for modules that always set an ID to false even if never set true
    TRACE_2("Set False on nil array, exiting",_set,_effectNumber);
};

if (_effectNumber == -1) then {_effectNumber = 0}; //reset (-1/nil) to 0

//if no change: skip sending publicVar and events
private _effectBoolArray = [_effectNumber, count _statusReasons] call FUNC(binarizeNumber);
TRACE_2("bitArray",_statusIndex,_effectBoolArray);
if (_set isEqualTo (_effectBoolArray select _statusIndex)) exitWith {
    TRACE_2("No Change, exiting",_set,_effectBoolArray select _statusIndex);
};

TRACE_2("Setting to new value",_set,_effectBoolArray select _statusIndex);
_effectBoolArray set [_statusIndex, _set];
private _newEffectNumber = _effectBoolArray call FUNC(toBitmask); //Convert array back to number

TRACE_2("Saving globally",_effectVarName,_newEffectNumber);
_object setVariable [_effectVarName, _newEffectNumber, true];

if (_effectNumber == 0 || {_newEffectNumber == 0}) then {
    [_object, _effectName] call FUNC(statusEffect_sendEffects);
} else {
    LOG("not sending more than once");
};
