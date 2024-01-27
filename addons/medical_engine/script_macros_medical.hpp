// #define DEBUG_MODE_FULL
// #define DISABLE_COMPILE_CACHE
// #define ENABLE_PERFORMANCE_COUNTERS

#define ALL_BODY_PARTS ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]
#define ALL_SELECTIONS ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"]
#define ALL_HITPOINTS ["HitHead", "HitChest", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"]

#define HITPOINT_INDEX_HEAD 0
#define HITPOINT_INDEX_BODY 1
#define HITPOINT_INDEX_LARM 2
#define HITPOINT_INDEX_RARM 3
#define HITPOINT_INDEX_LLEG 4
#define HITPOINT_INDEX_RLEG 5

// Damage threshold above which fatal organ damage can occur
#define HEAD_DAMAGE_THRESHOLD EGVAR(medical,const_headDamageThreshold)
#define HEAD_DAMAGE_THRESHOLD_DEFAULT 1
#define ORGAN_DAMAGE_THRESHOLD EGVAR(medical,const_organDamageThreshold)
#define ORGAN_DAMAGE_THRESHOLD_DEFAULT 0.6
// Consts for determineIfFatal: sum of damage (values are calcualted at runtime in preInit)
#define FATAL_SUM_DAMAGE_WEIBULL_K EGVAR(medical,const_fatalSumDamageWeibull_K)
#define FATAL_SUM_DAMAGE_WEIBULL_L EGVAR(medical,const_fatalSumDamageWeibull_L)

// Chance to hit heart based on ratio of 70kg (approx. 70L) body to 70mL stroke volume of heart
// Assuming torso is 50% of the body volume (35L)
#define HEART_HIT_CHANCE EGVAR(medical,const_heartHitChance)
#define HEART_HIT_CHANCE_DEFAULT 0.05

#define MEDICAL_ACTION_DISTANCE 1.75

// scale received pain to 0-2 level to select type of scream
// below 0.25: 0, from 0.25 to 0.5: 1, more than 0.5: 2
#define PAIN_TO_SCREAM(pain) (floor (4 * pain) min 2)

// scale received pain to 0-2 level to select type of scream
// below 0.33: 0, from 0.34 to 0.66: 1, more than 0.67: 2
#define PAIN_TO_MOAN(pain) (floor (3 * pain) min 2)

#define GET_NUMBER(config,default) (if (isNumber (config)) then {getNumber (config)} else {default})
#define GET_STRING(config,default) (if (isText (config)) then {getText (config)} else {default})
#define GET_ARRAY(config,default) (if (isArray (config)) then {getArray (config)} else {default})

#define DEFAULT_HEART_RATE 80
#define DEFAULT_PERIPH_RES 100

// --- blood
// 0.077 l/kg * 80kg = 6.16l
#define DEFAULT_BLOOD_VOLUME 6.0 // in liters

#define BLOOD_VOLUME_CLASS_1_HEMORRHAGE 6.000 // lost less than 15% blood, Class I Hemorrhage
#define BLOOD_VOLUME_CLASS_2_HEMORRHAGE 5.100 // lost more than 15% blood, Class II Hemorrhage
#define BLOOD_VOLUME_CLASS_3_HEMORRHAGE 4.200 // lost more than 30% blood, Class III Hemorrhage
#define BLOOD_VOLUME_CLASS_4_HEMORRHAGE 3.600 // lost more than 40% blood, Class IV Hemorrhage
#define BLOOD_VOLUME_FATAL 3.0 // Lost more than 50% blood, Unrecoverable

// Minimum blood volume, in liters, for a patient to have the chance to wake up
#define MINIMUM_BLOOD_FOR_STABLE_VITALS EGVAR(medical,const_stableVitalsBloodThreshold)
#define MINIMUM_BLOOD_FOR_STABLE_VITALS_DEFAULT BLOOD_VOLUME_CLASS_2_HEMORRHAGE

// IV Change per second calculation:
// 250 ml should take 60 seconds to fill. 250 ml / 60 s ~ 4.1667 ml/s.
#define IV_CHANGE_PER_SECOND 4.1667 // in milliliters per second

// Minimum amount of damage required for penetrating wounds (also minDamage for velocity wounds)
#define PENETRATION_THRESHOLD EGVAR(medical,const_penetrationThreshold)
#define PENETRATION_THRESHOLD_DEFAULT 0.35

// To be replaced by a proper blood pressure calculation
#define BLOOD_LOSS_KNOCK_OUT_THRESHOLD EGVAR(medical,const_bloodLossKnockOutThreshold)
#define BLOOD_LOSS_KNOCK_OUT_THRESHOLD_DEFAULT 0.5 // 50% of cardiac output

