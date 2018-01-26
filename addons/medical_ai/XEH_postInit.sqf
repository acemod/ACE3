#include "script_component.hpp"

["ace_settingsInitialized", {
    TRACE_1("settingsInitialized", GVAR(enabledFor));
    if (GVAR(enabledFor) == 0) exitWith {}; // 0: disabled
    if ((GVAR(enabledFor) == 1) && {!isServer} && {hasInterface}) exitWith {}; // 1: Don't Run on non-hc Clients

    // Only run for AI that does not have to deal with advanced medical
    if (EGVAR(medical,level) == 2 && {EGVAR(medical,enableFor) == 1 || hasInterface}) exitWith {};

    ["ace_firedNonPlayer", {
        _unit setVariable [QGVAR(lastFired), CBA_missionTime];
    }] call CBA_fnc_addEventHandler;

    if (hasInterface) then {
        ["ace_unconscious", {
            params ["_unit", "_unconscious"];
            if (!_unconscious || {_unit != ACE_player}) exitWith {};

            private _medic = objNull;
            {
                if ((!isPlayer _x) && {[_x] call EFUNC(medical,isMedic)}) exitWith {
                    _medic = _x;
                };
            } forEach (units _unit);
            if (isNull _medic) exitWith {};

            private _healQueue = _medic getVariable [QGVAR(healQueue), []];
            _healQueue pushBack _unit;
            _medic setVariable [QGVAR(healQueue), _healQueue];
        }] call CBA_fnc_addEventHandler;
    };

    GVAR(statemachine) = [configFile >> "ACE_Medical_AI_StateMachine"] call CBA_statemachine_fnc_createFromConfig;
}] call CBA_fnc_addEventHandler;
