/*
 * By: KoffeinFlummi
 *
 * Starts the treatment of the unit.
 *
 * Arguments:
 * 0: Unit that does the treating (Object)
 * 1: Unit that is beeing treated (Object)
 * 2: Type of treatment:
 *    - "diagnose"
 *    - "bandage"
 *    - "morphine"
 *    - "epipen"
 *    - "bloodbag"
 * 3+: Additional parameters
 *
 * Return value:
 * none
 */

private ["_unit", "_target", "_type", "_inTrigger", "_item", "_animation", "_time", "_string"];

_unit = _this select 0;
_target = _this select 1;
_type = _this select 2;

// check if unit is medic and if that's even necessary
if (_type in ["epipen", "bloodbag"] and
    !(([_unit] call AGM_Core_fnc_isMedic) or
    (_unit getVariable ["AGM_Medical_AllowNonMedics", AGM_Medical_AllowNonMedics]))) exitWith {
  if ([_unit] call AGM_Core_fnc_isPlayer) then {
    [localize "STR_AGM_Medical_NotTrained"] call AGM_Core_fnc_displayTextStructured;
  };
};

// check MEDEVAC conditions
_inTrigger = False;
{
  if (_inTrigger) exitWith {};
  _inTrigger = [_x, _target] call BIS_fnc_inTrigger;
} forEach (missionNamespace getVariable ["AGM_Medical_MEDEVACTriggers", []]);
{
  if (_inTrigger) exitWith {};
  _inTrigger = _target distance _x < 10;
} forEach (missionNamespace getVariable ["AGM_Medical_MEDEVACVehicles", []]);

if (_type == "epipen" and (_unit getVariable ["AGM_Medical_RequireMEDEVAC", AGM_Medical_RequireMEDEVAC]) and !_inTrigger) exitWith {
  if ([_unit] call AGM_Core_fnc_isPlayer) then {
    [localize "STR_AGM_Medical_NotInMEDEVAC"] call AGM_Core_fnc_displayTextStructured;
  };
};

// morphine warning
if (_type == "morphine" and
    _target != _unit and
    [_target] call AGM_Core_fnc_isPlayer) then {
  [[_unit] call AGM_Core_fnc_getName, "{systemChat format ['%1 %2', _this, localize 'STR_AGM_Medical_GivingYouMorphine'];}", _target] call AGM_Core_fnc_execRemoteFnc;
};

// remove item if necessary
_item = switch (_type) do {
  case "bandage"  : {"AGM_Bandage"};
  case "morphine" : {"AGM_Morphine"};
  case "epipen"   : {"AGM_Epipen"};
  case "bloodbag" : {"AGM_Bloodbag"};
  default           {""};
};
if (_item != "" and {!([_unit, _target, _item] call AGM_Medical_fnc_takeItem)}) exitWith {};

// code to be executed if action is aborted
AGM_Medical_treatmentAbort = {
  _unit = _this select 0;

  if (vehicle _unit == _unit) then {
    [_unit, "", 1] call AGM_Core_fnc_doAnimation;
  };
  _unit setVariable ["AGM_canTreat", True, False];
};

_unit setVariable ["AGM_canTreat", False, False];

// self-diagnosis is instant
if (
    (_target == _unit) and
    (_type == "diagnose")
  ) exitWith {
  _this spawn AGM_Medical_fnc_treatmentCallback;
};

// play appropriate animation
_animation = switch (_type) do {
  case "diagnose" : {"AinvPknlMstpSnonWnonDnon_medic3"};
  case "bandage"  : {"AinvPknlMstpSnonWnonDnon_medic4"};
  case "morphine" : {"AinvPknlMstpSnonWnonDnon_medic1"};
  case "epipen"   : {"AinvPknlMstpSnonWnonDnon_medic1"};
  case "bloodbag" : {"AinvPknlMstpSnonWnonDnon_medic1"};
  default           {""};
};
if (stance _unit == "PRONE") then {
  _animation = switch (currentWeapon _unit) do {
    case (""):                    {"AinvPpneMstpSlayWnonDnon_medic"};
    case (primaryWeapon _unit): {"AinvPpneMstpSlayWrflDnon_medic"};
    case (handgunWeapon _unit): {"AinvPpneMstpSlayWpstDnon_medic"};
    default                       {"AinvPpneMstpSlayWnonDnon_medic"};
  };
};
if (_unit == _target) then {
  _animation = switch (currentWeapon _unit) do {
    case (""): {
      ["AinvPknlMstpSlayWnonDnon_medic", "AinvPpneMstpSlayWnonDnon_medic"] select (stance _unit == "PRONE")
    };
    case (primaryWeapon _unit): {
      ["AinvPknlMstpSlayWrflDnon_medic", "AinvPpneMstpSlayWrflDnon_medic"] select (stance _unit == "PRONE")
    };
    case (handgunWeapon _unit): {
      ["AinvPknlMstpSlayWpstDnon_medic", "AinvPpneMstpSlayWpstDnon_medic"] select (stance _unit == "PRONE")
    };
    default {
      ["AinvPknlMstpSlayWnonDnon_medic", "AinvPpneMstpSlayWnonDnon_medic"] select (stance _unit == "PRONE")
    };
  };
};

if (vehicle _unit == _unit) then {
  [_unit, _animation, 1] call AGM_Core_fnc_doAnimation;
};

// get time required for action to be completed
_time = switch (_type) do {
  case "diagnose" : {5};
  case "bandage"  : {8};
  case "morphine" : {5};
  case "epipen"   : {5};
  case "bloodbag" : {20};
  default           {10};
};
if !([_unit] call AGM_Core_fnc_isMedic) then {
  _time = _time * (_unit getVariable ["AGM_Medical_CoefNonMedic", AGM_Medical_CoefNonMedic]);
};
// increase treatment time when treating while prone or in (non-medical) vehicle
// (it's hard to bandage yourself in a tank you know)
if (stance _unit == "PRONE" or (vehicle _unit != _unit and !([vehicle _unit] call AGM_Core_fnc_isMedic))) then {
  _time = _time * 1.2;
};

// select appropriate label for progress bar
_string = switch (_type) do {
  case "diagnose" : {localize "STR_AGM_Medical_Diagnosing"};
  case "bandage"  : {
    _selection = _this select 3;
    if (_selection == "All") then {
      localize "STR_AGM_Medical_Bandaging"
    } else {
      localize format ["STR_AGM_Medical_Bandaging_%1", _selection]
    };
  };
  case "morphine" : {localize "STR_AGM_Medical_Injecting_Morphine"};
  case "epipen"   : {localize "STR_AGM_Medical_Injecting_Epinephrine"};
  case "bloodbag" : {localize "STR_AGM_Medical_Transfusing_Blood"};
  default           {"Tell Flummi he's a dumbass ..."};
};

// ai treat
if !([_unit] call AGM_Core_fnc_isPlayer) exitWith {
  [_this, _time] spawn {
    sleep ((_this select 1) * 0.6);
    (_this select 0) call AGM_Medical_fnc_treatmentCallback;
  };
};

[
  _time,
  _this,
  "AGM_Medical_fnc_treatmentCallback",
  _string,
  "AGM_Medical_treatmentAbort"
] call AGM_Core_fnc_progressBar;
[_target, True] call AGM_Core_fnc_closeDialogIfTargetMoves;
