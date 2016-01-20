/*
 * Author: commy2
 * Set the captivity status of an unit. This allows the handling of more than one reason to set a unit captive.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: The reason of the captivity <STRING>
 * 2: Is the reason still valid? True for setting this reason, false for removing it <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_reason", "_status"];

private _captivityReasons = missionNamespace getVariable ["ACE_captivityReasons", []];

// register new reason (these reasons are shared publicly, since units can change ownership, but keep their captivity status)
if !(_reason in _captivityReasons) then {
    _captivityReasons pushBack _reason;

    ACE_captivityReasons = _captivityReasons;
    publicVariable "ACE_captivityReasons";
};

// get reasons why the unit is captive already and update to the new status
private _unitCaptivityReasons = _unit call FUNC(getCaptivityStatus);

private _captivityReasonsBooleans = [];

{
    _captivityReasonsBooleans set [_forEachIndex, (_captivityReasons select _forEachIndex) in _unitCaptivityReasons];
} forEach _captivityReasons;

_captivityReasonsBooleans set [_captivityReasons find _reason, _status];

private _bitmask = _captivityReasonsBooleans call FUNC(toBitmask);

// actually apply the setCaptive command globaly
[[_unit, _bitmask], "{(_this select 0) setCaptive (_this select 1)}", _unit] call FUNC(execRemoteFnc);
