#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(HITPOINTS) = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
GVAR(SELECTIONS) = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];

call FUNC(parseConfigForInjuries);
GVAR(STATE_MACHINE) = (configFile >> "ACE_Medical_StateMachine") call FUNC(createStateMachine);

ADDON = true;
