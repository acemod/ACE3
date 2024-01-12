// ~~~~ Autocannons
class B_19mm_HE: BulletBase {
    GVAR(skip) = 1;
};
class B_20mm: BulletBase {
    // Used in Weisel/AWC Nyx, which makes it a Rheinmetall Mk 20 Rh-202
    // http://www.navweaps.com/Weapons/WNGER_20mm-65_mk20.php
    // total mass of 134g probably not enough to do anything
    /*GVAR(fragCount) = 20;
    GVAR(metal) = ;
    GVAR(charge) = ;
    GVAR(gurney_c) = ;
    GVAR(gurney_k) = "1/2";*/
    GVAR(skip) = 1;
};
class B_30mm_HE: B_19mm_HE {
    // Used in Gorgon (Pandur II), assuming it's a L21A1 RARDEN, specifically HEI-T due to tracers
    // https://ordtech-industries.com/30x170-mm-ammunition-for-cannons-oerlikon-kcb-hispano-hs831l-l21-rarden/
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(small)};
    GVAR(fragCount) = 100;
    GVAR(metal) = 320;
    GVAR(charge) = 25;
    GVAR(gurney_c) = 2547; // Hexal det. velocity / 3
    GVAR(gurney_k) = "1/2";
};
class B_30mm_MP: B_30mm_HE {
    // Used in Mora (FV510 Warrior), assuming it's a Mk44 Bushmaster II, specifically HEI-T due to tracers
    // http://www.navweaps.com/Weapons/WNUS_30mm_BushmasterII.php
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(small)};
    GVAR(fragCount) = 100; // assumed based on https://www.youtube.com/watch?v=c5SsspD0MeU
    GVAR(metal) = 388;
    GVAR(charge) = 56;
    GVAR(gurney_c) = 2600; // guessed
    GVAR(gurney_k) = "1/2";
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
class B_35mm_AA: BulletBase {
    // Gepard uses an Oerlikon GDF and the AA vehicles mimics it like it
    // https://en.wikipedia.org/wiki/Oerlikon_GDF#Ammunition
    // https://www.nammo.com/product/our-products/ammunition/medium-caliber-ammunition/35-mm-series/35-mm-x-228-hei-sd-and-hei-t-sd/
    GVAR(skip) = 0;
    GVAR(classes)[] = {QGVAR(tiny), QGVAR(tiny), QGVAR(small)};
    GVAR(fragCount) = 175;
    GVAR(metal) = 400;
    GVAR(charge) = 98;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};

// ~~~~ Bombs:
class Bo_GBU12_LGB: ammo_Bomb_LaserGuidedBase {
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
    GVAR(fragCount) = 17500;
    GVAR(metal) = 140000;
    GVAR(charge) = 87000;
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "1/2";
};
class Bomb_04_F: ammo_Bomb_LaserGuidedBase {
    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
    GVAR(fragCount) = 17500;
    GVAR(metal) = 140000;
    GVAR(charge) = 87000;
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "1/2";
};

class BombCore;
class Bo_Mk82: BombCore {
    ACE_FRAG_ADD_EH;

    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
    GVAR(fragCount) = 17500;
    GVAR(metal) = 140000;
    GVAR(charge) = 87000;
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "1/2";
};

// ~~~~ Grenades:
class Grenade;
class ACE_FlashlightProxy_White: Grenade {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};
class GrenadeHand: Grenade {
    ACE_FRAG_ADD_EH;
    GVAR(skip) = 0;
    GVAR(force) = 1;
    /*
    These values are based on the M67 Grenade, should be tweaked for
    individual grenades.
    */
    GVAR(classes)[] = {QGVAR(tiny)};
    GVAR(fragCount) = 1000;
    GVAR(metal) = 210;         // metal in grams
    GVAR(charge) = 185;        // explosive in grams
    GVAR(gurney_c) = 2843;    // Gurney velocity constant for explosive type. See: http://en.wikipedia.org/wiki/Gurney_equations
    GVAR(gurney_k) = "3/5";    // Gurney shape factor, in this case a sphere. See: http://en.wikipedia.org/wiki/Gurney_equations
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
    // Source: http://www.inetres.com/gp/military/infantry/grenade/40mm_ammo.html#M441
    GVAR(force) = 1;

