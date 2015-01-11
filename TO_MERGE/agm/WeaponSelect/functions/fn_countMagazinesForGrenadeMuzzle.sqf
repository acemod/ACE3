/*
 * Author: CAA-Picard
 *
 * Count how many grenade magazines the unit has on the uniform and vest.
 *
 * Argument:
 * 0: Muzzle name
 *
 * Return value:
 * 0: Number of magazines
 * 1: First magazine name
 */

private ["_player", "_muzzle"];

_player = _this select 0;
_muzzle = _this select 1;

_uniformMags = getMagazineCargo uniformContainer _player;
_vestMags = getMagazineCargo vestContainer _player;
_backPackMags = getMagazineCargo backpackContainer _player;

_numberOfMagazines = 0;
_magazineClasses = getArray (configFile >> "CfgWeapons" >> "Throw" >> _muzzle >> "magazines" );
_firstMagazine = _magazineClasses select 0;
{
  _indexInUniform = (_uniformMags select 0) find _x;
  if (_indexInUniform > -1) then {
    _numberOfMagazines = _numberOfMagazines + ((_uniformMags select 1) select _indexInUniform);
    _firstMagazine = _x;
  };
  _indexInVest = (_vestMags select 0) find _x;
  if (_indexInVest > -1) then {
    _numberOfMagazines = _numberOfMagazines + ((_vestMags select 1) select _indexInVest);
    _firstMagazine = _x;
  };
  _indexInBackpack = (_backpackMags select 0) find _x;
  if (_indexInBackpack > -1) then {
    _numberOfMagazines = _numberOfMagazines + ((_backpackMags select 1) select _indexInBackpack);
    _firstMagazine = _x;
  };
} forEach _magazineClasses;

[_numberOfMagazines, _firstMagazine]
