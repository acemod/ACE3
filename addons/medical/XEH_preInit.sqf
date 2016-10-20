#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(HITPOINTS) = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
GVAR(SELECTIONS) = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];

GVAR(STATE_MACHINE) = (configFile >> "ACE_Medical_StateMachine") call FUNC(createStateMachine);

// @todo, ACE_Settings
[
    QGVAR(advancedBandages),
    "CHECKBOX",
    ["Advanced Bandages", "All bandages have different wound effectivenesses and reopening chances."], //@todo
    "ACE Medical", // @todo
    false,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(advancedIVBags),
    "CHECKBOX",
    ["Advanced IV Bags", "IV Bags will slowly fill up lost blood."], //@todo
    "ACE Medical", // @todo
    false,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(advancedMedication),
    "CHECKBOX",
    ["Advanced Medication", "Enables advanced simulation of Morphine, Epinephrine etc."], //@todo
    "ACE Medical", // @todo
    false,
    true
] call CBA_Settings_fnc_init;

ADDON = true;
