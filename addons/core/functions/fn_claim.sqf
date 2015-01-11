// by commy2

private ["_unit", "_target", "_lockTarget", "_owner"];

_unit = _this select 0;
_target = _this select 1;
_lockTarget = _this select 2;

if (isNil "_lockTarget") then {_lockTarget = false};

_owner = _target getVariable ["AGM_isUsedBy", objNull];

if (!isNull _owner && {!isNull _unit} && {_unit != _owner}) then {
  diag_log text "[AGM] ERROR: Claiming already owned object.";
};

_target setVariable ["AGM_isUsedBy", _unit, true];

if (_lockTarget) then {
  if (!isNull _unit) then {
    [_target, "{_locked = locked _this; _this setVariable ['AGM_lockStatus', _locked]; _this lock 2}", _target] call GVAR(fnc_execRemoteFnc);
  } else {
    [_target, "{_this lock (_this getVariable ['AGM_lockStatus', locked _this])}", _target] call GVAR(fnc_execRemoteFnc);
  };
};

//systemChat str locked _target; systemChat str (_target getVariable ['AGM_lockStatus', locked _target]);
