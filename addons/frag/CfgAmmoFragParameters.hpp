// ~~~~ Autocannons
class B_19mm_HE: BulletBase {
    GVAR(skip) = 1;
};

class B_20mm: BulletBase {
    // Used in Weisel/AWC Nyx, which makes it a Rheinmetall Mk 20 Rh-202
    // Based on jane's ammunition handbook ~2002 (archive.org)
    GVAR(skip) = 1;
    GVAR(charge) = 6;
    GVAR(metal) = 114;
    GVAR(gurney_c) = 2830;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 100;
    GVAR(classes)[] = {QGVAR(tiny)};
};

class B_20mm_AP: BulletBase {
    GVAR(skip) = 1;
};

class ammo_Gun20mmAABase: BulletBase { // 20x139mm
    GVAR(skip) = 1;
    GVAR(charge) = 6;
    GVAR(metal) = 114;
    GVAR(gurney_c) = 2830;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 100;
    GVAR(classes)[] = {QGVAR(tiny)};
};

class ammo_Gun30mmAABase: BulletBase { // 30x210mm HEI
    GVAR(skip) = 0;
    GVAR(charge) = 40;
    GVAR(metal) = 410;
    GVAR(gurney_k) = "1/2";
    GVAR(gurney_c) = 2901;
    GVAR(fragCount) = 250;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(tiny), QGVAR(small)};

};

class B_30mm_HE: B_19mm_HE {
    // Used in Gorgon (Pandur II), assuming it's a L21A1 RARDEN, specifically HEI-T due to tracers
    // https://ordtech-industries.com/30x170-mm-ammunition-for-cannons-oerlikon-kcb-hispano-hs831l-l21-rarden/
    GVAR(skip) = 0;
    GVAR(charge) = 25;
    GVAR(metal) = 320;
    GVAR(gurney_c) = 2552;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 180;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(tiny), QGVAR(small)};
};
class B_30mm_MP: B_30mm_HE {
    // Used in Mora (FV510 Warrior), assuming it's a Mk44 Bushmaster II, specifically HEI-T due to tracers
    // http://www.navweaps.com/Weapons/WNUS_30mm_BushmasterII.php
    GVAR(metal) = 388;
    GVAR(charge) = 56;
    GVAR(gurney_c) = 2600;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 180; // assumed based on https://www.youtube.com/watch?v=c5SsspD0MeU
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(tiny), QGVAR(small)};
};

class Gatling_30mm_HE_Plane_CAS_01_F: BulletBase {
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(small)};
    GVAR(fragCount) = 180;
    GVAR(metal) = 388;
    GVAR(charge) = 56;
    GVAR(gurney_c) = 2600; // guessed
    GVAR(gurney_k) = "1/2";
};


class ammo_Gun35mmAABase: BulletBase {
    // Gepard uses an Oerlikon GDF and the AA vehicles mimics it like it
    // https://en.wikipedia.org/wiki/Oerlikon_GDF#Ammunition
    // https://www.nammo.com/product/our-products/ammunition/medium-caliber-ammunition/35-mm-series/35-mm-x-228-hei-sd-and-hei-t-sd/
    GVAR(skip) = 0;
    GVAR(charge) = 98;
    GVAR(metal) = 400;
    GVAR(gurney_k) = "1/2";
    GVAR(gurney_c) = 2700;
    GVAR(fragCount) = 300;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(tiny), QGVAR(small)};
};

class B_35mm_AA: BulletBase {
    // Gepard uses an Oerlikon GDF and the AA vehicles mimics it like it
    // https://en.wikipedia.org/wiki/Oerlikon_GDF#Ammunition
    // https://www.nammo.com/product/our-products/ammunition/medium-caliber-ammunition/35-mm-series/35-mm-x-228-hei-sd-and-hei-t-sd/
    GVAR(skip) = 0;
    GVAR(charge) = 98;
    GVAR(metal) = 400;
    GVAR(gurney_k) = "1/2";
    GVAR(gurney_c) = 2700;
    GVAR(fragCount) = 300;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(tiny), QGVAR(small)};
};

