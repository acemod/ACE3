/*
 * Author: KoffeinFlummi
 *
 * Shows the player information about his patient.
 *
 * Arguments:
 * 0: Unit to be diagnosed
 *
 * Return Value:
 * None
 */

private ["_unit", "_damages", "_bystanders", "_lightinjuries", "_heavyinjuries", "_blood", "_painkiller", "_pain"];

_unit = _this select 0;

_damages = [
  ["HitHead",      floor ((_unit getHitPointDamage "HitHead")     * 100) / 100],
  ["HitBody",      floor ((_unit getHitPointDamage "HitBody")     * 100) / 100],
  ["HitLeftArm",   floor ((_unit getHitPointDamage "HitLeftArm")  * 100) / 100],
  ["HitRightArm",  floor ((_unit getHitPointDamage "HitRightArm") * 100) / 100],
  ["HitLeftLeg",   floor ((_unit getHitPointDamage "HitLeftLeg")  * 100) / 100],
  ["HitRightLeg",  floor ((_unit getHitPointDamage "HitRightLeg") * 100) / 100]
];

_unit setVariable ["AGM_isDiagnosed", True, False];

// Tell bystanders what's up if necessary
if (AGM_Medical_RequireDiagnosis) then {
  _bystanders = nearestObjects [AGM_player, ["CAManBase"], 10];
  [-1, {
    if (AGM_player in (_this select 1)) then {
      (_this select 0) setVariable ["AGM_isDiagnosed", true, false];
    };
  }, [_unit, _bystanders]] call CBA_fnc_globalExecute;
};

_string = format ["<t align='center' size='0.8'>%1: %2", localize "STR_AGM_Medical_Patient", [_unit] call AGM_Core_fnc_getName];

if (damage _unit >= 1) exitWith {
  _string = _string + "<br/><br/><t color='#FF0000'>" + localize "STR_AGM_Medical_PatientIsDead" + "</t></t>";
  [composeText [lineBreak, parseText _string]] call AGM_Medical_fnc_displayText;
};

// Consciousness
if (_unit getVariable ["AGM_isUnconscious", False]) then {
  _string = _string + "<br/><br/><t color='#FFFF00'>" + localize "STR_AGM_Medical_PatientIsUnconscious" + "</t>";
} else {
  _string = _string + "<br/><br/>" + localize "STR_AGM_Medical_PatientIsAwake";
};

// Injuries
_lightinjuries = "";
_heavyinjuries = "";
if (AGM_Medical_SingleBandage) then {
  _string = _string + (switch True do {
    case (damage _unit >= 0.5): {"<br/><br/><t color='#FF0000'>" + localize "STR_AGM_Medical_PatientHeavilyInjured" + "</t>"};
    case (damage _unit < 0.5):  {"<br/><br/><t color='#FFFF00'>" + localize "STR_AGM_Medical_PatientLightlyInjured" + "</t>"};
    default                     {"<br/><br/>" + localize "STR_AGM_Medical_PatientNotInjured"};
  });
} else {
  _heavyinjuries = "";
  {
    if ((_x select 1) >= 0.5) then {
      if (_heavyinjuries != "") then { _heavyinjuries = _heavyinjuries + ", "; };
      _heavyinjuries = _heavyinjuries + localize (format ["STR_AGM_Medical_%1", (_x select 0)]);
    };
  } forEach _damages;
  if (_heavyinjuries != "") then {
    _string = _string + "<br/><br/><t color='#FF0000'>" + (localize "STR_AGM_Medical_PatientHeavyInjuries") + "</t><br/>" + _heavyinjuries;
  };

  _lightinjuries = "";
  {
    if ((_x select 1) < 0.5 and (_x select 1) > 0.01) then {
      if (_lightinjuries != "") then { _lightinjuries = _lightinjuries + ", "; };
      _lightinjuries = _lightinjuries + localize (format ["STR_AGM_Medical_%1", (_x select 0)]);
    };
  } forEach _damages;
  if (_lightinjuries != "") then {
    _string = _string + "<br/><br/><t color='#FFFF00'>" + (localize "STR_AGM_Medical_PatientLightInjuries") + "</t><br/>" + _lightinjuries;
  };

  if (_lightinjuries == "" and _heavyinjuries == "") then {
    _string = _string + "<br/><br/>" + localize "STR_AGM_Medical_PatientNotInjured";
  };
};

// Bleeding
if ((AGM_Medical_SingleBandage and damage _unit > 0) or (_heavyinjuries != "" or _lightinjuries != "")) then {
  _string = _string + "<br/><br/><t color='#FF0000'>" + localize "STR_AGM_Medical_PatientBleeding" + "</t> ";
} else {
  _string = _string + "<br/><br/>" + localize "STR_AGM_Medical_PatientNotBleeding" + " ";
};

// Blood
_blood = _unit getVariable ["AGM_Blood", 1];
_string = _string + (switch True do {
  case (_blood < 0.4): {"<t color='#FF0000'>" + localize "STR_AGM_Medical_PatientLostBlood" + "</t>"};
  case (_blood < 1):   {"<t color='#FFFF00'>" + localize "STR_AGM_Medical_PatientLostSomeBlood" + "</t>"};
  default              {localize "STR_AGM_Medical_PatientLostNoBlood"};
});

// Painkillers
_painkiller = _unit getVariable ["AGM_Painkiller", 1];
_string = _string + (switch True do {
  case (_painkiller < 0.4): {"<br/><br/><t color='#FF0000'>" + localize "STR_AGM_Medical_PatientPainkillers" + "</t> "};
  case (_painkiller < 0.9): {"<br/><br/><t color='#FFFF00'>" + localize "STR_AGM_Medical_PatientSomePainkillers" + "</t> "};
  default                   {"<br/><br/>" + localize "STR_AGM_Medical_PatientNoPainkillers" + " "};
});

// Pain
_pain = _unit getVariable ["AGM_Pain", 0];
_string = _string + (switch True do {
  case (_pain > 0.4): {"<t color='#FF0000'>" + localize "STR_AGM_Medical_PatientHeavyPain" + "</t>"};
  case (_pain > 0.1): {"<t color='#FFFF00'>" + localize "STR_AGM_Medical_PatientLightPain" + "</t>"};
  default             {localize "STR_AGM_Medical_PatientNoPain"};
});

_string = _string + "</t>";
[composeText [lineBreak, parseText _string]] call AGM_Medical_fnc_displayText;
