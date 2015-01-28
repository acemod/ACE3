// by gpgpgpgp, edited by commy2
#include "script_component.hpp"

PARAMS_2(_timeToCut,_fenceObject);

// if (cadetMode) then {
  // {
    // [ACE_player, "{_this groupChat localize 'STR_ACE_CuttingFenceChat'}", _x] call ACE_Core_fnc_execRemoteFnc;
  // } forEach units group ACE_player;
// };

if !([ACE_player] call EFUNC(common,isEngineer)) then {
  _timeToCut = _timeToCut + 5;
};

[ACE_player, "AinvPknlMstpSnonWnonDr_medic5", 0] call EFUNC(common,doAnimation);

if (_timeToCut > 4.5) then {
  playSound "ACE_wirecutter_sound_long";
} else {
  playSound "ACE_wirecutter_sound";
};

[_timeToCut, [_fenceObject], {(_this select 0) call FUNC(cutDownFenceCallback)}, {(_this select 0) call FUNC(cutDownFenceAbort)}, localize "STR_ACE_CuttingFence"] call EFUNC(common,progressBar);
