/*
 * Author: CAA-Picard
 *
 * Select the next grenade muzzle to throw.
 *
 * Argument:
 * muzzle name
 *
 * Return value:
 * None
 *
 */

private ["_player", "_muzzle"];

_player = _this select 0;
_muzzle = _this select 1;

_uniformMags = getMagazineCargo uniformContainer _player;
_vestMags = getMagazineCargo vestContainer _player;
_backPackMags = getMagazineCargo backpackContainer _player;

_uniformMagsToRemove = [];
_vestMagsToRemove = [];
_backPackMagsToRemove = [];

_firstMagazine = "";

// Collect which magazines to remove
_throwMuzzleNames = getArray (configfile >> "CfgWeapons" >> "Throw" >> "muzzles");
{
  _muzzleName = _x;
  _muzzleMagazines = getArray (configFile >> "CfgWeapons" >> "Throw" >> _muzzleName >> "magazines" );
  if (_muzzle != _muzzleName) then {
    {
      _index = (_uniformMags select 0) find _x;
      if (_index > -1) then {
        _uniformMagsToRemove = _uniformMagsToRemove + [[_x, (_uniformMags select 1) select _index]];
      };
      _index = (_vestMags select 0) find _x;
      if (_index > -1) then {
        _vestMagsToRemove = _vestMagsToRemove + [[_x, (_vestMags select 1) select _index]];
      };
      _index = (_backpackMags select 0) find _x;
      if (_index > -1) then {
        _backpackMagsToRemove = _backpackMagsToRemove + [[_x, (_backpackMags select 1) select _index]];
      };
    } forEach _muzzleMagazines;
  } else {
    {
      _index = (_uniformMags select 0) find _x;
      if (_index > -1) then {
        _firstMagazine = _x;
      };
      _index = (_vestMags select 0) find _x;
      if (_index > -1) then {
        _firstMagazine = _x;
      };
      _index = (_backpackMags select 0) find _x;
      if (_index > -1) then {
        _firstMagazine = _x;
      };
    } forEach _muzzleMagazines;
  };
} forEach _throwMuzzleNames;

// Remove all magazines except those we are switching to --> this breaks the selector
{
  for [{_i=0},{_i < (_x select 1)}, {_i = _i + 1}] do {
    _player removeItem (_x select 0);
  };
} forEach _uniformMagsToRemove;
{
  for [{_i=0},{_i < (_x select 1)}, {_i = _i + 1}] do {
    _player removeItem (_x select 0);
  };
} forEach _vestMagsToRemove;
{
  for [{_i=0},{_i < (_x select 1)}, {_i = _i + 1}] do {
    _player removeItem (_x select 0);
  };
} forEach _backPackMagsToRemove;

// Readd magazines
{
  for [{_i=0},{_i < (_x select 1)}, {_i = _i + 1}] do {
    _player addItemToUniform (_x select 0); 
  };
} forEach _uniformMagsToRemove;
{
  for [{_i=0},{_i < (_x select 1)}, {_i = _i + 1}] do {
    _player addItemToVest (_x select 0); 
  };
} forEach _vestMagsToRemove;
{
  for [{_i=0},{_i < (_x select 1)}, {_i = _i + 1}] do {
    _player addItemToBackpack (_x select 0); 
  };
} forEach _backPackMagsToRemove;

