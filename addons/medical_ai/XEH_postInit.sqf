#include "script_component.hpp"

["ace_settingsInitialized", {
    TRACE_1("settingsInitialized", GVAR(enabledFor));
    if (GVAR(enabledFor) == 0) exitWith {}; // 0: disabled
    if ((GVAR(enabledFor) == 1) && {!isServer} && {hasInterface}) exitWith {}; // 1: Don't Run on non-hc Clients

    ["ace_firedNonPlayer", {
        _unit setVariable [QGVAR(lastFired), CBA_missionTime];
    }] call CBA_fnc_addEventHandler;

    #include "stateMachine.sqf"
}] call CBA_fnc_addEventHandler;

