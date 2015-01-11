// by commy2

private ["_unit", "_message"];

_tapper = _this select 0;
_target = _this select 1;

if (_target != AGM_player) exitWith {
  addCamShake [4, 0.5, 5];
  if !(local _target) then {
    [[_tapper, _target], "AGM_Interaction_fnc_tapShoulder", _target] call AGM_Core_fnc_execRemoteFnc;
  };
};

addCamShake [4, 0.5, 5];

//_message = format ["%1 tapped you on your shoulder.", [_unit] call AGM_Core_fnc_getName];
_message = localize "STR_AGM_Interaction_YouWereTapped";

[_message] call AGM_Core_fnc_displayTextStructured;
