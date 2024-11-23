#define BASE_DRAG -0.01
#define HD_MULT 5
#define BASE_DRAG_HD (BASE_DRAG * HD_MULT)

class CfgAmmo {

    #include "CfgAmmoBaseClasses.hpp"

    class B_65x39_Caseless: BulletBase {};
    class GVAR(base): B_65x39_Caseless {
        ACE_damageType = "grenade"; // compatibility with medical_damage, shrapnel should produce grenade wounds
        timeToLive = 4;
        typicalSpeed = 1500;
        maxSpeed = 1500;
        deflecting = 65;
        GVAR(skip) = 1;
    };

    class GVAR(tiny): GVAR(base) {
        hit = 6;
        airFriction = BASE_DRAG;
        caliber = 0.75;
    };

    class GVAR(tiny_HD): GVAR(base) {
        hit = 6;
        airFriction = QUOTE(BASE_DRAG_HD);
        caliber = 0.75;
    };

    class GVAR(small): GVAR(base) {
        hit = 12;
        airFriction = QUOTE(BASE_DRAG*0.9);
    };

    class GVAR(small_HD): GVAR(base) {
        hit = 12;
        airFriction = QUOTE(BASE_DRAG_HD*0.9);
    };

    class GVAR(medium): GVAR(base) {
        hit = 14;
        airFriction = QUOTE(BASE_DRAG*0.75);
        caliber = 1.2;
    };

    class GVAR(medium_HD): GVAR(base) {
        hit = 14;
        airFriction = QUOTE(BASE_DRAG_HD*0.75);
        caliber = 1.2;
    };

    class GVAR(large): GVAR(base) {
        hit = 28;
        indirectHit = 2;
        indirectHitRange = 0.25;
        airFriction = QUOTE(BASE_DRAG*0.65);
        caliber = 2;
        explosive = 0;

    };

    class GVAR(large_HD): GVAR(large) {
        hit = 28;
        indirectHit = 2;
        indirectHitRange = 0.25;
        airFriction = QUOTE(BASE_DRAG_HD*0.65);
        caliber = 2;
    };

    class GVAR(huge): GVAR(large) {
        hit = 40;
        indirectHit = 4;
        indirectHitRange = 0.5;
        airFriction = QUOTE(BASE_DRAG*0.5);
        caliber = 2.8;
    };

    class GVAR(huge_HD): GVAR(large) {
        hit = 40;
        indirectHit = 4;
        indirectHitRange = 0.5;
        airFriction = QUOTE(BASE_DRAG_HD*0.5);
        caliber = 2.8;
    };

    #include "CfgAmmoSpall.hpp"
    #include "CfgAmmoFragParameters.hpp"
};