    GVAR(classes)[] = {QGVAR(small)};
    GVAR(fragCount) = 800; // guess based on probability hit of 1%
    GVAR(metal) = 200;
    GVAR(charge) = 32;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "3/5"; // interior fragmenter/charge is a sphere
};
class G_40mm_HEDP: G_40mm_HE {
    // Source: http://www.inetres.com/gp/military/infantry/grenade/40mm_ammo.html#M433
    GVAR(classes)[] = {QGVAR(small_HD)};
    GVAR(fragCount) = 270; // seems to have greater framentation ability, but lower range per source
    GVAR(metal) = 200;
    GVAR(charge) = 45;
    GVAR(gurney_c) = 2830;
    GVAR(gurney_k) = "1/2";
};

class ACE_G_40mm_HEDP: G_40mm_HEDP {};
class ACE_G_40mm_HE: G_40mm_HE {};
class ACE_G_40mm_Practice: ACE_G_40mm_HE {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
    GVAR(force) = 0;
    EGVAR(vehicle_damage,incendiary) = 0;
};

// ~~~~ Mines & UXO
class Drone_explosive_ammo: MineBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class APERSMine_Range_Ammo;
class UXO1_Ammo_Base_F: APERSMine_Range_Ammo {
    // https://www.globalsecurity.org/military/systems/munitions/blu-97.htm
    // https://military-history.fandom.com/wiki/BLU-97/B_Combined_Effects_Bomb
    GVAR(force) = 0;
    GVAR(classes)[] = {QGVAR(small), QGVAR(small), QGVAR(medium)};
    GVAR(fragCount) = 300;
    GVAR(metal) = 1253;
    GVAR(charge) = 287;
    GVAR(gurney_c) = 2900; 
    GVAR(gurney_k) = "1/2";

};
class APERSMineDispenser_Mine_Ammo: APERSMine_Range_Ammo {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class UXO_deploy_base_f: SubmunitionBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
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

class BombDemine_01_Ammo_F: BombCore {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

// ~~~~ RPGs:
class R_PG32V_F;
class R_TBG32V_F: R_PG32V_F { // Thermobaric
    GVAR(fragCount) = 200; 
    GVAR(metal) = 400;
    GVAR(charge) = 210;
    GVAR(gurney_c) = 2800;
    GVAR(gurney_k) = "3/5";
    GVAR(classes)[] = {QGVAR(medium_HD)};
};
class M_Titan_AA: MissileBase {
    GVAR(skip) = 1;
};
class M_Titan_AT: MissileBase {
    GVAR(skip) = 1;
};
class M_Titan_AP: M_Titan_AT { // "anti personnel"
    GVAR(skip) = 0;
    GVAR(fragCount) = 800; // guesstimate / provides ~80 m frag range
    GVAR(enabled) = 1;
    GVAR(metal) = 400;
    GVAR(charge) = 210;
    GVAR(gurney_c) = 2800;
    GVAR(gurney_k) = "3/5";
    GVAR(classes)[] = {QGVAR(medium_HD)};
};

// https://ofb.gov.in/product/products/product-details/84-mm-he-round-ffv-441-b
// https://armypubs.army.mil/epubs/DR_pubs/DR_a/pdf/web/ARN18072_TC%203-22x84%20FINAL%20WEB.pdf (page 99, Table A-6. HE 441D RS, 84-mm projectile)
class R_MRAAWS_HEAT_F;
class R_MRAAWS_HE_F: R_MRAAWS_HEAT_F {
    GVAR(enabled) = 1;
    GVAR(fragCount) = 1200; // guesstimate / provides ~100 m frag range (1% chance to hit) 
    GVAR(metal) = 2300;
    GVAR(charge) = 590;
    GVAR(gurney_c) = 2800;
    GVAR(gurney_k) = "1/2";
    GVAR(classes)[] = {QGVAR(small)};
};


// ~~~~ Missiles:
class M_PG_AT;
class M_AT: M_PG_AT { // DAR (Hydra 70)
    // Source: http://fas.org/man/dod-101/sys/missile/hydra-70.htm
    GVAR(enabled) = 1;

    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 1200; // guesstimate / provides ~100 m frag range (1% chance to hit) 
    GVAR(metal) = 3850;
    GVAR(charge) = 1040;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};

class R_80mm_HE: RocketBase {
    GVAR(skip) = 1;
};
class Missile_AGM_02_F: MissileBase {
    // Source: http://fas.org/man/dod-101/sys/smart/agm-65.htm
    GVAR(enabled) = 1;

    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 1600; // guesstimate / provides ~112 m frag range (1% chance to hit) 
    GVAR(metal) = 56250;
    GVAR(charge) = 39000;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};
class Rocket_04_HE_F: MissileBase { // Shrieker (Hydra 70)
    GVAR(enabled) = 1;
    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 1200; // guesstimate / provides ~100 m frag range (1% chance to hit) 
    GVAR(metal) = 3850;
    GVAR(charge) = 1040;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};
class M_Scalpel_AT: MissileBase { // 9K121 Vikhr
    GVAR(enabled) = 1;
    GVAR(classes)[] = {QGVAR(small), QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 800; // guesstimate based on frag jacket, provides ~80 m frag range (1% chance to hit) 
    GVAR(metal) = 10000;
    GVAR(charge) = 3000;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};
class ACE_Hellfire_AGM114K: M_Scalpel_AT {
    // Source: http://www.designation-systems.net/dusrm/m-114.html
    GVAR(enabled) = 1;

    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 350; // guesstimate based on frag jacket, provides ~50 m frag range (1% chance to hit) 
    GVAR(metal) = 8000;
    GVAR(charge) = 2400;
    GVAR(gurney_c) = 2700;
    GVAR(gurney_k) = "1/2";
};
class M_Air_AA: MissileBase {
    GVAR(skip) = 1;
};
class Missile_AA_04_F: MissileBase {
    GVAR(skip) = 1;
};

// Based on Metis-M missiles 
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

class M_NLAW_AT_F: MissileBase {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

/// ~~~~ Shell
class Sh_125mm_HEAT;
class Sh_155mm_AMOS: ShellBase {
    // Source: http://www.globalsecurity.org/military/systems/munitions/m795.htm
    GVAR(enabled) = 1;

    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
    GVAR(fragCount) = 3250; // http://18.195.19.6/bitstream/handle/20.500.12242/1200/15-01916.pdf?sequence=1&isAllowed=y
    GVAR(metal) = 36000;
    GVAR(charge) = 9979;
    GVAR(gurney_c) = 2440;
    GVAR(gurney_k) = "1/2";
};
class Sh_82mm_AMOS: Sh_155mm_AMOS {
    //http://65.175.100.54/uxofiles/mulvaney/techdatasheets/81mm-HE-M821.pdf
    GVAR(enabled) = 1;

    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 1600; // based on mass and fragment energy/count
    GVAR(metal) = 2500;
    GVAR(charge) = 726;
    GVAR(gurney_c) = 2440;
    GVAR(gurney_k) = "1/2";
};
class ModuleOrdnanceMortar_F_Ammo: Sh_82mm_AMOS {
    GVAR(enabled) = 1;

    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(metal) = 800;
    GVAR(charge) = 4200;
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "1/2";
};
class Sh_105mm_HEAT_MP: Sh_125mm_HEAT {
    GVAR(enabled) = 1;

    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 1600; // based on mass and fragment energy/count
    GVAR(metal) = 11400;
    GVAR(charge) = 7100;
    GVAR(gurney_c) = 2800;
    GVAR(gurney_k) = "1/2";
};
class Sh_120mm_HE: ShellBase {
    GVAR(enabled) = 1;

    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(fragCount) = 2000; 
    GVAR(metal) = 23000;
    GVAR(charge) = 3148;
    GVAR(gurney_c) = 2830;
    GVAR(gurney_k) = "1/2";
};
class Sh_125mm_HE: Sh_120mm_HE {
    GVAR(enabled) = 1;

    GVAR(classes)[] = {QGVAR(medium), QGVAR(medium_HD)};
    GVAR(metal) = 16000;
    GVAR(charge) = 3200;
    GVAR(gurney_c) = 2440;
    GVAR(gurney_k) = "1/2";
};
class ModuleOrdnanceHowitzer_F_ammo: Sh_155mm_AMOS {
    GVAR(enabled) = 1;

    GVAR(classes)[] = {QGVAR(large), QGVAR(large), QGVAR(large_HD), QGVAR(large), QGVAR(huge), QGVAR(huge_HD), QGVAR(huge)};
    GVAR(metal) = 1950;
    GVAR(charge) = 15800;
    GVAR(gurney_c) = 2320;
    GVAR(gurney_k) = "1/2";
};
class ammo_Penetrator_Base: ShellBase {
    GVAR(skip) = 1;
};

// Special
class Default;
class Laserbeam: Default {
    ACE_FRAG_RM_EH;
    GVAR(skip) = 1;
};

class FuelExplosion: Default {
    ACE_FRAG_RM_EH;
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