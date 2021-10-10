#include "script_component.hpp"
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
 * Example:
 * [bob, "magazine"] call ace_common_fnc_hasMagazine
 *
 * Public: yes
 *
 * Note: Case sensitive
 */

params [["_unit", objNull, [objNull]], ["_magazine", "", [""]]];

_magazine in magazines _unit // return
