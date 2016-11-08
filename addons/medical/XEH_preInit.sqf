#include "script_component.hpp"

ADDON = false;

#include "XEH_PREP.hpp"

GVAR(HITPOINTS) = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];
GVAR(SELECTIONS) = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];

GVAR(STATE_MACHINE) = (configFile >> "ACE_Medical_StateMachine") call CBA_statemachine_fnc_createFromConfig;

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

[
    QGVAR(enableInstantDeath),
    "CHECKBOX",
    ["Enable Instant Death", "Enables units instantly dying without entering cardiac arrest first."], //@todo
    "ACE Medical", // @todo
    true,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(enableExecutions),
    "CHECKBOX",
    ["Enable Executions", "Enables killing units that are in cardiac arrest. Only matters when instant death is disabled."], //@todo
    "ACE Medical", // @todo
    true,
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(maximumCardiacArrestTime),
    "SLIDER",
    ["Maximum Cardiac Arrest Time", "Sets the maximum amount of time a unit can stay in cardiac arrest before dying."], //@todo
    "ACE Medical", // @todo
    [0, 30, 2, 0],
    true
] call CBA_Settings_fnc_init;

ADDON = true;
