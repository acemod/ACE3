/*
 * Author: SilentSpike
 * Deprecated. Technically never publically documented, but just in case.
 */
#include "script_component.hpp"

params [["_reason", "", [""]], ["_interrupt", true, [true]]];

ACE_DEPRECATED(QFUNC(interrupt),"3.12.0","just close and reopen spectator");

// Nothing to do when spectator is closed
if !(GVAR(isSet)) exitWith {};

if (_reason == "") exitWith { WARNING("Invalid Reason"); };
if (_interrupt) then {
    GVAR(interrupts) pushBack _reason;
} else {
    GVAR(interrupts) = GVAR(interrupts) - [_reason];
};

if (GVAR(interrupts) isEqualTo []) then {
    if (isNull SPEC_DISPLAY) then {
        [true] call FUNC(ui);
    };
} else {
    if !(isNull SPEC_DISPLAY) then {
        [false] call FUNC(ui);
    };
};