class B_40mm_GPR: B_30mm_HE {
    // Based on noted 40mm Autocannons, base ROF, and ammo names, looks to be a CTAS40, specifically GPR-PD-T
    // https://www.cta-international.com/ammunition/
    // https://ndiastorage.blob.core.usgovcloudapi.net/ndia/2002/gun/leslie.pdf
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(small)};
    GVAR(fragCount) = 250;
    GVAR(metal) = 750;
    GVAR(charge) = 120;
    GVAR(gurney_c) = 2700; // guessed
    GVAR(gurney_k) = "1/2";
};
class UnderwaterMine_Range_Ammo: MineBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

// ~~~~ Bombs:
class Bo_GBU12_LGB: ammo_Bomb_LaserGuidedBase {
    GVAR(skip) = 0;
    GVAR(charge) = 87000;
    GVAR(metal) = 140000;
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 17500;
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
};
class Bomb_03_F: ammo_Bomb_LaserGuidedBase {
    GVAR(skip) = 0;
    GVAR(charge) = 100000;
    GVAR(metal) = 150000;
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 17500;
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
};
class Bomb_04_F: ammo_Bomb_LaserGuidedBase {
    GVAR(skip) = 0;
    GVAR(charge) = 87000;
    GVAR(metal) = 140000;
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 17500;
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
};
class BombCluster_01_Ammo_F: Bomb_04_F {
    GVAR(skip) = 1;
};
class ammo_Bomb_SmallDiameterBase: ammo_Bomb_LaserGuidedBase {
    GVAR(skip) = 0;
    GVAR(charge) = 160; // kg
    GVAR(metal) = 113; // kg
    GVAR(gurney_c) = 2830;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 8000;
    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium), QGVAR(large), QGVAR(large), QGVAR(huge), QGVAR(huge_HD)};
};

class BombCore;
class Bo_Mk82: BombCore {
    ACE_FRAG_ADD_EH_BASE;
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
    GVAR(fragCount) = 17500;
    GVAR(metal) = 140000;
    GVAR(charge) = 87000;
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "1/2";
};

class Mo_cluster_AP: ShellBase {
    GVAR(skip) = 1;
    GVAR(force) = 0;
};
class Mo_cluster_Bomb_01_F: Mo_cluster_AP { // Mk 118 Rockeye
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(small)};
    GVAR(fragCount) = 200;
    GVAR(metal) = 400;
    GVAR(charge) = 180;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};
class Mo_cluster_Bomb_02_F: Mo_cluster_Bomb_01_F { // ShOAB-0.5
    GVAR(classes)[] = {QGVAR(small)};
    GVAR(fragCount) = 304;
    GVAR(metal) = 400;
    GVAR(charge) = 100;
    GVAR(gurney_c) = 2700;
};
class Mo_cluster_Bomb_03_F: Mo_cluster_Bomb_01_F { // idk, @lambda.tiger on the ace discord if you find out
    GVAR(classes)[] = {QGVAR(small)};
    GVAR(fragCount) = 200;
    GVAR(metal) = 400;
    GVAR(charge) = 140;
    GVAR(gurney_c) = 2400;
};

// ~~~~ Grenades:
class Grenade;
class GrenadeHand: Grenade {
    ACE_FRAG_ADD_EH_BASE;
    GVAR(skip) = 0;
    GVAR(force) = 1;
    /*
    These values are based on the M67 Grenade, should be tweaked for
    individual grenades.
    */
    GVAR(classes)[] = {QGVAR(tiny)};
    GVAR(fragCount) = 800;
    GVAR(metal) = 210; // metal in grams
    GVAR(charge) = 185; // explosive in grams
    GVAR(gurney_c) = 2843; // Gurney velocity constant for explosive type. See: http://en.wikipedia.org/wiki/Gurney_equations
    GVAR(gurney_k) = "3/5"; // Gurney shape factor, in this case a sphere. See: http://en.wikipedia.org/wiki/Gurney_equations
};
class mini_Grenade:  GrenadeHand {
    GVAR(classes)[] = {QGVAR(tiny)};
    GVAR(fragCount) = 520;
    GVAR(metal) = 104;
    GVAR(charge) = 36;
};
class GrenadeHand_stone: GrenadeHand {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};
class SmokeShell: GrenadeHand {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};
class G_40mm_HE: GrenadeBase {
    class EventHandlers: EventHandlers {};
    // Source: http://www.inetres.com/gp/military/infantry/grenade/40mm_ammo.html#M441
    GVAR(skip) = 0;
    GVAR(force) = 0;
    GVAR(classes)[] = {QGVAR(small), QGVAR(tiny), QGVAR(small)};
    GVAR(fragCount) = 600; // guess based on probability hit of 1%
    GVAR(metal) = 200;
    GVAR(charge) = 32;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "3/5"; // interior fragmenter/charge is a sphere
};
class G_20mm_HE: G_40mm_HE {
    GVAR(classes)[] = {QGVAR(tiny)};
    GVAR(fragCount) = 200; // Halved size & dimensions from 40mm HE
    GVAR(metal) = 50;
    GVAR(charge) = 8;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "3/5"; // interior fragmenter/charge is a sphere
};
class G_40mm_HEDP: G_40mm_HE {
    class EventHandlers: EventHandlers {};
    // Source: http://www.inetres.com/gp/military/infantry/grenade/40mm_ammo.html#M433
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(small), QGVAR(small_HD)};
    GVAR(fragCount) = 270; // seems to have greater framentation ability, but lower range per source
    GVAR(metal) = 200;
    GVAR(charge) = 45;
    GVAR(gurney_c) = 2830;
    GVAR(gurney_k) = "1/2";
};

