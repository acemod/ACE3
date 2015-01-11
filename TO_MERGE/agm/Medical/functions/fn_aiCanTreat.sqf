// by commy2

private ["_medic", "_patient", "_task"];

_medic = _this select 0;
_patient = _this select 1;
_task = _this select 2;

if ([_medic] call AGM_Core_fnc_isPlayer || {!alive _medic} || {!alive _patient} || {_medic getVariable ["AGM_isUnconscious", false]} || {_medic getVariable ["AGM_isCaptive", false]}) exitWith {false};

private "_result";
_result = false;
switch (_task) do {
  case ("bandage"): {
    _result = damage _patient > 0
      && {"AGM_Bandage"  in items _medic}
  };
  case ("morphine"): {
    _result = _patient getVariable ["AGM_Pain", 0] > 0
      && {"AGM_Morphine" in items _medic}
  };
  case ("epipen"): {
    _result = _patient getVariable ["AGM_isUnconscious", false]
      && {"AGM_Epipen" in items _medic}
      && {[_medic] call AGM_Core_fnc_isMedic || {_patient getVariable ["AGM_Medical_AllowNonMedics", AGM_Medical_AllowNonMedics]}}
      && {!(_medic getVariable ["AGM_Medical_RequireMEDEVAC", AGM_Medical_RequireMEDEVAC])}
  };
  case ("bloodbag"): {
    _result = _patient getVariable ["AGM_Blood", 1] < 1
      && {[_medic] call AGM_Core_fnc_isMedic || {_patient getVariable ["AGM_Medical_AllowNonMedics", AGM_Medical_AllowNonMedics]}}
  };
};
_result
