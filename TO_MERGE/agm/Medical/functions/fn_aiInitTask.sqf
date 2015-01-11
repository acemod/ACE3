// by commy2

private ["_unit", "_need"];
_unit = _this select 0;
_need = _this select 1;

// can treat self?
if ([_unit, _unit, _need] call AGM_Medical_fnc_aiCanTreat) then {//systemChat format ["%1 : %2", [_unit, _unit, _need] call AGM_Medical_fnc_aiTreat, [_unit, _unit, _need]];
  [_unit, _unit, _need] call AGM_Medical_fnc_aiTreat;
} else {
  // if not, then find group member that can treat instead
  {
    if ([_x, _unit, _need] call AGM_Medical_fnc_aiCanTreat) exitWith {//systemChat format ["%1 : %2", [_unit, _unit, _need] call AGM_Medical_fnc_aiTreat, [_unit, _unit, _need]];
      [_x, _unit, _need] call AGM_Medical_fnc_aiTreat;
    };
  } forEach units group _unit;
};
