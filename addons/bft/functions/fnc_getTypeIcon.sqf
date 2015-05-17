/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_side", "_type"];
_side = _this select 0;
_type = _this select 1;

if (isClass (configFile >> "ACE_BFT" >> "Types" >> _type)) exitwith {
    getText (configFile >> "ACE_BFT" >> "Types" >> _type >> "iconPath");
};
"\A3\ui_f\data\map\markers\nato\b_inf.paa";
