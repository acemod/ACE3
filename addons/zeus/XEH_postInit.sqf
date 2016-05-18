#include "script_component.hpp"

// Global skill module PVs values for persistence, just listen for the PV
QGVAR(GlobalSkillAI) addPublicVariableEventHandler FUNC(moduleGlobalSetSkill);

[QGVAR(moduleSearchNearby), CBA_fnc_searchNearby] call EFUNC(common,addEventHandler);
