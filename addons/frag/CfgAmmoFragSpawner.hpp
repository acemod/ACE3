#define TARGETED_SPAWNER_PROTOTYPE(size) class GVAR(DOUBLES(size,spawner_2_short)): GVAR(spawnbase_targeted) {\
    submunitionAmmo = QGVAR(size);\
};\
class GVAR(DOUBLES(size,spawner_2_mid)): GVAR(DOUBLES(size,spawner_2_short)) {\
    submunitionConeAngle = 2;\
};\
class GVAR(DOUBLES(size,spawner_2_far)): GVAR(DOUBLES(size,spawner_2_short)) {\
    submunitionConeAngle = 0.7;\
};\
class GVAR(DOUBLES(size,spawner_3_short)): GVAR(DOUBLES(size,spawner_2_short)) {\
    submunitionConeType[] = {"random", 3};\
};\
class GVAR(DOUBLES(size,spawner_3_mid)): GVAR(DOUBLES(size,spawner_3_short)) {\
    submunitionConeAngle = 2;\
};\
class GVAR(DOUBLES(size,spawner_3_far)): GVAR(DOUBLES(size,spawner_3_short)) {\
    submunitionConeAngle = 0.7;\
}

#define RANDOM_SPAWNER_PROTOTYPE(size,count) class GVAR(DOUBLES(TRIPLES(random,size,count),mid)): GVAR(spawnbase) {\
    submunitionConeType[] = {"random", count};\
    submunitionAmmo = QGVAR(size);\
    submunitionConeAngle = 85;\
    triggerSpeedCoef[] = {-1.25, 1.25};\
};\
class GVAR(DOUBLES(TRIPLES(random,size,count),high)): GVAR(spawnbase) {\
    submunitionConeType[] = {"random", count};\
    submunitionAmmo = QGVAR(size);\
    submunitionConeAngle = 80;\
    triggerSpeedCoef[] = {0.75, 1.25};\
};\
class GVAR(DOUBLES(TRIPLES(random,size,count),top)): GVAR(spawnbase) {\
    submunitionConeType[] = {"random", count};\
    submunitionAmmo = QGVAR(size);\
    submunitionConeAngle = 60;\
    triggerSpeedCoef[] = {0.75, 1.25};\
}

class GVAR(spawnbase): B_65x39_Caseless {
    ACE_FRAG_RM_EH;
    deleteParentWhenTriggered = 1;
    explosionEffects = "";
    submunitionConeType[] = {"random", 25};
    submunitionAmmo[] = {QGVAR(tiny), 3, QGVAR(tiny_HD), 3, QGVAR(small), 4, QGVAR(small_HD), 4, QGVAR(medium_HD), 5};
    submunitionDirectionType = "SubmunitionModelDirection";
    submunitionConeAngleHorizontal = 15;
    submunitionConeAngle = 87;
    submunitionInitialOffset[] = {0,0,0};
    submunitionInitSpeed = 0;
    submunitionParentSpeedCoef = 1;
    triggerSpeedCoef[] = {0.75, 1.25};
    triggerTime = 0;
};

 RANDOM_SPAWNER_PROTOTYPE(tiny,15);
 RANDOM_SPAWNER_PROTOTYPE(tiny,10);
 RANDOM_SPAWNER_PROTOTYPE(tiny,5);
 RANDOM_SPAWNER_PROTOTYPE(small,15);
 RANDOM_SPAWNER_PROTOTYPE(small,10);
 RANDOM_SPAWNER_PROTOTYPE(small,5);

/*
 * Targeted fragment spawner, for when multiple fragments are spawned (1-3)
 */
class GVAR(spawnbase_targeted): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 2};
    submunitionConeAngle = 4.5;
    triggerSpeedCoef[] = {0.625, 1};
};


TARGETED_SPAWNER_PROTOTYPE(tiny);
TARGETED_SPAWNER_PROTOTYPE(tiny_HD);
TARGETED_SPAWNER_PROTOTYPE(small);
TARGETED_SPAWNER_PROTOTYPE(small_HD);
TARGETED_SPAWNER_PROTOTYPE(medium);
TARGETED_SPAWNER_PROTOTYPE(medium_HD);
TARGETED_SPAWNER_PROTOTYPE(large);
TARGETED_SPAWNER_PROTOTYPE(large_HD);
TARGETED_SPAWNER_PROTOTYPE(huge);
TARGETED_SPAWNER_PROTOTYPE(huge_HD);
