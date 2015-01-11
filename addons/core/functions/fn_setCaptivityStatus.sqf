/*
 * Author: commy2
 *
 * Set the captivity status of an unit. This allows the handling of more than one reason to set a unit captive.
 *
 * Argument:
 * 0: Unit (Object)
 * 1: The reason of the captivity (String)
 * 2: Is the reason still valid? True for setting this reason, false for removing it (Bool)
 *
 * Return value:
 * None.
 */

private ["_unit", "_reason", "_status", "_captivityReasons", "_unitCaptivityReasons", "_captivityReasonsBooleans", "_bitmask"];

_unit = _this select 0;
_reason = _this select 1;
_status = _this select 2;

_captivityReasons = missionNamespace getVariable ["AGM_captivityReasons", []];

// register new reason (these reasons are shared publicly, since units can change ownership, but keep their captivity status)
if !(_reason in _captivityReasons) then {
  _captivityReasons pushBack _reason;

  AGM_captivityReasons = _captivityReasons;
  publicVariable "AGM_captivityReasons";
};

// get reasons why the unit is captive already and update to the new status
_unitCaptivityReasons = [_unit] call GVAR(fnc_getCaptivityStatus);

_captivityReasonsBooleans = [];
{
  _captivityReasonsBooleans set [_forEachIndex, (_captivityReasons select _forEachIndex) in _unitCaptivityReasons];
} forEach _captivityReasons;

_captivityReasonsBooleans set [_captivityReasons find _reason, _status];

_bitmask = _captivityReasonsBooleans call GVAR(fnc_toBitmask);

// actually apply the setCaptive command globaly
[[_unit, _bitmask], "{(_this select 0) setCaptive (_this select 1)}", _unit] call GVAR(fnc_execRemoteFnc);
