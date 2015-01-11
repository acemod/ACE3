/*
 * Author: KoffeinFlummi
 *
 * Starts fast roping for a certain unit
 *
 * Arguments:
 * 0: Unit
 * 1: Helicopter
 *
 * Return Value:
 * None
 */

#define ROPELENGTH 35

_unit = _this select 0;
_vehicle = _this select 1;

_ropes = _vehicle getVariable "AGM_Ropes";
_occupied = _vehicle getVariable "AGM_RopesOccupied";

_index = -1;
for "_i" from 0 to ((count _occupied) - 1) do {
  if !(_occupied select _i) exitWith {
    _index = _i;
  };
};

_occupied set [_index, True];
_vehicle setVariable ["AGM_RopesOccupied", _occupied, True];

_rope = _ropes select _index;
_rope1 = _rope select 0;
_rope2 = _rope select 1;
_helper = _rope select 2;
_unit disableCollisionWith _helper;

[time, _unit, _vehicle, _index, _rope, _index] spawn {
  _time = _this select 0;
  _unit = _this select 1;
  _vehicle = _this select 2;
  _index = _this select 3;
  _rope = _this select 4;
  _index = _this select 5;

  _rope1 = _rope select 0;
  _rope2 = _rope select 1;
  _helper = _rope select 2;

  _unit allowDamage False;
  moveOut _unit;
  waitUntil {vehicle _unit == _unit};

  _helper setVectorUp [0,0,1];
  _unit attachTo [_helper, [0,0,0]];

  _vector = (getPos _unit) vectorFromTo (getPos _vehicle);
  _unit setVectorDir _vector;

  [[_rope1, _rope2], "{ropeUnwind [_this select 0, 6, 35];ropeUnwind [_this select 1, 6, 0];}", _helper] call AGM_Core_fnc_execRemoteFnc;

  sleep 0.1;
  _unit allowDamage True;
  [_unit, "AGM_FastRoping", 2] call AGM_Core_fnc_doAnimation;

  waitUntil {
    ([_unit] + ([[_helper] call AGM_Core_fnc_getPitchBankYaw, {_this * -1}] call AGM_Core_fnc_map)) call AGM_Core_fnc_setPitchBankYaw;
    _time + 1 < time and ((getPos _helper select 2) < 1 or (time >= (_time + ROPELENGTH / 6)) or (vectorMagnitude (velocity _vehicle) > 5))
  };

  _unit allowDamage False;
  _unit spawn {
    sleep 0.5;
    _this allowDamage True;
  };

  detach _unit;
  [_unit, "", 2] call AGM_Core_fnc_doAnimation;
  _unit setVectorUp [0,0,1];

  // delete and recreate rope
  {deleteVehicle _x;} forEach _rope;
  _ropePositions = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_FastRoping_Positions");
  _pos = _ropePositions select _index;
  [
    [_vehicle, _pos, _index],
    "{_ropes = (_this select 0) getVariable 'AGM_Ropes';_ropes set [(_this select 2), [(_this select 0), (_this select 1), True] call AGM_FastRoping_fnc_createRope];(_this select 0) setVariable ['AGM_Ropes', _ropes, True];}",
    _vehicle
  ] call AGM_Core_fnc_execRemoteFnc;

  // free rope for next unit
  _occupied = _vehicle getVariable "AGM_RopesOccupied";
  _occupied set [_index, False];
  _vehicle setVariable ["AGM_RopesOccupied", _occupied, True];
};
