// by commy2
#include "\z\ace\addons\overheating\script_component.hpp"

private ["_player", "_weapon"];

_player = _this select 0;
_weapon = _this select 1;

if (stance _player != "PRONE") then {
  [_player, "amovpknlmstpsraswrfldnon", 1] call EFUNC(common,doAnimation);
};
_player playActionNow "GestureDismountMuzzle";
_player playAction "GestureMountMuzzle";
playSound "ACE_BarrelSwap";

[10, [_player, _weapon], QFUNC(swapBarrelCallback), localize "STR_ACE_Overheating_SwappingBarrel"] call EFUNC(common,progressBar);