class ACE_G_40mm_HEDP: G_40mm_HEDP {
    class EventHandlers: EventHandlers {};
};
class ACE_G_40mm_HE: G_40mm_HE {
    class EventHandlers: EventHandlers {};
};
class ACE_G_40mm_Practice: ACE_G_40mm_HE {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
    GVAR(force) = 0;
    EGVAR(vehicle_damage,incendiary) = 0;
};

// ~~~~ Mines & UXO
class ATMine_Range_Ammo: MineBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class APERSMine_Range_Ammo: MineBase { // VS-50
    class EventHandlers: EventHandlers {};
    GVAR(skip) = 0;
    GVAR(force) = 0;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(tiny), QGVAR(small)};
    GVAR(fragCount) = 500;
    GVAR(metal) = 100;
    GVAR(charge) = 50;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/3";
};

class APERSBoundingMine_Range_Ammo: MineBase {
    GVAR(skip) = 0;
    GVAR(force) = 0;
    GVAR(classes)[] = {QGVAR(tiny)};
    GVAR(fragCount) = 200;
    GVAR(metal) = 80;
    GVAR(charge) = 170;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "3/5";
};

class TrainingMine_Ammo: APERSMine_Range_Ammo {
    GVAR(skip) = 1;
};

class SLAMDirectionalMine_Wire_Ammo: DirectionalBombBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class APERSTripMine_Wire_Ammo: DirectionalBombBase {
    GVAR(skip) = 0;
    GVAR(force) = 0;
    GVAR(classes)[] = {QGVAR(tiny)};
    GVAR(fragCount) = 800;
    GVAR(metal) = 210;
    GVAR(charge) = 185;
    GVAR(gurney_c) = 2843;
    GVAR(gurney_k) = "3/5";
};

class IEDUrbanBig_Remote_Ammo: PipeBombBase {
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
    GVAR(fragCount) = 2000;
    GVAR(metal) = 36000;
    GVAR(charge) = 9979;
    GVAR(gurney_c) = 2440;
    GVAR(gurney_k) = "3/5";
};
class IEDLandBig_Remote_Ammo: PipeBombBase {
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
    GVAR(fragCount) = 2000;
    GVAR(metal) = 36000;
    GVAR(charge) = 9979;
    GVAR(gurney_c) = 2440;
    GVAR(gurney_k) = "3/5";
};
class IEDUrbanSmall_Remote_Ammo: PipeBombBase {
    GVAR(skip) = 0;
    GVAR(fragCount) = 1200;
    GVAR(metal) = 23000;
    GVAR(charge) = 3148;
    GVAR(gurney_c) = 2830;
    GVAR(gurney_k) = "3/5";
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(medium_HD)};
};
class IEDLandSmall_Remote_Ammo: PipeBombBase {
    GVAR(skip) = 0;
    GVAR(fragCount) = 1200;
    GVAR(metal) = 23000;
    GVAR(charge) = 3148;
    GVAR(gurney_c) = 2830;
    GVAR(gurney_k) = "3/5";
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(medium_HD)};
};

class APERSMineDispenser_Ammo: PipeBombBase {
    GVAR(skip) = 1;
};

