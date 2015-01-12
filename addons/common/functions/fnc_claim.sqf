// by commy2
#include "\z\ace\addons\common\script_component.hpp"

private ["_unit", "_target", "_lockTarget", "_owner"];

_unit = _this select 0;
_target = _this select 1;
_lockTarget = _this select 2;

if (isNil "_lockTarget") then {_lockTarget = false};

_owner = _target getVariable ["ACE_isUsedBy", objNull];

if (!isNull _owner && {!isNull _unit} && {_unit != _owner}) then {
  diag_log text "[ACE] ERROR: Claiming already owned object.";
};

_target setVariable ["ACE_isUsedBy", _unit, true];

if (_lockTarget) then {
  if (!isNull _unit) then {
    [_target, "{_locked = locked _this; _this setVariable ['ACE_lockStatus', _locked]; _this lock 2}", _target] call FUNC(execRemoteFnc);
  } else {
    [_target, "{_this lock (_this getVariable ['ACE_lockStatus', locked _this])}", _target] call FUNC(execRemoteFnc);
  };
};

//systemChat str locked _target; systemChat str (_target getVariable ['ACE_lockStatus', locked _target]);
