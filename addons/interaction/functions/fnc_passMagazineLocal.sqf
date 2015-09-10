/*
 * Author: BaerMitUmlaut
 * Pass spare magazine for the specified weapon.
 *
 * Arguments:
 * 0: Unit that passes the magazine <OBJECT>
 * 1: Unit to pass the magazine to <OBJECT>
 * 2: Magazine classname <STRING>
 * 3: Amount of rounds in magazine <NUMBER>
 * 
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _player, "30Rnd_65x39_caseless_mag", 30] call ace_interaction_fnc_magToPassazine
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_unit", "_target", "_magazine", "_ammoCount"];

_target addMagazine [_magazine, _ammoCount];
if (_target == ACE_player) then {
    [parseText format [localize LSTRING(PassMagazineHint), name _unit, getText (configFile >> "CfgMagazines" >> _magazine >> "displayName")]] call EFUNC(common,displayTextStructured);
};