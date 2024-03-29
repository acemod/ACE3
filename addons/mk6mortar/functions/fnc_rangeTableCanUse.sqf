#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Can player open 82mm rangetable.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Player <OBJECT>
 *
 * Return Value:
 * Can Open <BOOL>
 *
 * Example:
 * [bob, bob] call ace_mk6mortar_fnc_rangeTableCanUse
 *
 * Public: No
 */

params ["_vehicle", "_player"];

"ACE_RangeTable_82mm" in (_player call EFUNC(common,uniqueItems));
