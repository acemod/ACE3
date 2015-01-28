// by gpgpgpgp, edited by commy2
#include "script_component.hpp"

PARAMS_1(_unit);
if (_unit != ACE_player) exitWith {};

_fenceObject = [ACE_player] call FUNC(getNearestFence);
if (isNull _fenceObject) exitWith {};

_timeToCut = 5;
if !([ACE_player] call EFUNC(common,isEngineer)) then {
  _timeToCut = _timeToCut + 5;
};

[ACE_player, "AinvPknlMstpSnonWnonDr_medic5", 0] call EFUNC(common,doAnimation);

if (_timeToCut > 4.5) then {
  playSound "ACE_wirecutter_sound_long";
} else {
  playSound "ACE_wirecutter_sound";
};

[_timeToCut, [_fenceObject], {(_this select 0) call FUNC(cutDownFenceCallback)}, {(_this select 0) call FUNC(cutDownFenceAbort)}, localize "STR_ACE_logistics_wirecutter_CuttingFence"] call EFUNC(common,progressBar);
