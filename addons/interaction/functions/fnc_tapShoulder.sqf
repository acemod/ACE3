// by commy2
#include "script_component.hpp"

private ["_unit", "_message"];

_tapper = _this select 0;
_target = _this select 1;

if (_target != ACE_player) exitWith {
  addCamShake [4, 0.5, 5];
  if !(local _target) then {
    [[_tapper, _target], QUOTE(DFUNC(tapShoulder)), _target] call EFUNC(common,execRemoteFnc);
  };
};

addCamShake [4, 0.5, 5];

//_message = format ["%1 tapped you on your shoulder.", [_unit] call EFUNC(common,getName)];
_message = localize "STR_ACE_Interaction_YouWereTapped";

[_message] call EFUNC(common,displayTextStructured);
