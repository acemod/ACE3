#include "script_component.hpp"
/*
 * Author: commy2
 * Shows a message in system chat of who killed whom.
 *
 * Arguments:
 * 0: Unit <OBJECT>
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

// fix, because ace medical cause _unit == _killer
if (_unit == _killer) then {
   _killer = _unit getVariable [QEGVAR(medical,lastDamageSource), _killer];
};

if (_unit != _killer && {side group _unit in [side group ACE_player, civilian]} && {side group _killer == side group ACE_player}) then {
    private _msg = format ["[FriendlyFire] " + localize LSTRING(FriendlyFire_Message), 
            ([_unit, false, true] call EFUNC(common,getName)) + ([" (AI)", ""] select (isPlayer _unit)),
            ([_killer, false, true] call EFUNC(common,getName)) + ([" (AI)", ""] select (isPlayer _killer))
        ];
    
    systemChat _msg;
    diag_log text _msg;

    // Raise ACE globalEvent
    ["ace_killedByFriendly", [_unit, _killer]] call CBA_fnc_globalEvent;
};
