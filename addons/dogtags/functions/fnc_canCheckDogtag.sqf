#include "..\script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if the target's dog tag can be checked by the unit.
 *
 * Arguments:
 * 0: Player (not used) <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * If dog tag can be checked <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_dogtags_fnc_canCheckDogtag
 *
 * Public: No
 */

params ["", "_target"];

if (isNull _target) exitWith {false};

// Check if disabled for faction
if ((faction _target) in GVAR(disabledFactions)) exitWith {false};

!(_target call EFUNC(common,isAwake))