// Used to color interaction icons and body image selections
#define BLOOD_LOSS_RED_THRESHOLD 0.5
#define BLOOD_LOSS_TOTAL_COLORS 10
#define DAMAGE_BLUE_THRESHOLD 0.8
#define DAMAGE_TOTAL_COLORS 10

// Qualitative bleed rate thresholds as a fraction of knock out blood loss
// Note that half of knock out blood loss is considered unstable, and knock out blood loss is considered critical
#define BLEED_RATE_SLOW 0.1 // Slow - One fifth of unstable blood loss
#define BLEED_RATE_MODERATE 0.5 // Moderate - Vitals considered stable
#define BLEED_RATE_SEVERE 1.0 // Severe - Vitals considered unstable
// Massive - Vitals considered critical

// Pain above which a unit can go unconscious upon receiving damage
#define PAIN_UNCONSCIOUS EGVAR(medical,painUnconsciousThreshold)

// Pain fade out time (time it takes until pain is guaranteed to be completly gone)
#define PAIN_FADE_TIME EGVAR(medical,const_painFadeTime)
#define PAIN_FADE_TIME_DEFAULT 900

// Only relevant when advanced medication is disabled
// Morphine pain suppression fade out time (time it takes until pain suppression is guaranteed to be completly gone)
#define PAIN_SUPPRESSION_FADE_TIME 1800

// Chance to wake up when vitals are stable (checked once every SPONTANEOUS_WAKE_UP_INTERVAL seconds)
#define SPONTANEOUS_WAKE_UP_INTERVAL EGVAR(medical,const_wakeUpCheckInterval)
#define SPONTANEOUS_WAKE_UP_INTERVAL_DEFAULT 15

// Minimum leg damage required for limping
#define LIMPING_DAMAGE_THRESHOLD EGVAR(medical,const_limpingDamageThreshold)
#define LIMPING_DAMAGE_THRESHOLD_DEFAULT 0.30

// Minimum limb damage required for fracture
#define FRACTURE_DAMAGE_THRESHOLD EGVAR(medical,const_fractureDamageThreshold)
#define FRACTURE_DAMAGE_THRESHOLD_DEFAULT 0.50

// Minimum body part damage required for blood effect on uniform
#define VISUAL_BODY_DAMAGE_THRESHOLD 0.35

// Empty wound data, used for some default return values
// [classID, amountOf, bloodloss, damage]
#define EMPTY_WOUND [-1, 0, 0, 0]

// Base time to bandage each wound category
#define BANDAGE_TIME_S 4
#define BANDAGE_TIME_M 6
#define BANDAGE_TIME_L 8
#define BANDAGE_TIME_MOD_MEDIC -2
#define BANDAGE_TIME_MOD_SELF 4

#define DEFAULT_BANDAGE_REOPENING_CHANCE 0.1
#define DEFAULT_BANDAGE_REOPENING_MIN_DELAY 120
#define DEFAULT_BANDAGE_REOPENING_MAX_DELAY 200

#define DEFAULT_TOURNIQUET_VALUES [0,0,0,0,0,0]

#define DEFAULT_FRACTURE_VALUES [0,0,0,0,0,0]

// Triage colors, for consistency across UIs and functions
#define TRIAGE_COLOR_NONE      0, 0, 0, 0.9
#define TRIAGE_COLOR_MINIMAL   0, 0.5, 0, 0.9
#define TRIAGE_COLOR_DELAYED   1, 0.84, 0, 0.9
#define TRIAGE_COLOR_IMMEDIATE 1, 0, 0, 0.9
#define TRIAGE_COLOR_DECEASED  0, 0, 0, 0.9

#define TRIAGE_TEXT_COLOR_NONE      1, 1, 1, 1
#define TRIAGE_TEXT_COLOR_MINIMAL   1, 1, 1, 1
#define TRIAGE_TEXT_COLOR_DELAYED   0, 0, 0, 1
#define TRIAGE_TEXT_COLOR_IMMEDIATE 1, 1, 1, 1
#define TRIAGE_TEXT_COLOR_DECEASED  1, 1, 1, 1

// Medical activity logs
#define MED_LOG_MAX_ENTRIES 8
#define MED_LOG_VARNAME(type) (format [QEGVAR(medical,log_%1), type])

