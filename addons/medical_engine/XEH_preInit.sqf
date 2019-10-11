#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

// Define "Constants" variables
HEAD_DAMAGE_THRESHOLD = HEAD_DAMAGE_THRESHOLD_DEFAULT;
ORGAN_DAMAGE_THRESHOLD = ORGAN_DAMAGE_THRESHOLD_DEFAULT;
FATAL_SUM_DAMAGE_WEIBULL_K = FATAL_SUM_DAMAGE_WEIBULL_K_DEFAULT;
FATAL_SUM_DAMAGE_WEIBULL_L = FATAL_SUM_DAMAGE_WEIBULL_L_DEFAULT;
HEART_HIT_CHANCE = HEART_HIT_CHANCE_DEFAULT;
PENETRATION_THRESHOLD = PENETRATION_THRESHOLD_DEFAULT;
BLOOD_LOSS_KNOCK_OUT_THRESHOLD = BLOOD_LOSS_KNOCK_OUT_THRESHOLD_DEFAULT;
PAIN_UNCONSCIOUS = PAIN_UNCONSCIOUS_DEFAULT;
PAIN_FADE_TIME = PAIN_FADE_TIME_DEFAULT;
LIMPING_DAMAGE_THRESHOLD = LIMPING_DAMAGE_THRESHOLD_DEFAULT;
FRACTURE_DAMAGE_THRESHOLD = FRACTURE_DAMAGE_THRESHOLD_DEFAULT;

// Hack for #3168 (units in static weapons do not take any damage):
// Doing a manual pre-load with a small distance seems to fix the LOD problems
// with handle damage not returning full results.
GVAR(fixedStatics) = [];

private _fnc_fixStatic = {
    params ["_vehicle"];
    private _type = typeOf _vehicle;

    if !(_type in GVAR(fixedStatics)) then {
        GVAR(fixedStatics) pushBack _type;
        PRELOAD_CLASS(_type);
    };
};

["StaticWeapon", "init", _fnc_fixStatic] call CBA_fnc_addClassEventHandler;
["Car", "init", _fnc_fixStatic] call CBA_fnc_addClassEventHandler;

addMissionEventHandler ["Loaded", {
    {
        PRELOAD_CLASS(_x);
    } forEach GVAR(fixedStatics);
}];

ADDON = true;
