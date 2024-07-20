#include "..\script_component.hpp"
/*
 * Author: Glowbal
 * Check if given unit has a magazine of given classname. Note: Case sensitive.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Magazine classname <STRING>
 *
 * Return Value:
 * Unit has magazine <BOOL>
 *
 * Example:
 * [player, "30Rnd_65x39_caseless_mag"] call ace_common_fnc_hasMagazine
 *
 * Public: yes
 */

params [["_unit", objNull, [objNull]], ["_magazine", "", [""]]];

_magazine in ([_unit, 2] call FUNC(uniqueItems)) // return
