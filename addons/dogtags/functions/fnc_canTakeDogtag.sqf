#include "..\script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if the target's dogtag can be taken by the unit.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * If dogtag can be taken <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_dogtags_fnc_canTakeDogtag
 *
 * Public: No
 */

params ["_player", "_target"];

if (isNull _target) exitWith {false};

// Check if disabled for faction
if ((faction _target) in GVAR(disabledFactions)) exitWith {false};

!(_target call EFUNC(common,isAwake)) && {_player canAdd ["ACE_dogtag_1", 1/*, true*/]} // Todo: Uncomment in 2.18
