#include "..\script_component.hpp"
/*
 * Author: bux578
 * Handles the XEH killed event.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Killer <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, bad_dude] call ace_respawn_fnc_handleKilled
 *
 * Public: No
 */

params ["_unit"];

// Saves the gear when the player! (and only him) is killed
if (ACE_player == _unit && {GVAR(SavePreDeathGear)}) then {
    _unit setVariable [QGVAR(unitGear), [_unit] call CBA_fnc_getLoadout];
    _unit setVariable [QGVAR(activeWeaponAndMuzzle), (weaponState _unit) select [0, 3]];
    [QGVAR(saveGear), _unit] call CBA_fnc_localEvent;
};

if (missionNamespace getVariable [QGVAR(showFriendlyFireMessage), false]) then {
    [QGVAR(showFriendlyFireMessageEvent), _this] call CBA_fnc_globalEvent;
};
