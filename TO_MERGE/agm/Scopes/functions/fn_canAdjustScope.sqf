/*
 * Author: KoffeinFlummi
 *
 * Checks if a player can adjust his optic in the given way.
 *
 * Arguments:
 * 0: Horizontal adjustment
 * 1: Vertical adjustment
 *
 * Return Value:
 * Can adjustment be done? (Bool)
 */

private ["_unit", "_weapons", "_zeroing", "_optic", "_maxHorizontal", "_maxVertical"];

_unit = _this select 0;

_weapons = [
  primaryWeapon _unit,
  secondaryWeapon _unit,
  handgunWeapon _unit
];

if !(currentWeapon _unit in _weapons) exitWith {false};

if (isNil "AGM_Scopes_Adjustment") then {
  AGM_Scopes_Adjustment = [[0,0], [0,0], [0,0]];
};

if (isNil "AGM_Scopes_Optics") then {
  AGM_Scopes_Optics = ["", "", ""];
};

_zeroing = AGM_Scopes_Adjustment select (_weapons find (currentWeapon _unit));
_zeroX = (_zeroing select 0) + (_this select 1);
_zeroY = (_zeroing select 1) + (_this select 2);

_optic = AGM_Scopes_Optics select (_weapons find (currentWeapon _unit));
_maxHorizontal = getArray (configFile >> "CfgWeapons" >> _optic >> "AGM_ScopeAdjust_Horizontal");
_maxVertical = getArray (configFile >> "CfgWeapons" >> _optic >> "AGM_ScopeAdjust_Vertical");
if ((count _maxHorizontal < 2) or (count _maxVertical < 2)) exitWith {false};
if ((_maxHorizontal isEqualTo [0,0]) or (_maxVertical isEqualTo [0,0])) exitWith {false};

if (_zeroX < _maxHorizontal select 0 or _zeroX > _maxHorizontal select 1) exitWith {false};
if (_zeroY < _maxVertical select 0 or _zeroY > _maxVertical select 1) exitWith {false};

vehicle _unit == _unit
