class GVAR(spawnbase): B_65x39_Caseless {
    deleteParentWhenTriggered = 1;
    submunitionConeType[] = {"random", 25};
    submunitionAmmo[] = {QGVAR(tiny), 3, QGVAR(tiny_HD), 3, QGVAR(small), 4, QGVAR(small_HD), 4, QGVAR(medium_HD), 5};
    submunitionDirectionType = "SubmunitionModelDirection";
    submunitionConeAngleHorizontal = 15;
    submunitionConeAngle = 87;
    submunitionInitialOffset[] = {0,0,0};
    submunitionInitSpeed = 1000;
    submunitionParentSpeedCoef = 1;
    triggerSpeedCoef[] = {0.75, 1.5};
    triggerTime = 0;
    ACE_FRAG_RM_EH;
};

/*
 * Default frag, spawning 10 fragments
 */
class GVAR(def_10): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 10};
};
class GVAR(def_10_lo): GVAR(def_10) {
    submunitionConeAngle = 85;
};
class GVAR(def_10_mid): GVAR(def_10) {
    submunitionConeAngle = 85;
    triggerSpeedCoef[] = {-1.5, 1.5};
};
class GVAR(def_10_hi): GVAR(def_10) {
    submunitionConeAngle = 80;
    triggerSpeedCoef[] = {-1.5, -0.75};
};
class GVAR(def_10_top): GVAR(def_10) {
    submunitionConeAngle = 60;
    triggerSpeedCoef[] = {-1.5, -0.75};
};
/*
 * Default frag, spawning 15 fragments
 */
class GVAR(def_15): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 15};
};
class GVAR(def_15_lo): GVAR(def_15) {
    submunitionConeAngle = 85;
};
class GVAR(def_15_mid): GVAR(def_15) {
    submunitionConeAngle = 85;
    triggerSpeedCoef[] = {-1.5, 1.5};
};
class GVAR(def_15_hi): GVAR(def_15) {
    submunitionConeAngle = 80;
    triggerSpeedCoef[] = {-1.5, -0.75};
};
class GVAR(def_15_top): GVAR(def_15) {
    submunitionConeAngle = 60;
    triggerSpeedCoef[] = {-1.5, -0.75};
};

/*
 * Default frag, spawning 5 fragments
 */
class GVAR(def_5): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 5};
};
class GVAR(def_5_lo): GVAR(def_5) {
    submunitionConeAngle = 85;
};
class GVAR(def_5_mid): GVAR(def_5) {
    submunitionConeAngle = 85;
    triggerSpeedCoef[] = {-1.5, 1.5};
};
class GVAR(def_5_hi): GVAR(def_5) {
    submunitionConeAngle = 80;
    triggerSpeedCoef[] = {-1.5, -0.75};
};
class GVAR(def_5_top): GVAR(def_5) {
    submunitionConeAngle = 60;
    triggerSpeedCoef[] = {-1.5, -0.75};
};

/*
 * Default frag, spawning tiny fragments only
 */
class GVAR(def_tiny_15): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 15};
    submunitionAmmo = QGVAR(tiny);
};
class GVAR(def_tiny_15_lo): GVAR(def_tiny_15) {
    submunitionConeAngle = 85;
};
class GVAR(def_tiny_15_mid): GVAR(def_tiny_15) {
    submunitionConeAngle = 85;
    triggerSpeedCoef[] = {-1.5, 1.5};
};
class GVAR(def_tiny_15_hi): GVAR(def_tiny_15) {
    submunitionConeAngle = 80;
    triggerSpeedCoef[] = {-1.5, -0.75};
};
class GVAR(def_tiny_15_top): GVAR(def_tiny_15) {
    submunitionConeAngle = 60;
    triggerSpeedCoef[] = {-1.5, -0.75};
};

/*
 * Default frag, spawning 10 tiny fragments only
 */
