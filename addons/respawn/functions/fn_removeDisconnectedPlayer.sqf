// by commy2

private ["_forceRemove", "_body"];

_forceRemove = _this select 0;

{
  if (getPlayerUID _x == _uid) exitWith {
    _body = _x;
  };
} forEach playableUnits;

if (!isNil "_body" && {!alive _body}) then {
  [_body, _forceRemove] call AGM_Respawn_fnc_removeBody;
};