class UXO1_Ammo_Base_F: APERSMine_Range_Ammo { // Mk 118 Rockeye
    GVAR(skip) = 0;
    GVAR(charge) = 180;
    GVAR(metal) = 400;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 200;
    GVAR(classes)[] = {QGVAR(small)};
};

class UXO2_Ammo_Base_F: UXO1_Ammo_Base_F {
    GVAR(charge) = 100;
    GVAR(fragCount) = 304;
    GVAR(classes)[] = {QGVAR(small), QGVAR(tiny)};
};

class APERSMineDispenser_Mine_Ammo: APERSMine_Range_Ammo {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class UXO_deploy_base_f: SubmunitionBase {
    ACE_FRAG_RM_EH;
};

class ClaymoreDirectionalMine_Remote_Ammo: DirectionalBombBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class SatchelCharge_Remote_Ammo: PipeBombBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class DemoCharge_Remote_Ammo: PipeBombBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class Drone_explosive_ammo: MineBase {
    GVAR(skip) = 1;
};

class BombDemine_01_Ammo_F: BombCore {
    GVAR(skip) = 1;
};

class BombDemine_01_SubAmmo_F: ShellBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

// ~~~~ Rockets:
class R_PG7_F: RocketBase {
    GVAR(skip) = 0;
    GVAR(force) = 0;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(small)};
    GVAR(fragCount) = 400;
    GVAR(metal) = 100;
    GVAR(charge) = 560;
    GVAR(gurney_c) = 2730;
    GVAR(gurney_k) = "1/2";
};

class R_PG32V_F: RocketBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};
class R_TBG32V_F: R_PG32V_F { // Thermobaric
    ACE_FRAG_ADD_EH;
    GVAR(skip) = 0;
    GVAR(fragCount) = 200;
    GVAR(metal) = 400;
    GVAR(charge) = 210;
    GVAR(gurney_c) = 2800;
    GVAR(gurney_k) = "3/5";
    GVAR(classes)[] = {QGVAR(medium_HD)};
};

class M_SPG9_HEAT: RocketBase {
    GVAR(skip) = 0;
    GVAR(fragCount) = 200;
    GVAR(metal) = 4150;
    GVAR(charge) = 340;
    GVAR(gurney_c) = 2970;
    GVAR(gurney_k) = "1/2";
    GVAR(classes)[] = {QGVAR(small_HD), QGVAR(medium_HD)};
};
class M_SPG9_HE: M_SPG9_HEAT {
    GVAR(fragCount) = 800;
    GVAR(metal) = 4695;
    GVAR(charge) = 655;
    GVAR(gurney_c) = 2800;
    GVAR(gurney_k) = "1/2";
    GVAR(classes)[] = {QGVAR(small), QGVAR(tiny), QGVAR(medium), QGVAR(medium)};
};


// https://armypubs.army.mil/epubs/DR_pubs/DR_a/pdf/web/ARN18072_TC%203-22x84%20FINAL%20WEB.pdf
class R_MRAAWS_HEAT_F: RocketBase { // Table A-20. HEAT 751
    GVAR(skip) = 0;
    GVAR(fragCount) = 500;
    GVAR(metal) = 2265;
    GVAR(charge) = 635;
    GVAR(gurney_c) = 2970;
    GVAR(gurney_k) = "1/2";
    GVAR(classes)[] = {QGVAR(small)};

};
class R_MRAAWS_HEAT55_F: R_MRAAWS_HEAT_F { // Table A-16. HEAT 551C
    GVAR(fragCount) = 300;
    GVAR(metal) = 1940;
    GVAR(charge) = 460;
};
class R_MRAAWS_HE_F: R_MRAAWS_HEAT_F { // Table A-6. HE 441D RS
    GVAR(fragCount) = 800;
    GVAR(metal) = 2300;
    GVAR(charge) = 590;
    GVAR(gurney_c) = 2800;
    GVAR(gurney_k) = "3/5";
    GVAR(classes)[] = {QGVAR(small)};
};

class R_80mm_HE: RocketBase { // S-8D
    GVAR(skip) = 0;
    GVAR(charge) = 2150;
    GVAR(metal) = 1650;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 1200;
    GVAR(classes)[] = {QGVAR(small), QGVAR(tiny), QGVAR(tiny)};
};
class R_60mm_HE: R_80mm_HE { // no idea but looks like a FFAR so made it weaker
    GVAR(fragCount) = 1000;
    GVAR(metal) = 1040;
    GVAR(charge) = 3850;
};