class GVAR(def_tiny_10): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 10};
    submunitionAmmo = QGVAR(tiny);
};
class GVAR(def_tiny_10_lo): GVAR(def_tiny_10) {
    submunitionConeAngle = 85;
};
class GVAR(def_tiny_10_mid): GVAR(def_tiny_10) {
    submunitionConeAngle = 85;
    triggerSpeedCoef[] = {-1.5, 1.5};
};
class GVAR(def_tiny_10_hi): GVAR(def_tiny_10) {
    submunitionConeAngle = 80;
    triggerSpeedCoef[] = {-1.5, -0.75};
};
class GVAR(def_tiny_10_top): GVAR(def_tiny_10) {
    submunitionConeAngle = 60;
    triggerSpeedCoef[] = {-1.5, -0.75};
};

/*
 * Default frag, spawning 15 tiny fragments only
 */
class GVAR(def_tiny_5): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 5};
    submunitionAmmo = QGVAR(tiny);
};
class GVAR(def_tiny_5_lo): GVAR(def_tiny_5) {
    submunitionConeAngle = 85;
};
class GVAR(def_tiny_5_mid): GVAR(def_tiny_5) {
    submunitionConeAngle = 85;
    triggerSpeedCoef[] = {-1.5, 1.5};
};
class GVAR(def_tiny_5_hi): GVAR(def_tiny_5) {
    submunitionConeAngle = 80;
    triggerSpeedCoef[] = {-1.5, -0.75};
};
class GVAR(def_tiny_5_top): GVAR(def_tiny_5) {
    submunitionConeAngle = 60;
    triggerSpeedCoef[] = {-1.5, -0.75};
};

/*
 * Default frag, spawning 15 tiny fragments only
 */
class GVAR(def_small_15): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 15};
    submunitionAmmo = QGVAR(small);
};
class GVAR(def_small_15_lo): GVAR(def_small_15) {
    submunitionConeAngle = 815;
};
class GVAR(def_small_15_mid): GVAR(def_small_15) {
    submunitionConeAngle = 815;
    triggerSpeedCoef[] = {-1.15, 1.15};
};
class GVAR(def_small_15_hi): GVAR(def_small_15) {
    submunitionConeAngle = 80;
    triggerSpeedCoef[] = {-1.15, -0.715};
};
class GVAR(def_small_15_top): GVAR(def_small_15) {
    submunitionConeAngle = 60;
    triggerSpeedCoef[] = {-1.15, -0.715};
};

/*
 * Default frag, spawning 10 small fragments only
 */
class GVAR(def_small_10): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 10};
    submunitionAmmo = QGVAR(small);
};
class GVAR(def_small_10_lo): GVAR(def_small_10) {
    submunitionConeAngle = 810;
};
class GVAR(def_small_10_mid): GVAR(def_small_10) {
    submunitionConeAngle = 810;
    triggerSpeedCoef[] = {-1.10, 1.10};
};
class GVAR(def_small_10_hi): GVAR(def_small_10) {
    submunitionConeAngle = 80;
    triggerSpeedCoef[] = {-1.10, -0.710};
};
class GVAR(def_small_10_top): GVAR(def_small_10) {
    submunitionConeAngle = 60;
    triggerSpeedCoef[] = {-1.10, -0.710};
};
/*
 * Default frag, spawning small fragments only
 */
class GVAR(def_small_5): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 5};
    submunitionAmmo = QGVAR(small);
};
class GVAR(def_small_5_lo): GVAR(def_small_5) {
    submunitionConeAngle = 85;
};
class GVAR(def_small_5_mid): GVAR(def_small_5) {
    submunitionConeAngle = 85;
    triggerSpeedCoef[] = {-1.5, 1.5};
};
class GVAR(def_small_5_hi): GVAR(def_small_5) {
    submunitionConeAngle = 80;
    triggerSpeedCoef[] = {-1.5, -0.75};
};
class GVAR(def_small_5_top): GVAR(def_small_5) {
    submunitionConeAngle = 60;
    triggerSpeedCoef[] = {-1.5, -0.75};
};

/*
 * Targeted fragment spawner, for when multiple fragments are spawned (1-3)
 */
class GVAR(spawnbase_targeted): GVAR(spawnbase) {
    submunitionConeType[] = {"random", 2};
    submunitionConeAngle = 2;
    submunitionInitSpeed = 0;
    triggerSpeedCoef[] = {0.5, 1};
};

