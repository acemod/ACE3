/*
 * Author: SilentSpike
 * Interrupts the spectator interface for external systems
 *
 * Arguments:
 * 0: Reason <STRING>
 * 1: Interrupting <BOOL> (default: true)
 *
 * Return Value:
 * None <NIL>
 *
 * Example:
 * ["mySystem"] call ace_spectator_fnc_interrupt
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_reason", "", [""]], ["_interrupt", true, [true]]];

// Nothing to do when spectator is closed
if !(GVAR(isSet)) exitWith {};

if (_reason == "") exitWith { ERROR("Invalid Reason"); };
if (_interrupt) then {
    GVAR(interrupts) pushBack _reason;
} else {
    GVAR(interrupts) = GVAR(interrupts) - [_reason];
};

if (GVAR(interrupts) isEqualTo []) then {
    if (isNull (GETUVAR(GVAR(interface),displayNull))) then {
        (findDisplay 46) createDisplay QGVAR(interface);
        [] call FUNC(transitionCamera);
    };
} else {
    if !(isNull (GETUVAR(GVAR(interface),displayNull))) then {
        while {dialog} do {
            closeDialog 0;
        };

        (GETUVAR(GVAR(interface),displayNull)) closeDisplay 0;
    };
};
