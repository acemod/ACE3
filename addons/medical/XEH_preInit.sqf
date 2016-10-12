#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(HITPOINTS) = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
GVAR(SELECTIONS) = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];

GVAR(STATE_MACHINE) = (configFile >> "ACE_Medical_StateMachine") call FUNC(createStateMachine);

[
    QGVAR(basicIVBags),
    "CHECKBOX",
    ["Basic IV Bags", "IV Bags fill up lost blood instantly"], //@todo
    "ACE Medical", // @todo
    true,
    true
] call CBA_Settings_fnc_init;

ADDON = true;