class GVAR(tiny_spawner_2_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 2};
};
class GVAR(tiny_spawner_2_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 2};
};
class GVAR(tiny_spawner_2_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 2};
};
class GVAR(tiny_spawner_3_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 3};
};
class GVAR(tiny_spawner_3_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 3};
};
class GVAR(tiny_spawner_3_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 3};
};

class GVAR(tiny_HD_spawner_2_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny_HD);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 2};
};
class GVAR(tiny_HD_spawner_2_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny_HD);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 2};
};
class GVAR(tiny_HD_spawner_2_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny_HD);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 2};
};
class GVAR(tiny_HD_spawner_3_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny_HD);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 3};
};
class GVAR(tiny_HD_spawner_3_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny_HD);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 3};
};
class GVAR(tiny_HD_spawner_3_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(tiny_HD);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 3};
};

class GVAR(small_spawner_2_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 2};
};
class GVAR(small_spawner_2_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 2};
};
class GVAR(small_spawner_2_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 2};
};
class GVAR(small_spawner_3_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 3};
};
class GVAR(small_spawner_3_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 3};
};
class GVAR(small_spawner_3_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 3};
};

class GVAR(small_HD_spawner_2_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small_HD);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 2};
};
class GVAR(small_HD_spawner_2_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small_HD);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 2};
};
class GVAR(small_HD_spawner_2_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small_HD);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 2};
};
class GVAR(small_HD_spawner_3_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small_HD);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 3};
};
class GVAR(small_HD_spawner_3_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small_HD);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 3};
};
class GVAR(small_HD_spawner_3_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(small_HD);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 3};
};

class GVAR(medium_spawner_2_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 2};
};
class GVAR(medium_spawner_2_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 2};
};
class GVAR(medium_spawner_2_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 2};
};
class GVAR(medium_spawner_3_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 3};
};
class GVAR(medium_spawner_3_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 3};
};
class GVAR(medium_spawner_3_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 3};
};

class GVAR(medium_HD_spawner_2_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium_HD);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 2};
};
class GVAR(medium_HD_spawner_2_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium_HD);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 2};
};
class GVAR(medium_HD_spawner_2_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium_HD);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 2};
};
class GVAR(medium_HD_spawner_3_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium_HD);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 3};
};
class GVAR(medium_HD_spawner_3_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium_HD);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 3};
};
class GVAR(medium_HD_spawner_3_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(medium_HD);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 3};
};

class GVAR(large_spawner_2_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 2};
};
class GVAR(large_spawner_2_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 2};
};
class GVAR(large_spawner_2_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 2};
};
class GVAR(large_spawner_3_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 3};
};
class GVAR(large_spawner_3_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 3};
};
class GVAR(large_spawner_3_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 3};
};

class GVAR(large_HD_spawner_2_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large_HD);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 2};
};
class GVAR(large_HD_spawner_2_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large_HD);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 2};
};
class GVAR(large_HD_spawner_2_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large_HD);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 2};
};
class GVAR(large_HD_spawner_3_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large_HD);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 3};
};
class GVAR(large_HD_spawner_3_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large_HD);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 3};
};
class GVAR(large_HD_spawner_3_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(large_HD);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 3};
};

class GVAR(huge_spawner_2_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 2};
};
class GVAR(huge_spawner_2_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 2};
};
class GVAR(huge_spawner_2_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 2};
};
class GVAR(huge_spawner_3_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 3};
};
class GVAR(huge_spawner_3_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 3};
};
class GVAR(huge_spawner_3_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 3};
};

class GVAR(huge_HD_spawner_2_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge_HD);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 2};
};
class GVAR(huge_HD_spawner_2_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge_HD);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 2};
};
class GVAR(huge_HD_spawner_2_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge_HD);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 2};
};
class GVAR(huge_HD_spawner_3_short): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge_HD);
    submunitionConeAngle = 4.5;
    submunitionConeType[] = {"random", 3};
};
class GVAR(huge_HD_spawner_3_mid): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge_HD);
    submunitionConeAngle = 2;
    submunitionConeType[] = {"random", 3};
};
class GVAR(huge_HD_spawner_3_far): GVAR(spawnbase_targeted) {
    submunitionAmmo = QGVAR(huge_HD);
    submunitionConeAngle = 0.9;
    submunitionConeType[] = {"random", 3};
};
