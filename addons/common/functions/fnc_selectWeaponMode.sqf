/*
 * Author: commy2
 * Unit selects given muzzle and weapon mode.
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: weapon or Muzzle <STRING>
 * 2: weapon Mode <STRING>
 *
 * Return Value:
 * Successful? <BOOL>
 *
 * Example:
 * [player, primaryWeapon player, "FullAuto"] call ace_common_fnc_selectWeaponMode
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_muzzle", "_mode"];

local _index = 0;

while {
    _index < 100 && {currentMuzzle _unit != _muzzle || {currentWeaponMode _unit != _mode}}
} do {
    _unit action ["SwitchWeapon", _unit, _unit, _index];
    _index = _index + 1;
};

_index < 100 // return
