#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

/*
[
    QGVAR(advancedBandages),
    "CHECKBOX",
    ["Advanced Bandages", "All bandages have different wound effectivenesses and reopening chances."], //@todo
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
    QGVAR(fatalInjuryCondition),
    "LIST",
    ["Allow Fatal Injury", "Governs when a fatal injury can occur."], //@todo
    "ACE Medical", // @todo
    [
        [0, 1, 2],
        ["Always", "In Cardiac Arrest", "Never"],
        0
    ],
    true
] call CBA_Settings_fnc_init;

[
    QGVAR(cardiacArrestTime),
    "SLIDER",
    ["Cardiac Arrest Time", "Sets how long cardiac arrest will last for on average (in seconds)."], //@todo
    "ACE Medical", // @todo
    [0, 300, 30, 0],
    true
] call CBA_Settings_fnc_init;
*/

ADDON = true;