class m_70mm_saami: RocketBase {///!!! fix me
    GVAR(skip) = 0;
    GVAR(charge) = 2150;
    GVAR(metal) = 1650;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 1200;
    GVAR(classes)[] = {QGVAR(small), QGVAR(tiny), QGVAR(tiny)};
};

class Rocket_04_HE_F: MissileBase { // Shrieker (Hydra 70)
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 1200; // guesstimate / provides ~100 m frag range (1% chance to hit)
    GVAR(metal) = 3850;
    GVAR(charge) = 1040;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};
class Rocket_03_HE_F: Rocket_04_HE_F { // S-8DM makes the most sense
    GVAR(fragCount) = 600; // Thermobaric rounds usually have fewer fragments
    GVAR(metal) = 1;
    GVAR(charge) = 2;
    GVAR(gurney_c) = 2300;
};
class Rocket_04_AP_F: Rocket_04_HE_F {
    GVAR(skip) = 1;
};

class ammo_Missile_CannonLaunchedBase: MissileBase {
    GVAR(skip) =1;
};

class R_230mm_fly: RocketBase {
    GVAR(skip) = 0;
    GVAR(charge) = 100; // kg
    GVAR(metal) = 150; // kg
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "3/5";
    GVAR(fragCount) = 17500;
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
};

class M_PG_AT: MissileBase { // DAGR M247 warhead
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(small), QGVAR(small), QGVAR(medium)};
    GVAR(charge) = 910;
    GVAR(metal) = 3085;
    GVAR(gurney_c) = 2700;
    GVAR(fragCount) = 700; // guesstimate / provides ~70 m frag range (0.5% chance to hit)
    GVAR(gurney_k) = "1/2";
};
class M_AT: M_PG_AT { // DAR (Hydra 70) M151 warhead
    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(charge) = 1040;
    GVAR(metal) = 3850;
    GVAR(gurney_c) = 2700;
    GVAR(fragCount) = 1200; // guesstimate / provides ~100 m frag range (0.5% chance to hit)
};

// ~~~~ Missiles:
class Missile_AGM_02_F: MissileBase {
    // Source: http://fas.org/man/dod-101/sys/smart/agm-65.htm
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 500;
    GVAR(metal) = 56250;
    GVAR(charge) = 39000;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};
class Missile_AGM_01_F: Missile_AGM_02_F { // Kh-25MTP !!! fix me
    GVAR(fragCount) = 1600;
};
class M_Jian_AT: Missile_AGM_01_F { // imaginary missile? Not simiklar to any modern HJ-x or otherwise
    GVAR(fragCount) = 600;
};

class M_Titan_AA: MissileBase {
    GVAR(skip) = 0;
    GVAR(fragCount) = 600;
    GVAR(metal) = 1980;
    GVAR(charge) = 1020;
    GVAR(gurney_c) = 2501;
    GVAR(gurney_k) = "1/2";
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(tiny), QGVAR(small)};
};
class M_Titan_AT: MissileBase;
class M_Titan_AP: M_Titan_AT {
    GVAR(skip) = 0;
    GVAR(fragCount) = 800; // guesstimate / provides ~80 m frag range
    GVAR(metal) = 400;
    GVAR(charge) = 210;
    GVAR(gurney_c) = 2800;
    GVAR(gurney_k) = "3/5";
    GVAR(classes)[] = {QGVAR(medium_HD)};
};


class M_Scalpel_AT: MissileBase { // 9K121 Vikhr
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 800; // guesstimate, provides ~80 m frag range (1% chance to hit)
    GVAR(metal) = 10000;
    GVAR(charge) = 3000;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};
class ACE_Hellfire_AGM114K: M_Scalpel_AT {
    // Source: http://www.designation-systems.net/dusrm/m-114.html
    GVAR(skip) = 0;

    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 350; // guesstimate based on frag jacket, provides ~50 m frag range (1% chance to hit)
    GVAR(metal) = 8000;
    GVAR(charge) = 2400;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};

class ammo_Missile_CruiseBase: MissileBase {
    class EventHandlers: EventHandlers {};
};
class ammo_missile_cruise_01: ammo_Missile_CruiseBase {
    class EventHandlers: EventHandlers {};
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(large)};
    GVAR(fragCount) = 20000;
    GVAR(metal) = 700000;
    GVAR(charge) = 110000;
    GVAR(gurney_c) = 2600;
    GVAR(gurney_k) = "3/5";
};
class ammo_Missile_Cruise_01_Cluster: ammo_missile_cruise_01 {
    ACE_FRAG_RM_EH;
};

