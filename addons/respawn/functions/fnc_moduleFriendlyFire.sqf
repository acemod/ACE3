/*
 * Author: commy2
 * Initializes the friendly fire module.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Synced units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [logic, [ACE_Player], true] call ace_respawn_fnc_moduleFriendlyFire
 *
 * Public: No
 */
#include "script_component.hpp"

[{
    params ["_args", "_pfhId"];
    _args params ["_logic", "_units", "_activated"];

    if (!_activated) exitWith {};
    if (!isServer) exitWith {};

    missionNamespace setVariable [QGVAR(showFriendlyFireMessage), true];
    publicVariable QGVAR(showFriendlyFireMessage);

    diag_log text "[ACE]: Friendly Fire Messages Module Initialized.";

    ["_pfhId"] call CBA_fnc_removePerFrameHandler;
}, 0, _this] call CBA_fnc_addPerFrameHandler;
