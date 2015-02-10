/*
 * Author: KoffeinFlummi
 * Checks if a player can adjust his optic in the given way.
 *
 * Argument:
 * 0: Unit <OBJECT>
 * 1: Horizontal adjustment <NUMBER>
 * 2: Vertical adjustment <NUMBER>
 *
 * Return value:
 * Can adjustment be done? <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_unit", "_weaponIndex", "_zeroing", "_optic", "_maxHorizontal", "_maxVertical"];

_unit = _this select 0;

_weaponIndex = [_unit, currentWeapon _unit] call FUNC(getWeaponIndex);
if (_weaponIndex < 0) exitWith {false};

_adjustment = _unit getVariable QGVAR(Adjustment);
if (isNil "_adjustment") then {
    _adjustment = [[0,0], [0,0], [0,0]];
};

if (isNil QGVAR(Optics)) then {
    GVAR(Optics) = ["", "", ""];
};

_zeroing = _adjustment select _weaponIndex;
_zeroX = (_zeroing select 0) + (_this select 1);
_zeroY = (_zeroing select 1) + (_this select 2);

_optic = GVAR(Optics) select _weaponIndex;
_maxHorizontal = getArray (configFile >> "CfgWeapons" >> _optic >> "ACE_ScopeAdjust_Horizontal");
_maxVertical = getArray (configFile >> "CfgWeapons" >> _optic >> "ACE_ScopeAdjust_Vertical");
if ((count _maxHorizontal < 2) or (count _maxVertical < 2)) exitWith {false};
if ((_maxHorizontal isEqualTo [0,0]) or (_maxVertical isEqualTo [0,0])) exitWith {false};

if (_zeroX < _maxHorizontal select 0 or _zeroX > _maxHorizontal select 1) exitWith {false};
if (_zeroY < _maxVertical select 0 or _zeroY > _maxVertical select 1) exitWith {false};

vehicle _unit == _unit
