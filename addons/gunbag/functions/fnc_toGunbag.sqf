/*
 * Author: Ir0n1E
 * put weapon into gunbag
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

params ["_unit", "_target"];

private ["_weapon", "_magazine", "_magazine_gl", "_items", "_gunbag", "_state", "_mass"];

_gunbag = backpackContainer _target;
_state = [_unit, primaryWeapon _unit] call EFUNC(common,getWeaponState);

/*
* example returnvalue _state
* [["","","optic_Aco",""],["arifle_MX_GL_ACO_F","GL_3GL_F"],["30Rnd_65x39_caseless_mag","1Rnd_HE_Grenade_shell"],[30,1]]
*/

_weapon = (_state select 1) select 0;
_magazine = [(_state select 2) select 0, (_state select 3) select 0];
_magazine_gl = [(_state select 2) select 1, (_state select 3) select 1];
_items = _state select 0;

if ((_magazine_gl select 0) != "") then {
    _unit addMagazine _magazine_gl;
};

if ((_magazine select 0) != "") then {
    _unit addMagazine _magazine;
};

_unit removeWeapon _weapon;

// add virtual load
[_target, backpackContainer _target, [_weapon, _items] call FUNC(calculateMass)] call EFUNC(movement,addLoadToUnitContainer);
_gunbag setVariable [QGVAR(GunbagWeapon), [[_weapon], _items], true];

// play sound
if(["ACE_Backpacks"] call EFUNC(common,isModLoaded)) then {
    [_unit, _target, backpackContainer _target] call EFUNC(backpacks,backpackOpened);
};
