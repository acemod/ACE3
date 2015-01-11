// by commy2

private ["_medic", "_patient", "_task"];

_medic = _this select 0;
_patient = _this select 1;
_task = _this select 2;

// exit if the unit already has a task
if (!scriptDone (_medic getVariable ["AGM_Medical_AITask", scriptNull])) exitWith {};//systemChat str _this;//

// exit if the medic can't do te treatment
if !(_this call AGM_Medical_fnc_aiCanTreat) exitWith {
  // continue walking freely
  _medic doMove getPosASL _medic
};

// do treatment
private "_scriptHandle";
_scriptHandle = _this spawn {
  _medic = _this select 0;
  _patient = _this select 1;
  _task = _this select 2;

  // wait until ready again
  waitUntil {
    // exit if dead
    if (!alive _medic || {!alive _patient} || {_medic getVariable ["AGM_isUnconscious", false]}) exitWith {true};

    sleep 0.15;
    _medic getVariable ["AGM_canTreat", true]
  };

  // wait until medic next to patient
  if (_medic distanceSqr _patient > 4) then {
    _doMoveLoop = _this spawn {
      while {true} do {
        (_this select 0) doMove getPosASL (_this select 1);
        sleep 30;
      };
    };

    waitUntil {
      // exit if dead
      if (!alive _medic || {!alive _patient} || {_medic getVariable ["AGM_isUnconscious", false]}) exitWith {true};

      sleep 0.15;
      getPosASL _medic distanceSqr getPosASL _patient < 5
    };

    terminate _doMoveLoop;
  };

  // exit if the medic can't do te treatment
  if !(_this call AGM_Medical_fnc_aiCanTreat) exitWith {
    // continue walking freely
    _medic doMove getPosASL _medic
  };

  // halt
  doStop _medic;

  // treat everything
  _items = items _medic;

  switch (_task) do {
    case ("bandage"): {
      if (damage _patient > 0 && {"AGM_Bandage" in _items}) then {
        [_medic, _patient, "bandage", "All"] call AGM_Medical_fnc_treat;
      };
    };

    case ("morphine"): {
      if (_patient getVariable ["AGM_Pain", 0] > 0 && {"AGM_Morphine" in _items}) then {
        [_medic, _patient, "morphine"] call AGM_Medical_fnc_treat;
      };
    };

    case ("epipen"): {
      if (_patient getVariable ["AGM_isUnconscious", false] && {"AGM_Epipen" in _items}) then {
        [_medic, _patient, "epipen"] call AGM_Medical_fnc_treat;
      };
    };

    case ("bloodbag"): {
      if (_patient getVariable ["AGM_Blood", 1] < 1 && {"AGM_Bloodbag" in _items}) then {
        [_medic, _patient, "bloodbag"] call AGM_Medical_fnc_treat;
      };
    };
  };

  // wait until ready again
  waitUntil {
    // exit if dead
    if (!alive _medic || {!alive _patient} || {_medic getVariable ["AGM_isUnconscious", false]}) exitWith {true};

    sleep 0.15;
    _medic getVariable ["AGM_canTreat", true]
  };

  // check for next task on this patient
  if (damage _patient > 0) exitWith {
    [_medic, _patient, "bandage"] spawn AGM_Medical_fnc_aiTreat;
  };

  if (_patient getVariable ["AGM_Pain", 0] > 0) exitWith {
    [_medic, _patient, "morphine"] spawn AGM_Medical_fnc_aiTreat;
  };

  if (_patient getVariable ["AGM_isUnconscious", false]) exitWith {
    [_medic, _patient, "epipen"] spawn AGM_Medical_fnc_aiTreat;
  };

  if (_patient getVariable ["AGM_Blood", 1] < 1) exitWith {
    [_medic, _patient, "bloodbag"] spawn AGM_Medical_fnc_aiTreat;
  };

  // otherwise continue walking freely
  _medic doMove getPosASL _medic;
};

_medic setVariable ["AGM_Medical_AITask", _scriptHandle];
