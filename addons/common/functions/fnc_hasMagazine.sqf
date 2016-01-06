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
 *
 * Note: Case sensitive
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_magazine", "", [""]]];

_magazine in magazines _unit // return
