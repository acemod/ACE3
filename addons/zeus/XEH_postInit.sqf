#include "script_component.hpp"

// Global skill module PVs values for persistence, just listen for the PV
QGVAR(GlobalSkillAI) addPublicVariableEventHandler FUNC(moduleGlobalSetSkill);

[QGVAR(moduleDefendArea), CBA_fnc_taskDefend] call CBA_fnc_addEventHandler;
[QGVAR(modulePatrolArea), CBA_fnc_taskPatrol] call CBA_fnc_addEventHandler;
[QGVAR(moduleSearchNearby), CBA_fnc_searchNearby] call CBA_fnc_addEventHandler;
[QGVAR(moduleSearchArea), CBA_fnc_taskSearchArea] call CBA_fnc_addEventHandler;
