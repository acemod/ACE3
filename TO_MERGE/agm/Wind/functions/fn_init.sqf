private ["_unit"];

_unit = _this select 0;

// Substitute wind calculations for AI by lowering accuracy
if !(isPlayer _unit) exitWith {
  _windStrength = sqrt((wind select 0) ^ 2 + (wind select 1) ^ 2);
  _unit setSkill ["aimingAccuracy", (_unit skill "aimingAccuracy") * (1 - _windStrength / 14)];
};
