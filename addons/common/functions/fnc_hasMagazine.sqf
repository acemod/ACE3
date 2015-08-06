/*
 * Author: Glowbal
 *
 * Check if given unit has a magazine of given classname
 *
 * Arguments:
 * 0: Unit (OBJECT)
 * 1: Magazine Classname (STRING)
 *
 * Return Value:
 * has Magazine (BOOLEAN)
 *
 * Public: yes
 */
#include "script_component.hpp"

private ["_return"];
params ["_unit", "_magazine"];

_return = if (_magazine != "") then {
    (_magazine in magazines _unit)
} else {
    false
};

_return
