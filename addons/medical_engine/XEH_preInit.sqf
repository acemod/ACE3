#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.inc.sqf"

// Define "Constants" variables (both are macros defined in script_macros_medical.hpp, look there for actual variable names)
if (isNil QUOTE(SPONTANEOUS_WAKE_UP_INTERVAL)) then {SPONTANEOUS_WAKE_UP_INTERVAL = SPONTANEOUS_WAKE_UP_INTERVAL_DEFAULT};
if (isNil QUOTE(MINIMUM_BLOOD_FOR_STABLE_VITALS)) then {MINIMUM_BLOOD_FOR_STABLE_VITALS = MINIMUM_BLOOD_FOR_STABLE_VITALS_DEFAULT};
if (isNil QUOTE(HEAD_DAMAGE_THRESHOLD)) then {HEAD_DAMAGE_THRESHOLD = HEAD_DAMAGE_THRESHOLD_DEFAULT};
if (isNil QUOTE(ORGAN_DAMAGE_THRESHOLD)) then {ORGAN_DAMAGE_THRESHOLD = ORGAN_DAMAGE_THRESHOLD_DEFAULT};
if (isNil QUOTE(HEART_HIT_CHANCE)) then {HEART_HIT_CHANCE = HEART_HIT_CHANCE_DEFAULT};
if (isNil QUOTE(PENETRATION_THRESHOLD)) then {PENETRATION_THRESHOLD = PENETRATION_THRESHOLD_DEFAULT};
if (isNil QUOTE(BLOOD_LOSS_KNOCK_OUT_THRESHOLD)) then {BLOOD_LOSS_KNOCK_OUT_THRESHOLD = BLOOD_LOSS_KNOCK_OUT_THRESHOLD_DEFAULT};
if (isNil QUOTE(PAIN_FADE_TIME)) then {PAIN_FADE_TIME = PAIN_FADE_TIME_DEFAULT};
if (isNil QUOTE(LIMPING_DAMAGE_THRESHOLD)) then {LIMPING_DAMAGE_THRESHOLD = LIMPING_DAMAGE_THRESHOLD_DEFAULT};
if (isNil QUOTE(FRACTURE_DAMAGE_THRESHOLD)) then {FRACTURE_DAMAGE_THRESHOLD = FRACTURE_DAMAGE_THRESHOLD_DEFAULT};
if (isNil QUOTE(CARDIAC_OUTPUT_MIN)) then {CARDIAC_OUTPUT_MIN = CARDIAC_OUTPUT_MIN_DEFAULT};
if (isNil QUOTE(MEDICAL_ACTIVITY)) then {MEDICAL_ACTIVITY = MEDICAL_ACTIVITY_DEFAULT};
// Derive the alternate fatal damage coefficients
if (isNil QUOTE(FATAL_SUM_DAMAGE_WEIBULL_K) || isNil QUOTE(FATAL_SUM_DAMAGE_WEIBULL_L)) then {
    private _x1 = 0.5;
    private _y1 = 0.1;
    private _x2 = 0.8;
    private _y2 = 0.9;
    private _b1 = -ln (1-_y1);
    private _b2 = -ln (1-_y2);
    FATAL_SUM_DAMAGE_WEIBULL_K = ln(_b1/_b2) / ln(_x1/_x2);
    FATAL_SUM_DAMAGE_WEIBULL_L = _x1 / _b1^(1/FATAL_SUM_DAMAGE_WEIBULL_K);
};

// Cache for armor values of equipped items (vests etc)
GVAR(armorCache) = createHashMap;

// Hack for #3168 (units in static weapons do not take any damage):
// Doing a manual pre-load with a small distance seems to fix the LOD problems
// with handle damage not returning full results.
GVAR(fixedStatics) = [];

GVAR(animations) = createHashMapFromArray [
    [toLowerANSI QUNCON_ANIM(faceUp), [QUNCON_ANIM(2),QUNCON_ANIM(2_1),QUNCON_ANIM(7_1),QUNCON_ANIM(8_1),QUNCON_ANIM(5_1),QUNCON_ANIM(6_1)]],
    [toLowerANSI QUNCON_ANIM(faceDown), [QUNCON_ANIM(1),QUNCON_ANIM(3),QUNCON_ANIM(4),"unconscious",QUNCON_ANIM(9),QUNCON_ANIM(3_1),QUNCON_ANIM(4_1)]],
    [toLowerANSI QUNCON_ANIM(faceLeft), [QUNCON_ANIM(7),QUNCON_ANIM(8),QUNCON_ANIM(1_1),QUNCON_ANIM(7_1),QUNCON_ANIM(8_1)]],
    [toLowerANSI QUNCON_ANIM(faceRight), [QUNCON_ANIM(5),QUNCON_ANIM(6),QUNCON_ANIM(10),QUNCON_ANIM(5_1),QUNCON_ANIM(6_1)]]
];

GVAR(customHitpoints) = ["hitleftarm", "hitrightarm", "hitleftleg", "hitrightleg"];

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

["ace_unconscious", {
    params ["_unit", "_active"];
    if (_active) then {
        // Use object reference to indicate the waitUnit is already running (this prevents issues with respawning units keeping SetVars)
        if ((_unit getVariable [QGVAR(waitForAnim), objNull]) == _unit) exitWith {};
        _unit setVariable [QGVAR(waitForAnim), _unit];
        [{(animationState _this) find QUNCON_ANIM(face) != -1}, {
            [_this, animationState _this] call FUNC(applyAnimAfterRagdoll);
        }, _unit, 20] call CBA_fnc_waitUntilAndExecute;
    } else {
        _unit setVariable [QGVAR(waitForAnim), nil];
        if (local _unit) then {
            [_unit, _active] call FUNC(setUnconsciousAnim);
        };
    };
}] call CBA_fnc_addEventhandler;

[] call FUNC(disableThirdParty);

// Future-proofing
EGVAR(medical,enabled) = true; // TODO: remove when medical enable setting is implemented

ADDON = true;
