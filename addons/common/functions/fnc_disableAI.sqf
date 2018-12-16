#include "script_component.hpp"
/*
 * Author: Glowbal, KoffeinFlummi
 * Disables/Enables AI
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Disable AI <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, true] call ace_common_fnc_disableAI
 *
 * Public: No
 */

params [["_unit", objNull, [objNull]], ["_disable", true, [false]]];

if (!local _unit) exitWith {};

if !([_unit] call EFUNC(common,isPlayer)) then {
    if (_disable) then {
        _unit disableAI "MOVE";
        _unit disableAI "TARGET";
        _unit disableAI "AUTOTARGET";
        _unit disableAI "FSM";
        _unit disableConversation true;
    } else {
        //Sanity check to make sure we don't enable unconsious AI
        if (_unit getVariable ["ace_isunconscious", false] && alive _unit) exitWith {
            ERROR("Enabling AI for unconsious unit");
        };

        _unit enableAI "MOVE";
        _unit enableAI "TARGET";
        _unit enableAI "AUTOTARGET";
        _unit enableAI "FSM";
        _unit disableConversation false;
    };
};
