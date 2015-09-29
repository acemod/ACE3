/*
 * Author: Glowbal
 * Check if given unit has a magazine of given classname
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Magazine Classname <STRING>
 *
 * Return Value:
 * has Magazine <BOOL>
 *
 * Public: yes
 */
#include "script_component.hpp"

params ["_unit", "_magazine"];

_magazine in magazines _unit // return
