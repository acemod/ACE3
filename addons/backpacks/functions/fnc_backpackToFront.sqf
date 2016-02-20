/*
 * Author: marc_book
 * Put's backpack to front.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * NONE.
 */

#include "script_component.hpp"

private ["_unit", "_holder"];
_unit = _this select 0;
_holder = [_unit] call EFUNC(common,dropBackpack);

_holder attachTo [_unit, [-0.1,0.8,-0.05], "Pelvis"];
_holder setVectorDirAndUp [[0, 0, -1], [0, 1, 0]];

_unit setVariable ["ACE_Backpack", _holder];