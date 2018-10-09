#define BASE_DRAG -0.01
#define HD_MULT 5
#define BASE_DRAG_HD (BASE_DRAG * HD_MULT)

class CfgAmmo {

    // ~~~~ Bombs:
    class ammo_Bomb_LaserGuidedBase;
    class Bo_GBU12_LGB: ammo_Bomb_LaserGuidedBase {
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
        GVAR(metal) = 140000;
        GVAR(charge) = 87000;
        GVAR(gurney_c) = 2320;
        GVAR(gurney_k) = 1/2;
    };
    class Bomb_04_F: ammo_Bomb_LaserGuidedBase {
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
        GVAR(metal) = 140000;
        GVAR(charge) = 87000;
        GVAR(gurney_c) = 2320;
        GVAR(gurney_k) = 1/2;
    };
    class BombCore;
    class Bo_Mk82: BombCore {
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
        GVAR(metal) = 140000;
        GVAR(charge) = 87000;
        GVAR(gurney_c) = 2320;
        GVAR(gurney_k) = 1/2;
    };

    // ~~~~ Grenades:
    class GrenadeBase;
    class Grenade;
    class GrenadeHand: Grenade {
        GVAR(enabled) = 1;

        GVAR(skip) = 0;
        GVAR(force) = 1;
        // This is a good high-drag frag type for grenades.
        GVAR(classes)[] = {QGVAR(tiny_HD)};
        /*
        These values are based on the M67 Grenade, should be tweaked for
        individual grenades.
        */
        GVAR(metal) = 210;         // metal in grams
        GVAR(charge) = 185;        // explosive in grams
        GVAR(gurney_c) = 2843;    // Gurney velocity constant for explosive type. See: http://en.wikipedia.org/wiki/Gurney_equations
        GVAR(gurney_k) = 3/5;    // Gurney shape factor, in this case a sphere. See: http://en.wikipedia.org/wiki/Gurney_equations
    };
    class GrenadeHand_stone: GrenadeHand {
        GVAR(skip) = 1;
    };
    class SmokeShell: GrenadeHand {
        GVAR(skip) = 1;
    };
    class G_40mm_HE: GrenadeBase {
        // Source: http://www.inetres.com/gp/military/infantry/grenade/40mm_ammo.html#M441
        GVAR(enabled) = 1;
        GVAR(force) = 1;

