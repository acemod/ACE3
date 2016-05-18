#include "script_component.hpp"

// Global skill module PVs values for persistence, just listen for the PV
QGVAR(GlobalSkillAI) addPublicVariableEventHandler FUNC(moduleGlobalSetSkill);

[QGVAR(moduleDefendArea), CBA_fnc_taskDefend] call EFUNC(common,addEventHandler);
[QGVAR(modulePatrolArea), CBA_fnc_taskPatrol] call EFUNC(common,addEventHandler);
[QGVAR(moduleSearchNearby), CBA_fnc_searchNearby] call EFUNC(common,addEventHandler);
[QGVAR(moduleSearchArea), CBA_fnc_taskSearchArea] call EFUNC(common,addEventHandler);
