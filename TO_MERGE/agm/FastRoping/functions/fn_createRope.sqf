/*
 * Author: KoffeinFlummi
 *
 * Creates a rope for the vehicle at the given position.
 *
 * Arguments:
 * 0: Vehicle
 * 1: Position
 * 2: Spawn bottom part of rope in place? (Default: False)
 *
 * Return Value:
 * Array:
 *   0: rope 1
 *   1: rope 2
 *   2-3: helper objects
 *
 * __/|
 *    | <- rope 1
 *    |
 *    X <- helper 1; attached to player
 *    |
 *    | <- rope 2
 *    |
 *    X <- helper 2
 */

#define HELPER "AGM_FastRoping_Helper"
#define ROPELENGTH 35
#define OFFSET 2

private ["_vehicle", "_pos", "_inPlace", "_helper1", "_helper1", "_helper2", "_rope1", "_rope2"];

_vehicle = _this select 0;
_pos = _this select 1;
_inPlace = False;
if (count _this > 2) then {
  _inPlace = _this select 2;
};

if (typeName _pos == "STRING") then {
  _pos = _vehicle selectionPosition _pos;
};

_posWorld = _vehicle modelToWorld _pos;

// modelToWorld seems to ignore buildings; let's fix that.
_posWorld = _posWorld vectorDiff ((getPosATL _vehicle) vectorDiff (getPos _vehicle));
_posWorld set [2, (_posWorld select 2) - OFFSET];

_posWorld2 =+ _posWorld;
if (_inPlace) then {
  _posWorld2 set [2, ((_posWorld select 2) - (ROPELENGTH - OFFSET)) max 0];
};

_helper1 = HELPER createVehicle _posWorld;
_helper1 allowDamage False;

_helper2 = HELPER createVehicle _posWorld2;
_helper2 allowDamage False;

//_rope1 = ropeCreate [_helper1, [0,0,0], _helper1, [0,0,0], OFFSET];
_rope1 = ropeCreate [_vehicle, _pos, _helper1, [0,0,0], OFFSET + 1];
_rope2 = ropeCreate [_helper1, [0,0,0], _helper2, [0,0,0], ROPELENGTH - (OFFSET + 1)];

if (_inPlace) then {
  _roof = ((getPosATL _vehicle) vectorDiff (getPos _vehicle)) select 2;
  _helper2 setPosATL [
    (getPosATL _helper1) select 0,
    (getPosATL _helper1) select 1,
    (((getPosATL _helper1) select 2) - ROPELENGTH) max (_roof + 1)
  ];
} else {
  _helper2 setPosATL (getPosATL _helper1);
};

[_rope1, _rope2, _helper1, _helper2]