// - Unit Variables ----------------------------------------------------
// These variables get stored in object space and used across components
// Defined here for easy consistency with GETVAR/SETVAR (also a list for reference)
#define VAR_BLOOD_PRESS       QEGVAR(medical,bloodPressure)
#define VAR_BLOOD_VOL         QEGVAR(medical,bloodVolume)
#define VAR_WOUND_BLEEDING    QEGVAR(medical,woundBleeding)
#define VAR_CRDC_ARRST        QEGVAR(medical,inCardiacArrest)
#define VAR_HEART_RATE        QEGVAR(medical,heartRate)
#define VAR_PAIN              QEGVAR(medical,pain)
#define VAR_PAIN_SUPP         QEGVAR(medical,painSuppress)
#define VAR_PERIPH_RES        QEGVAR(medical,peripheralResistance)
#define VAR_UNCON             "ACE_isUnconscious"
#define VAR_OPEN_WOUNDS       QEGVAR(medical,openWounds)
#define VAR_BANDAGED_WOUNDS   QEGVAR(medical,bandagedWounds)
#define VAR_STITCHED_WOUNDS   QEGVAR(medical,stitchedWounds)
// These variables track gradual adjustments (from medication, etc.)
#define VAR_MEDICATIONS       QEGVAR(medical,medications)
// These variables track the current state of status values above
#define VAR_HEMORRHAGE        QEGVAR(medical,hemorrhage)
#define VAR_IN_PAIN           QEGVAR(medical,inPain)
#define VAR_TOURNIQUET        QEGVAR(medical,tourniquets)
#define VAR_FRACTURES         QEGVAR(medical,fractures)

// - Unit Functions ---------------------------------------------------
// Retrieval macros for common unit values
// Defined for easy consistency and speed
#define GET_SM_STATE(_unit)         ([_unit, EGVAR(medical,STATE_MACHINE)] call CBA_statemachine_fnc_getCurrentState)
#define GET_BLOOD_VOLUME(unit)      (unit getVariable [VAR_BLOOD_VOL, DEFAULT_BLOOD_VOLUME])
#define GET_WOUND_BLEEDING(unit)    (unit getVariable [VAR_WOUND_BLEEDING, 0])
#define GET_HEART_RATE(unit)        (unit getVariable [VAR_HEART_RATE, DEFAULT_HEART_RATE])
#define GET_HEMORRHAGE(unit)        (unit getVariable [VAR_HEMORRHAGE, 0])
#define GET_PAIN(unit)              (unit getVariable [VAR_PAIN, 0])
#define GET_PAIN_SUPPRESS(unit)     (unit getVariable [VAR_PAIN_SUPP, 0])
#define GET_TOURNIQUETS(unit)       (unit getVariable [VAR_TOURNIQUET, DEFAULT_TOURNIQUET_VALUES])
#define GET_FRACTURES(unit)         (unit getVariable [VAR_FRACTURES, DEFAULT_FRACTURE_VALUES])
#define IN_CRDC_ARRST(unit)         (unit getVariable [VAR_CRDC_ARRST, false])
#define IS_BLEEDING(unit)           (GET_WOUND_BLEEDING(unit) > 0)
#define IS_IN_PAIN(unit)            (unit getVariable [VAR_IN_PAIN, false])
#define IS_UNCONSCIOUS(unit)        (unit getVariable [VAR_UNCON, false])
#define GET_OPEN_WOUNDS(unit)       (unit getVariable [VAR_OPEN_WOUNDS, createHashMap])
#define GET_BANDAGED_WOUNDS(unit)   (unit getVariable [VAR_BANDAGED_WOUNDS, createHashMap])
#define GET_STITCHED_WOUNDS(unit)   (unit getVariable [VAR_STITCHED_WOUNDS, createHashMap])
#define GET_DAMAGE_THRESHOLD(unit)  (unit getVariable [QEGVAR(medical,damageThreshold), [EGVAR(medical,AIDamageThreshold),EGVAR(medical,playerDamageThreshold)] select (isPlayer unit)])

// The following function calls are defined here just for consistency
#define GET_BLOOD_LOSS(unit)        ([unit] call EFUNC(medical_status,getBloodLoss))
#define GET_BLOOD_PRESSURE(unit)    ([unit] call EFUNC(medical_status,getBloodPressure))

// Derivative unit values commonly used
#define GET_PAIN_PERCEIVED(unit)    (0 max (GET_PAIN(unit) - GET_PAIN_SUPPRESS(unit)) min 1)

#define HAS_TOURNIQUET_APPLIED_ON(unit,index) ((GET_TOURNIQUETS(unit) select index) > 0)

// Cache expiry values, in seconds
#define IN_MEDICAL_FACILITY_CACHE_EXPIRY 1
#define CAN_TREAT_CONDITION_CACHE_EXPIRY 2

// Ignore UAV/Drone AI Base Classes
#define IGNORE_BASE_UAVPILOTS "B_UAV_AI", "O_UAV_AI", "UAV_AI_base_F"
