class GVAR(spallBase): B_65x39_Caseless {
    GVAR(skip) = 1;
    submunitionAmmo[] = {QGVAR(small), 4, QGVAR(medium), 3, QGVAR(large), 2, QGVAR(huge), 1};
    submunitionConeType[] = {"random", 20};
    submunitionConeAngle = 40;
    submunitionDirectionType = "SubmunitionModelDirection";
    triggerTime = 0;
    submunitionInitialOffset[] = {0, 0, 0};
    submunitionInitSpeed = 0;
    triggerSpeedCoef[] = {0.75, 1.25};
    deleteParentWhenTriggered = 1;
    submunitionParentSpeedCoef = 1;
};


/*
 * ground
 */
class GVAR(ground_spall_tiny): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 9, QGVAR(small), 1};
    submunitionConeType[] = {"poissondisccenter", 4};
};

class GVAR(ground_spall_small): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(small), 4, QGVAR(medium), 1};
    submunitionConeType[] = {"poissondisccenter", 6};
};

class GVAR(ground_spall_medium): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(small), 2, QGVAR(small_HD), 1, QGVAR(medium), 3, QGVAR(medium_HD), 1, QGVAR(large), 2};
    submunitionConeType[] = {"poissondisccenter", 15};
};

class GVAR(ground_spall_large): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 3, QGVAR(tiny_HD), 3, QGVAR(small), 4, QGVAR(small_HD), 4, QGVAR(medium_HD), 5, QGVAR(large), 1, QGVAR(large_HD), 2};
    submunitionConeType[] = {"poissondisccenter", 15};
};

class GVAR(ground_spall_huge): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 3, QGVAR(tiny_HD), 3, QGVAR(small), 4, QGVAR(small_HD), 4, QGVAR(medium), 5, QGVAR(large), 1, QGVAR(large_HD), 2};
    submunitionConeType[] = {"poissondisccenter", 20};
};


/*
 * rock
 */
class GVAR(rock_spall_tiny): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(small), 4, QGVAR(medium_HD), 1};
    submunitionConeType[] = {"poissondisccenter", 4};
};

class GVAR(rock_spall_small): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(small), 4, QGVAR(medium), 1};
    submunitionConeType[] = {"poissondisccenter", 5};
};

class GVAR(rock_spall_medium): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(small), 4, QGVAR(medium), 1, QGVAR(medium_HD), 2, QGVAR(large_HD), 1};
    submunitionConeType[] = {"poissondisccenter", 7};
};

class GVAR(rock_spall_large): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(small), 5, QGVAR(medium), 2, QGVAR(large), 1};
    submunitionConeType[] = {"poissondisccenter", 10};
};

class GVAR(rock_spall_huge): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(small), 5, QGVAR(medium), 2, QGVAR(large), 1, QGVAR(huge_HD), 1};
    submunitionConeType[] = {"poissondisccenter", 13};
};


/*
 * wood
 */
class GVAR(wood_spall_tiny): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 2, QGVAR(small), 4};
    submunitionConeType[] = {"poissondisccenter", 4};
};

class GVAR(wood_spall_small): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 2, QGVAR(small), 4, QGVAR(medium), 1};
    submunitionConeType[] = {"poissondisccenter", 6};
};

class GVAR(wood_spall_medium): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 2, QGVAR(small), 2, QGVAR(medium), 2, QGVAR(medium_HD), 1, QGVAR(large_HD), 1};
    submunitionConeType[] = {"poissondisccenter", 8};
};

class GVAR(wood_spall_large): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 1, QGVAR(small), 3, QGVAR(medium), 2, QGVAR(large_HD), 2, QGVAR(huge_HD), 1};
    submunitionConeType[] = {"poissondisccenter", 10};
};

class GVAR(wood_spall_huge): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 1, QGVAR(small), 3, QGVAR(medium), 2, QGVAR(large_HD), 2, QGVAR(huge_HD), 1};
    submunitionConeType[] = {"poissondisccenter", 12};
};


/*
 * concrete
 */
class GVAR(concrete_spall_tiny): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 6, QGVAR(tiny_HD), 3, QGVAR(small), 1};
    submunitionConeType[] = {"poissondisccenter", 4};
};

class GVAR(concrete_spall_small): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 4, QGVAR(tiny_HD), 2, QGVAR(small), 2, QGVAR(medium), 1};
    submunitionConeType[] = {"poissondisccenter", 6};
};

class GVAR(concrete_spall_medium): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 6, QGVAR(tiny_HD), 1, QGVAR(small), 4, QGVAR(medium), 5, QGVAR(large_HD), 1};
    submunitionConeType[] = {"poissondisccenter", 9};
};

class GVAR(concrete_spall_large): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 6, QGVAR(small), 4, QGVAR(medium), 3, QGVAR(large), 1, QGVAR(large_HD), 2};
    submunitionConeType[] = {"poissondisccenter", 12};
};

class GVAR(concrete_spall_huge): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 8, QGVAR(small), 4, QGVAR(medium), 3, QGVAR(large), 1, QGVAR(large_HD), 1, QGVAR(huge_HD), 1};
    submunitionConeType[] = {"poissondisccenter", 18};
};


/*
 * metal
 */
class GVAR(metal_spall_tiny): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 9, QGVAR(small), 1};
    submunitionConeType[] = {"poissondisccenter", 4};
};

class GVAR(metal_spall_small): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 4, QGVAR(small), 2, QGVAR(medium), 1};
    submunitionConeType[] = {"poissondisccenter", 6};
};

class GVAR(metal_spall_medium): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 5, QGVAR(small), 4, QGVAR(medium), 2, QGVAR(large), 1};
    submunitionConeType[] = {"poissondisccenter", 8};
};

class GVAR(metal_spall_large): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 4, QGVAR(small), 3, QGVAR(medium), 2, QGVAR(large), 1, QGVAR(huge), 1};
    submunitionConeType[] = {"poissondisccenter", 12};
};

class GVAR(metal_spall_huge): GVAR(spallBase) {
    submunitionAmmo[] = {QGVAR(tiny), 8, QGVAR(small), 3, QGVAR(medium), 2, QGVAR(large), 3, QGVAR(huge), 1};
    submunitionConeType[] = {"poissondisccenter", 18};
};
