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
removeAllWeapons _unit;

{
	_unit addWeaponItem [_weapon, _x];
} forEach _items;

([_target] call FUNC(switchBackpack)) setVariable [QGVAR(GunbagWeapon), [], true];
