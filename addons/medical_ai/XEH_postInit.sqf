#include "script_component.hpp"

["ace_firedNonPlayer", {
    _unit setVariable [QGVAR(lastFired), CBA_missionTime];
}] call CBA_fnc_addEventHandler;

GVAR(statemachine) = [configFile >> "ACE_Medical_AI_StateMachine"] call CBA_statemachine_fnc_createFromConfig;