class ammo_Missile_AntiRadiationBase: MissileBase {
    GVAR(gurney_k) = "1/2";
    GVAR(gurney_c) = 2400;
};
class ammo_Missile_HARM: ammo_Missile_AntiRadiationBase {
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(large)};
    GVAR(charge) = 10000;
    GVAR(metal) = 58000;
    GVAR(fragCount) = 5000;
};
class ammo_Missile_KH58: ammo_Missile_AntiRadiationBase {
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(large)};
    GVAR(charge) = 20000;
    GVAR(metal) = 129000;
    GVAR(fragCount) = 7500;
};

class M_Zephyr: M_Titan_AA { // model is an AMRAAM- WDU-41/B warhead
    GVAR(skip) = 0;
    GVAR(metal) = 12800;
    GVAR(charge) = 4000;
    GVAR(gurney_c) = 2900;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 2000;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(medium), QGVAR(small), QGVAR(small)};
};

class M_Air_AA: MissileBase { // Looks not real, maybe r-73 inspired?
    GVAR(skip) = 0;
    GVAR(charge) = 2450;
    GVAR(metal) = 4950;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 1000;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(medium), QGVAR(small), QGVAR(small)};
};

class Missile_AA_04_F: MissileBase {
    GVAR(skip) = 0;
    GVAR(charge) = 4400;
    GVAR(metal) = 5000;
    GVAR(gurney_c) = 2830;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 1600;
};
class Missile_AA_03_F: Missile_AA_04_F {
    GVAR(charge) = 2450;
    GVAR(metal) = 4950;
    GVAR(gurney_c) = 2700;
    GVAR(fragCount) = 200;
};

class ammo_Missile_ShortRangeAABase: MissileBase {
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 1200;
};
class ammo_Missile_rim116: ammo_Missile_ShortRangeAABase {
    GVAR(skip) = 0;
    GVAR(charge) = 40; // dg
    GVAR(metal) = 73; // dg
    GVAR(gurney_c) = 2400;
    GVAR(fragCount) = 2000;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(small)};
};
class ammo_Missile_BIM9X: ammo_Missile_ShortRangeAABase {
    GVAR(skip) = 0;
    GVAR(charge) = 44; // dg
    GVAR(metal) = 50; // dg
    GVAR(gurney_c) = 2900;
    GVAR(fragCount) = 1600;
    GVAR(classes)[] = {QGVAR(small), QGVAR(tiny)};
};
class ammo_Missile_AA_R73: ammo_Missile_ShortRangeAABase {
    GVAR(skip) = 0;
    GVAR(charge) = 245; // cg
    GVAR(metal) = 495; // cg
    GVAR(gurney_c) = 2700;
    GVAR(classes)[] = {QGVAR(small), QGVAR(small), QGVAR(tiny)};
};

class ammo_Missile_MediumRangeAABase: MissileBase {
    GVAR(gurney_c) = 2900;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 2000;
};
class ammo_Missile_rim162: ammo_Missile_MediumRangeAABase {
    GVAR(skip) = 0;
    GVAR(charge) = 138; // dg
    GVAR(metal) = 252; // dg
    GVAR(gurney_c) = 2400;
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(medium), QGVAR(large)};
};
class ammo_Missile_AMRAAM_C: ammo_Missile_MediumRangeAABase {
    GVAR(skip) = 0;
    GVAR(charge) = 70; // dg
    GVAR(metal) = 128; // dg
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(medium)};
};
class ammo_Missile_AMRAAM_D: ammo_Missile_MediumRangeAABase {
    GVAR(skip) = 0;
    GVAR(charge) = 70; // dg
    GVAR(metal) = 128; // dg
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(medium)};
};
class ammo_Missile_AA_R77: ammo_Missile_MediumRangeAABase {
    GVAR(skip) = 0;
    GVAR(charge) = 80; // dg
    GVAR(metal) = 145; // dg
    GVAR(gurney_c) = 2700;
    GVAR(fragCount) = 1200;
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(large), QGVAR(large)};
};

class ammo_Missile_LongRangeAABase: MissileBase {
    GVAR(skip) = 1;
};

