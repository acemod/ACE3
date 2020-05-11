#include "script_component.hpp"
/*
 * Author: commy2
 * Shows a message in system chat of who killed whom.
 *
 * Arguments:
 * 0: Unitn <OBJECT>
 * 1: Killer <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_Player, killer] call ace_respawn_fnc_showFriendlyFireMessage
 *
 * Public: No
 */

params ["_unit", "_killer"];

if (_unit != _killer && {side group _unit in [side group ACE_player, civilian]} && {side group _killer == side group ACE_player}) then {
    systemChat format ["%1 was killed by %2", [_unit, false, true] call EFUNC(common,getName), [_killer, false, true] call EFUNC(common,getName)];

    // Raise ACE globalEvent
    ["ace_killedByFriendly", [_unit, _killer]] call CBA_fnc_globalEvent;
};
