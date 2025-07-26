#define ACE_MISSILE(MISSILE) class ace_missileguidance: EGVAR(missileguidance,DOUBLES(type,MISSILE)) { enabled = 1; }

class CfgAmmo {
    class Missile_AGM_01_F;
    class Missile_AGM_02_F;
    class Missile_AA_04_F;
    class rhs_ammo_r27_base;
    class M_Titan_AA;
    class M_Titan_AT;
    class rhs_ammo_atgmCore_base: M_Titan_AT {
        class EventHandlers;
    };
    class rhs_ammo_atgmBase_base: M_Titan_AT {
        class EventHandlers;
    };
    class rhs_ammo_9k32: M_Titan_AA {
        maneuvrability = 0;
        ACE_MISSILE(Strela);
    };
    class rhs_ammo_9k38: rhs_ammo_9k32 {
        maneuvrability = 0;
        ACE_MISSILE(Igla);
    };
    class rhs_ammo_9m114: rhs_ammo_atgmBase_base {
        maneuvrability = 0;
        ACE_MISSILE(Shturm);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m114m: rhs_ammo_9m114 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m114f: rhs_ammo_9m114 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m114m1: rhs_ammo_9m114 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            maxSeekerRange = 6000;
        };
    };
    class rhs_ammo_9m114m2: rhs_ammo_9m114 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            maxSeekerRange = 7000;
        };
    };
    class rhs_ammo_9m120: rhs_ammo_atgmBase_base {
        maneuvrability = 0;
        ACE_MISSILE(Ataka);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m120m: rhs_ammo_9m120 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            maxSeekerRange = 8000;
        };
    };
    class rhs_ammo_9m120f: rhs_ammo_9m120 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m120o: rhs_ammo_9m120 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m127: rhs_ammo_9m120 {
        maneuvrability = 0;
        ACE_MISSILE(Vikhr);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m127m: rhs_ammo_9m127 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_r27t: rhs_ammo_r27_base {
        maneuvrability = 0;
        ACE_MISSILE(Vympel);
    };
    class rhs_ammo_r27et: rhs_ammo_r27t {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_r60_base: Missile_AA_04_F {
        maneuvrability = 0;
        ACE_MISSILE(Molniya);
    };
    class rhs_ammo_r60: rhs_ammo_r60_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_r60m: rhs_ammo_r60_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            seekerMaxRange = 8000;      // Range from the missile which the seeker can visually search
        };
    };
    class rhs_ammo_r73: Missile_AA_04_F {
        maneuvrability = 0;
        ACE_MISSILE(R73);
    };
    class rhs_ammo_r73m: rhs_ammo_r73 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_r74: rhs_ammo_r73m {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_r74m2: rhs_ammo_r74 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_r77: rhs_ammo_r73 {
        maneuvrability = 0;
        ACE_MISSILE(R77);
    };
    class rhs_ammo_r77m: rhs_ammo_r77 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_kh25_base: Missile_AGM_01_F {
        maneuvrability = 0;
        ACE_MISSILE(KH25);
    };
    class rhs_ammo_kh25: rhs_ammo_kh25_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            seekerMaxRange = 7000;
        };
    };
    class rhs_ammo_kh25ml: rhs_ammo_kh25_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_kh25ma: rhs_ammo_kh25_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            defaultSeekerType = "MillimeterWaveRadar";
            seekerTypes[] = { "MillimeterWaveRadar" };
            activeRadarEngageDistance = 1000;
        };
    };
    class rhs_ammo_kh25MT: rhs_ammo_kh25_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            defaultSeekerType = "Optic";
            seekerTypes[] = { "Optic" };
            seekerMaxRange = 9000;
        };
    };
    class rhs_ammo_kh25mtp: rhs_ammo_kh25_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            defaultSeekerType = "Optic";
            seekerTypes[] = { "Optic" };
            seekerMaxRange = 9000;
        };
    };
    class rhs_ammo_kh25MP: rhs_ammo_kh25_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            defaultSeekerType = "Optic";
            seekerTypes[] = { "Optic" };
            seekerMaxRange = 9000;
        };
    };
    class rhs_ammo_kh29_base: Missile_AGM_02_F {
        maneuvrability = 0;
        ACE_MISSILE(KH29);
    };
    class rhs_ammo_kh29T: rhs_ammo_kh29_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            defaultSeekerType = "Optic";
            seekerTypes[] = { "Optic" };
            seekerMaxRange = 13000;
        };
    };
    class rhs_ammo_kh29l: rhs_ammo_kh29_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_kh55sm: rhs_ammo_kh29l {
        class ace_missileguidance: ace_missileguidance { enabled = 1; };
    };
    class rhs_ammo_kh55sm_nocamo: rhs_ammo_kh55sm {
        class ace_missileguidance: ace_missileguidance { enabled = 1; };
    };
    class rhs_ammo_kh55sh: rhs_ammo_kh55sm {
        class ace_missileguidance: ace_missileguidance { enabled = 1; };
    };
    class rhs_ammo_kh55sh_nocamo: rhs_ammo_kh55sm_nocamo {
        class ace_missileguidance: ace_missileguidance { enabled = 1; };
    };
    class rhs_ammo_kh29ml: rhs_ammo_kh29_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_kh29mp: rhs_ammo_kh29_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            defaultSeekerType = "MillimeterWaveRadar";
            seekerTypes[] = { "MillimeterWaveRadar" };
            activeRadarEngageDistance = 1000;
        };
    };
    class rhs_ammo_kh29d: rhs_ammo_kh29_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            defaultSeekerType = "Optic";
            seekerTypes[] = { "Optic" };
        };
    };
    class RHS_9M79_1_F: rhs_ammo_kh29_base { // ?
        class ace_missileguidance: ace_missileguidance { enabled = 1; };
    };
    class RHS_9M79_1_K: RHS_9M79_1_F { // ?
        class ace_missileguidance: ace_missileguidance { enabled = 1; };
    };
    class RHS_9M79B: RHS_9M79_1_F { // ?
        class ace_missileguidance: ace_missileguidance { enabled = 1; };
    };
    class rhs_ammo_9m14: rhs_ammo_atgmBase_base {
        maneuvrability = 0;
        ACE_MISSILE(Malyutka);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m14m: rhs_ammo_9m14 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_mclos_training: rhs_ammo_9m14m {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m17: rhs_ammo_atgmBase_base {
        maneuvrability = 0;
        ACE_MISSILE(Fleyta);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m17p: rhs_ammo_9m17 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            defaultSeekerType = "SACLOS";
            seekerTypes[] = { "SACLOS" };
        };
    };
    class rhs_ammo_9m112: rhs_ammo_atgmCore_base {
        maneuvrability = 0;
        ACE_MISSILE(Refleks);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m112m: rhs_ammo_9m112 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m112m2: rhs_ammo_9m112m {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m124: rhs_ammo_9m112m {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m128: rhs_ammo_atgmCore_base {
        maneuvrability = 0;
        ACE_MISSILE(Kobra);
    };
    class rhs_ammo_9m111: rhs_ammo_atgmBase_base {
        maneuvrability = 0;
        ACE_MISSILE(Fagot);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m111m: rhs_ammo_9m111 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            seekerMaxRange = 2500;
        };
    };
    class rhs_ammo_9m117: rhs_ammo_atgmCore_base {
        maneuvrability = 0;
        ACE_MISSILE(Bastion);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m117m: rhs_ammo_9m117 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            seekerMaxRange = 5500;
        };
    };
    class rhs_ammo_9m117m1: rhs_ammo_9m117m {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            seekerMaxRange = 6000;
        };
    };
    class rhs_ammo_9m118: rhs_ammo_9m117 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m119: rhs_ammo_atgmCore_base {
        maneuvrability = 0;
        ACE_MISSILE(Refleks);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m119m: rhs_ammo_9m119 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m119f: rhs_ammo_9m119 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m115: rhs_ammo_9m119 {
        maneuvrability = 0;
        ACE_MISSILE(Metis);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m131: rhs_ammo_9m115 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            seekerMaxRange = 1500;
        };
    };
    class rhs_ammo_9m131m: rhs_ammo_9m131 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            seekerMaxRange = 2000;
        };
    };
    class rhs_ammo_9m131f: rhs_ammo_9m131m {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m133f: rhs_ammo_9m131f {
        maneuvrability = 0;
        ACE_MISSILE(Konkurs);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m133: rhs_ammo_atgmBase_base {
        maneuvrability = 0;
        ACE_MISSILE(Konkurs);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
    class rhs_ammo_9m1331: rhs_ammo_9m133 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_9m133m2: rhs_ammo_9m133 {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    class rhs_ammo_3m7: rhs_ammo_atgmBase_base {
        maneuvrability = 0;
        ACE_MISSILE(Drakon);
        class EventHandlers: EventHandlers {
            class RHS_Guidance {};
        };
    };
};