class M_Vorona_HEAT: MissileBase {
    // tandem shaped charges
    GVAR(skip) = 1;
};
class M_Vorona_HE: M_Vorona_HEAT {
    // All signs point to this being a thermobaric round so low frag count
    GVAR(skip) = 0;
    GVAR(fragCount) = 200;
    GVAR(metal) = 13800;
    GVAR(charge) = 4950;
    GVAR(gurney_c) = 2800;
    GVAR(gurney_k) = "1/2";
    GVAR(classes)[] = {QGVAR(tiny)};
};

class M_127mm_Firefist_AT: RocketBase { // HOT missile
    GVAR(skip) = 1;
};

class M_NLAW_AT_F: MissileBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

// ~~~~ Shell
class Sh_75mm_Railgun_APFSDS: ShellBase {
    GVAR(skip) = 1;
};
class  Sh_120mm_APFSDS: ShellBase {
    GVAR(skip) = 1;
};
class  Sh_125mm_APFSDS: ShellBase {
    GVAR(skip) = 1;
};

class Sh_155mm_AMOS: ShellBase {
    // Source: http://www.globalsecurity.org/military/systems/munitions/m795.htm
    GVAR(skip) = 0;
    GVAR(charge) = 9979;
    GVAR(metal) = 36000;
    GVAR(gurney_c) = 2440;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 3250; // http://18.195.19.6/bitstream/handle/20.500.12242/1200/15-01916.pdf?sequence=1&isAllowed=y
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
};

class Sh_82mm_AMOS: Sh_155mm_AMOS { // VO-832DU
    GVAR(charge) = 420;
    GVAR(metal) = 2680;
    GVAR(fragCount) = 1600; // based on mass and fragment energy/count
    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
};

class Sh_120mm_HE: ShellBase {
    GVAR(skip) = 0;
    GVAR(charge) = 3148;
    GVAR(metal) = 23000;
    GVAR(gurney_c) = 2830;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 2000;
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(medium), QGVAR(medium_HD)};
};
class Sh_120mm_HEAT_MP: ShellBase {
    GVAR(skip) = 0;
    GVAR(charge) = 2500;
    GVAR(metal) = 5000;
    GVAR(gurney_c) = 2500;
    GVAR(gurney_k) = "1/2";
    GVAR(fragCount) = 1000;
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(medium), QGVAR(medium_HD)};
};

class ammo_ShipCannon_120mm_HE: Sh_155mm_AMOS {
    GVAR(charge) = 3148;
    GVAR(metal) = 23000;
    GVAR(gurney_c) = 2830;
    GVAR(fragCount) = 2000;
    GVAR(classes)[] = {QGVAR(small), QGVAR(small), QGVAR(medium), QGVAR(large)};
};

class Sh_125mm_HEAT: Sh_120mm_HE {
    GVAR(skip) = 1;
    GVAR(fragCount) = 400;
    GVAR(metal) = 16760;
    GVAR(charge) = 1640;
    GVAR(gurney_c) = 2901;
};
class Sh_125mm_HE: Sh_120mm_HE {
    GVAR(metal) = 19900;
    GVAR(charge) = 3400;
    GVAR(gurney_c) = 2901;
};

class Sh_105mm_HEAT_MP: Sh_125mm_HEAT {
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 1600; // based on mass and fragment energy/count
    GVAR(metal) = 11400;
    GVAR(charge) = 7100;
    GVAR(gurney_c) = 2800;
};

class ModuleOrdnanceHowitzer_F_ammo: Sh_155mm_AMOS {
    GVAR(skip) = 0;
    GVAR(metal) = 1950;
    GVAR(charge) = 15800;
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "1/2";
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
};
class ammo_Penetrator_Base: ShellBase {
    GVAR(skip) = 1;
};

// ~~~~ Special
class ProbingBeam_01_F: BulletBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class IRStrobeBase: GrenadeCore {
    GVAR(skip) = 1;
};
class FlareCore: GrenadeCore { // flares shouldn't have EH, but in case
    GVAR(skip) = 1;
};

class Default;
class Laserbeam: Default {
    GVAR(skip) = 1;
};

class FuelExplosion: Default {
    GVAR(skip) = 1;
};

class HelicopterExploSmall: ShellBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class LightningBolt: ShellBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class M_Mo_82mm_AT: MissileBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};