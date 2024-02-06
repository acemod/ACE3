#include "script_component.hpp"

["CBA_settingsInitialized", {
    TRACE_1("settingsInitialized",GVAR(enabledFor));
    if (GVAR(enabledFor) == 0) exitWith {}; // 0: disabled
    if ((GVAR(enabledFor) == 1) && {!isServer} && {hasInterface}) exitWith {}; // 1: Don't Run on non-hc Clients

    ["ace_firedNonPlayer", {
        _unit setVariable [QGVAR(lastFired), CBA_missionTime];
    }] call CBA_fnc_addEventHandler;

    ["CAManBase", "Hit", {
        params ["_unit"];
        _unit setVariable [QGVAR(lastHit), CBA_missionTime];
    }] call CBA_fnc_addClassEventHandler;

    ["CAManBase", "Suppressed", {
        params ["_unit"];
        _unit setVariable [QGVAR(lastSuppressed), CBA_missionTime];
    }] call CBA_fnc_addClassEventHandler;

    #include "stateMachine.inc.sqf"

}] call CBA_fnc_addEventHandler;
