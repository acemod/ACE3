#include "..\script_component.hpp"
/*
 * Author: SzwedzikPL
 * Checks if the target's dog tag can be taken by the unit.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * If dog tag can be taken <BOOL>
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

// CBA_fnc_canAddItem doesn't account for mass 0 items and unit not having any containers
!(_target call EFUNC(common,isAwake)) && {(uniform _player + vest _player + backpack _player) != ""} && {[_player, "ACE_dogtag_1"] call CBA_fnc_canAddItem}
// Todo: Use code below in 2.18
// _player canAdd ["ACE_dogtag_1", 1, true]