        GVAR(classes)[] = {QGVAR(tiny_HD)};
        GVAR(metal) = 200;
        GVAR(charge) = 32;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = 1/2;
    };
    class G_40mm_HEDP: G_40mm_HE {
        // Source: http://www.inetres.com/gp/military/infantry/grenade/40mm_ammo.html#M433
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(tiny_HD)};
        GVAR(metal) = 200;
        GVAR(charge) = 45;
        GVAR(gurney_c) = 2830;
        GVAR(gurney_k) = 1/2;
    };

    class ACE_G_40mm_HEDP: G_40mm_HEDP {};
    class ACE_G_40mm_HE: G_40mm_HE {};
    class ACE_G_40mm_Practice: ACE_G_40mm_HE {
        GVAR(skip) = 1;
        GVAR(force) = 0;
    };
    class ACE_G40mm_HE_VOG25P: G_40mm_HE {
        GVAR(skip) = 0;
        GVAR(force) = 1;
    };


    // ~~~~ RPGs:
    class MissileBase;
    class R_PG32V_F;
    class R_TBG32V_F: R_PG32V_F { // HE
        GVAR(enabled) = 1;
        GVAR(metal) = 400;
        GVAR(charge) = 210;
        GVAR(gurney_c) = 2800;
        GVAR(gurney_k) = "3/5";
        GVAR(classes)[] = {"ACE_frag_medium_HD"};
    };
    class M_Titan_AA: MissileBase {
        GVAR(skip) = 1;
    };
    class M_Titan_AT: MissileBase {
        GVAR(skip) = 1;
    };
    class M_Titan_AP: M_Titan_AT { // "anti personnel"
        GVAR(skip) = 0;
        GVAR(enabled) = 1;
        GVAR(metal) = 400;
        GVAR(charge) = 210;
        GVAR(gurney_c) = 2800;
        GVAR(gurney_k) = "3/5";
        GVAR(classes)[] = {"ACE_frag_medium_HD"};
    };


    // ~~~~ Missiles:
    class M_PG_AT;
    class M_AT: M_PG_AT { // DAR (Hydra 70)
        // Source: http://fas.org/man/dod-101/sys/missile/hydra-70.htm
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
        GVAR(metal) = 3850;
        GVAR(charge) = 1040;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = 1/2;
    };
    class RocketBase;
    class R_80mm_HE: RocketBase {
        GVAR(skip) = 1;
    };
    class Missile_AGM_02_F: MissileBase {
        // Source: http://fas.org/man/dod-101/sys/smart/agm-65.htm
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
        GVAR(metal) = 56250;
        GVAR(charge) = 39000;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = 1/2;
    };
    class Rocket_04_HE_F: MissileBase { // Shrieker (Hydra 70)
        GVAR(enabled) = 1;
        GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
        GVAR(metal) = 3850;
        GVAR(charge) = 1040;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = 1/2;
    };
    class M_Scalpel_AT: MissileBase { // 9K121 Vikhr
        GVAR(enabled) = 1;
        GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
        GVAR(metal) = 10000;
        GVAR(charge) = 3000;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = 1/2;
    };
    class ACE_Hellfire_AGM114K: M_Scalpel_AT {
        // Source: http://www.designation-systems.net/dusrm/m-114.html
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
        GVAR(metal) = 8000;
        GVAR(charge) = 2400;
        GVAR(gurney_c) = 2700;
        GVAR(gurney_k) = 1/2;
    };
    class M_Air_AA: MissileBase {
        GVAR(skip) = 1;
    };
    class Missile_AA_04_F: MissileBase {
        GVAR(skip) = 1;
    };

    // curator ammo entries
    class ShellBase;
    class Sh_125mm_HEAT;
    class Sh_155mm_AMOS: ShellBase {
        // Source: http://www.globalsecurity.org/military/systems/munitions/m795.htm
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
        GVAR(metal) = 36000;
        GVAR(charge) = 9979;
        GVAR(gurney_c) = 2440;
        GVAR(gurney_k) = 1/2;
    };
    class Sh_82mm_AMOS: Sh_155mm_AMOS {
        // Source: http://www.arsenal-bg.com/defense_police/mortar_bombs_82mm.htm
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
        GVAR(metal) = 3200;
        GVAR(charge) = 420;
        GVAR(gurney_c) = 2440;
        GVAR(gurney_k) = 1/2;
    };
    class ModuleOrdnanceMortar_F_Ammo: Sh_82mm_AMOS {
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
        GVAR(metal) = 800;
        GVAR(charge) = 4200;
        GVAR(gurney_c) = 2320;
        GVAR(gurney_k) = 1/2;
    };
    class Sh_105mm_HEAT_MP: Sh_125mm_HEAT {
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
        GVAR(metal) = 11400;
        GVAR(charge) = 7100;
        GVAR(gurney_c) = 2800;
        GVAR(gurney_k) = 1/2;
    };
    class Sh_120mm_HE: ShellBase {
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
        GVAR(metal) = 23000;
        GVAR(charge) = 3148;
        GVAR(gurney_c) = 2830;
        GVAR(gurney_k) = 1/2;
    };
    class Sh_125mm_HE: Sh_120mm_HE {
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
        GVAR(metal) = 16000;
        GVAR(charge) = 3200;
        GVAR(gurney_c) = 2440;
        GVAR(gurney_k) = 1/2;
    };
    class ModuleOrdnanceHowitzer_F_ammo: Sh_155mm_AMOS {
        GVAR(enabled) = 1;

        GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
        GVAR(metal) = 1950;
        GVAR(charge) = 15800;
        GVAR(gurney_c) = 2320;
        GVAR(gurney_k) = 1/2;
    };


    class B_65x39_Caseless;
    class GVAR(base): B_65x39_Caseless {
        timeToLive = 12;
        typicalSpeed = 1500;
        deflecting = 65;
    };

    class GVAR(tiny): GVAR(base) {
        hit = 6;
        airFriction = BASE_DRAG;
        caliber = 0.75;
    };

    class GVAR(tiny_HD): GVAR(base) {
        hit = 6;
        airFriction = BASE_DRAG_HD;
        caliber = 0.75;
    };

    class GVAR(small): GVAR(base) {
        hit = 12;
        airFriction = BASE_DRAG*0.9;
    };

    class GVAR(small_HD): GVAR(base) {
        hit = 12;
        airFriction = BASE_DRAG_HD*0.9;
    };

    class GVAR(medium): GVAR(base) {
        hit = 14;
        airFriction = BASE_DRAG*0.75;
        caliber = 1.2;
    };

    class GVAR(medium_HD): GVAR(base) {
        hit = 14;
        airFriction = BASE_DRAG_HD*0.75;
        caliber = 1.2;
    };

    class GVAR(large): GVAR(base) {
        hit = 28;
        indirectHit = 2;
        indirectHitRange = 0.25;
        airFriction = BASE_DRAG*0.65;
        caliber = 2;
        explosive = 0;

    };

    class GVAR(large_HD): GVAR(large) {
        hit =  28;
        indirectHit = 2;
        indirectHitRange = 0.25;
        airFriction = BASE_DRAG_HD*0.65;
        caliber = 2;
    };

    class GVAR(huge): GVAR(large) {
        hit = 40;
        indirectHit = 4;
        indirectHitRange = 0.5;
        airFriction = BASE_DRAG*0.5;
        caliber = 2.8;
    };

    class GVAR(huge_HD): GVAR(large) {
        hit = 40;
        indirectHit = 4;
        indirectHitRange = 0.5;
        airFriction = BASE_DRAG_HD*0.5;
        caliber = 2.8;
    };

    class GVAR(spall_small): GVAR(small) {
        timeToLive = 0.1;
    };

    class GVAR(spall_medium): GVAR(medium) {
        timeToLive = 0.15;
    };

    class GVAR(spall_large): GVAR(large) {
        timeToLive = 0.25;
    };

    class GVAR(spall_huge): GVAR(huge) {
        timeToLive = 0.3;
    };

    #include "CfgAmmoReflections.hpp"
};
