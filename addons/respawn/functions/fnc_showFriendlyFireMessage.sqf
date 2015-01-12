// by commy2

private ["_unit", "_killer"];

_unit = _this select 0;
_killer = _this select 1;

if (_unit != _killer && side group _unit in [side group ACE_player, civilian] && {side group _killer == side group ACE_player}) then {
  systemChat format ["%1 was killed by %2", [_unit] call EFUNC(Core, getName), [_killer] call EFUNC(Core, getName)];

  [_unit, "killedByFriendly", [_unit, _killer]] call EFUNC(Core, callCustomEventHandlers);
};
