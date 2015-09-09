/*
 * Author: SilentSpike
 * Interrupts the spectator interface for external systems
 *
 * Arguments:
 * 0: Reason <STRING>
 * 1: Interrupting <BOOL>
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
    if (isNull (findDisplay 12249)) then {
        createDialog QGVAR(interface);
        [] call FUNC(transitionCamera);
    };
} else {
    if !(isNull (findDisplay 12249)) then {
        while {dialog} do {
            closeDialog 0;
        };

        (findDisplay 12249) closeDisplay 0;
    };
};
