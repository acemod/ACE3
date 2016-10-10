
#define ALL_BODY_PARTS ["head", "body", "leftarm", "rightarm", "leftleg", "rightleg"]

#define CUR_LEVEL (["Basic", "Advanced"] select (EGVAR(medical,level) >= 2))

// scale received pain to 0-2 level to select type of scream
// below 0.25: 0, from 0.25 to 0.5: 1, more than 0.5: 2
#define PAIN_TO_SCREAM(pain) (floor (4 * pain) min 2)

// scale received pain to 0-2 level to select type of scream
// below 0.33: 0, from 0.34 to 0.66: 1, more than 0.67: 2
#define PAIN_TO_MOAN(pain) (floor (3 * pain) min 2)

#define GET_NUMBER(config,default) (if (isNumber (config)) then {getNumber (config)} else {default})
#define GET_STRING(config,default) (if (isText (config)) then {getText (config)} else {default})
#define GET_ARRAY(config,default) (if (isArray (config)) then {getArray (config)} else {default})

// --- blood
#define DEFAULT_BLOOD_VOLUME 6.0 // in liters

#define HAS_LOST_SOME_BLOOD_THRESHOLD 0.100 // in liters
#define HAS_LOST_MUCH_BLOOD_THRESHOLD 0.500 // in liters

#define BLOOD_VOLUME_UNCONSCIOUS 3.6 // in liters
#define BLOOD_VOLUME_DEAD 1.8 // in liters
#define BLOOD_VOLUME_CARDIAC_ARREST 1.2 // in liters

/*
    IV Change per second calculation:
    250ml should take 60 seconds to fill. 250/60 = 4.166.
    Basic medical is 10x (will take 6 seconds for 250ml)
 */
#define IV_CHANGE_PER_SECOND         ([41.66, 4.166] select (GVAR(level) >= 2))
