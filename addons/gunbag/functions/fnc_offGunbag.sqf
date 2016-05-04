/*
 * Author: Ir0n1E
 * get weapon out of gunbag
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit","_target"];

private ["_weapon", "_items", "_gunbag", "_state"];

_gunbag = backpackContainer _target;
_state = _gunbag getVariable [QGVAR(GunbagWeapon),[]];

/*
* example returnvalue _state
* ["","","optic_Aco","",["arifle_MX_GL_ACO_F","GL_3GL_F"],["30Rnd_65x39_caseless_mag","1Rnd_HE_Grenade_shell"],[30,1]]
*/

if (count _state <= 0) exitWith {
  [localize LSTRING(empty)] call EFUNC(common,displayTextStructured);
};

_weapon = (_state select 0) select 0;
_items = (_state select 1);

_unit addWeapon _weapon;
removeAllPrimaryWeaponItems _unit;

{
  _unit addWeaponItem [_weapon, _x];
} forEach _items;

[_target, backpackContainer _target, -([_weapon, _items] call FUNC(calculateMass))] call EFUNC(movement,addLoadToUnitContainer);
_gunbag setVariable [QGVAR(GunbagWeapon), [], true];

if(["ACE_Backpacks"] call EFUNC(common,isModLoaded)) then {
  [_unit, _target, backpackContainer _target] call EFUNC(backpacks,backpackOpened);
};
