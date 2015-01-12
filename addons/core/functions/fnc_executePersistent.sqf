// by commy2

private "_target";

_target = _this select 0;

{
  if (isNil "_x") then {
    diag_log text format ["[AGM] ERROR: No argument and function for remote function. ID: %1", _forEachIndex];
  } else {
    if (typeName _x == "ARRAY") then {
      [_x select 0, _target] call (_x select 1);
    };
  };
} forEach (_target getVariable ["AGM_PersistentFunctions", []]);
