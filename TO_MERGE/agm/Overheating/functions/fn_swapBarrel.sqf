// by commy2

private ["_player", "_weapon"];

_player = _this select 0;
_weapon = _this select 1;

if (stance _player != "PRONE") then {
  [_player, "amovpknlmstpsraswrfldnon", 1] call AGM_Core_fnc_doAnimation;
};
_player playActionNow "GestureDismountMuzzle";
_player playAction "GestureMountMuzzle";
playSound "AGM_BarrelSwap";

[10, [_player, _weapon], "AGM_Overheating_fnc_swapBarrelCallback", localize "STR_AGM_Overheating_SwappingBarrel"] call AGM_Core_fnc_progressBar;
