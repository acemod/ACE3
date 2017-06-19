
class CfgAmmo {
    class BulletBase;
    class B_556x45_Ball;
    class rhs_B_545x39_Ball: B_556x45_Ball {
        ACE_caliber=5.588;
        ACE_bulletLength=21.59;
        ACE_bulletMass=3.42792;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.168};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={780, 880, 920};
        ACE_barrelLengths[]={254.0, 414.02, 508.0};
    };
    class rhs_B_545x39_Ball_Tracer_Green: rhs_B_545x39_Ball {
        ACE_caliber=5.588;
        ACE_bulletLength=21.59;
        ACE_bulletMass=3.22704;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.168};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={785, 883, 925};
        ACE_barrelLengths[]={254.0, 414.02, 508.0};
    };
    class B_762x51_Ball;
    class rhs_B_762x54_Ball: B_762x51_Ball {
        ACE_caliber=7.925;
        ACE_bulletLength=28.956;
        ACE_bulletMass=9.8496;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.4};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={700, 800, 820, 833};
        ACE_barrelLengths[]={406.4, 508.0, 609.6, 660.4};
    };
    class rhs_B_762x54_Ball_Tracer_Green: rhs_B_762x54_Ball {
        ACE_caliber=7.925;
        ACE_bulletLength=28.956;
        ACE_bulletMass=9.6552;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.395};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={680, 750, 798, 800};
        ACE_barrelLengths[]={406.4, 508.0, 609.6, 660.4};
    };
    class rhs_B_762x54_7N1_Ball: rhs_B_762x54_Ball {
        ACE_caliber=7.925;
        ACE_bulletLength=28.956;
        ACE_bulletMass=9.8496;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.4};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={700, 800, 820, 833};
        ACE_barrelLengths[]={406.4, 508.0, 609.6, 660.4};
    };
    class rhs_B_762x39_Ball: B_762x51_Ball {
        ACE_caliber=7.823;
        ACE_bulletLength=28.956;
        ACE_bulletMass=7.9704;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.275};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={650, 716, 750};
        ACE_barrelLengths[]={254.0, 414.02, 508.0};
    };
    class rhs_B_762x39_Tracer: rhs_B_762x39_Ball {
        ACE_caliber=7.823;
        ACE_bulletLength=28.956;
        ACE_bulletMass=7.5816;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.275};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={650, 716, 750};
        ACE_barrelLengths[]={254.0, 414.02, 508.0};
    };
    class B_9x21_Ball;
    class rhs_B_9x19_7N21: B_9x21_Ball {
        ACE_caliber=9.017;
        ACE_bulletLength=15.494;
        ACE_bulletMass=5.19696;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.14};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={445, 460, 480};
        ACE_barrelLengths[]={101.6, 127.0, 228.6};
    };
    class rhs_B_9x18_57N181S: B_9x21_Ball {
        ACE_caliber=9.271;
        ACE_bulletLength=15.494;
        ACE_bulletMass=6.00048;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.125};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={298, 330, 350};
        ACE_barrelLengths[]={96.52, 127.0, 228.6};
    };
    class rhs_B_545x39_7U1_Ball: rhs_B_545x39_Ball {
        // @todo: Provide accurate coefficients for this subsonic ammo
        // In the meantime, prevent it inheriting from its supersonic parent
        // ammoTempMuzzleVelocityShifts scaled down from normal
        ACE_ammoTempMuzzleVelocityShifts[]={-8.85,-8.49,-7.61667,-6.70667,-5.66,-4.26667,-2.54667,-0.51,1.98667,5.05667,8.73};
        ACE_muzzleVelocities[] = {};
        ACE_barrelLengths[] = {};
    };
    class rhs_B_762x39_U_Ball: rhs_B_762x39_Ball {
        // @todo: Provide accurate coefficients for this subsonic ammo
        // In the meantime, prevent it inheriting from its supersonic parent
        // ammoTempMuzzleVelocityShifts scaled down from normal
        ACE_ammoTempMuzzleVelocityShifts[]={-8.85,-8.49,-7.61667,-6.70667,-5.66,-4.26667,-2.54667,-0.51,1.98667,5.05667,8.73}; //Just Scaled Down Normal?
        ACE_muzzleVelocities[] = {};
        ACE_barrelLengths[] = {};
    };
    class rhs_B_9x39_SP5: rhs_B_762x39_Ball {
        // @todo: Provide accurate coefficients for this subsonic ammo
        // In the meantime, prevent it inheriting from its supersonic parent
        ACE_ammoTempMuzzleVelocityShifts[]={};
        ACE_muzzleVelocities[]={};
        ACE_barrelLengths[]={};
    };

    class SubmunitionBase;
    class rhs_ammo_127x108mm_x5: SubmunitionBase {
        ACE_rearm_caliber=13;
    };

    class GrenadeHand;
    class rhs_ammo_rgd5: GrenadeHand {
        ace_frag_enabled = 1;
        ace_frag_metal = 200;
        ace_frag_charge = 110;
        ace_frag_gurney_c = 2440;
        ace_frag_gurney_k = "3/5";
        ace_frag_classes[] = {"ACE_frag_small_HD"};
        ace_frag_skip = 0;
        ace_frag_force = 1;
    };
    class rhs_ammo_rgn_base: rhs_ammo_rgd5 {
        ace_frag_enabled = 1;
        ace_frag_metal = 193;
        ace_frag_charge = 97;
        ace_frag_gurney_c = 2800;
        ace_frag_gurney_k = "3/5";
        ace_frag_classes[] = {"ACE_frag_tiny_HD"};
        ace_frag_skip = 0;
        ace_frag_force = 1;
    };
    class rhs_ammo_rgn: rhs_ammo_rgn_base {
        // RGN is scripted grenade that deletes itself, which will break advanced throwing, replace with it's base
        ace_advanced_throwing_replaceWith = "rhs_ammo_rgn_base";
        ace_frag_enabled = 0;
        ace_frag_skip = 1;
        ace_frag_force = 0;
    };
    class rhs_ammo_rgn_sub: rhs_ammo_rgn_base {};
    class rhs_ammo_rgn_exp: rhs_ammo_rgn_base {};
    class rhs_ammo_fakel: GrenadeHand {
        ace_frag_enabled = 0;
        ace_frag_skip = 1;
        ace_frag_force = 0;
    };
    class rhs_ammo_fakels: rhs_ammo_fakel {};
    class rhs_ammo_zarya2: rhs_ammo_fakels {};
    class rhs_ammo_plamyam: rhs_ammo_fakels {};

    class RocketBase;
    class R_PG32V_F: RocketBase {};
    class rhs_rpg26_rocket: R_PG32V_F {};
    class rhs_rpg7v2_pg7vl: rhs_rpg26_rocket {};
    class rhs_rpg7v2_og7v: rhs_rpg7v2_pg7vl {
        ace_frag_enabled = 1;
        ace_frag_metal = 400;
        ace_frag_charge = 210;
        ace_frag_gurney_c = 2800;
        ace_frag_gurney_k = "3/5";
        ace_frag_classes[] = {"ACE_frag_medium_HD"};
        ace_frag_skip = 0;
        ace_frag_force = 1;
    };
    class rhs_rpg7v2_tbg7v: rhs_rpg7v2_pg7vl {
        ace_frag_enabled = 0;
        ace_frag_skip = 1;
        ace_frag_force = 0;
    };
    class rhs_rshg2_rocket: rhs_rpg7v2_tbg7v {
        ace_frag_enabled = 0;
        ace_frag_skip = 1;
        ace_frag_force = 0;
    };
    
    class G_40mm_HE;
    class rhs_g_vog25: G_40mm_HE {};
    class rhs_g_vg40tb: rhs_g_vog25 { //Thermobaric
        ace_frag_force = 0;
    };
    class rhs_g_vg40sz: rhs_g_vog25 { //Flashbang
        ace_frag_force = 0;
    };
    class rhs_g_gdm40: rhs_g_vog25 { //Smoke
        ace_frag_force = 0;
    };
    class rhs_g_vg40md_white: rhs_g_vog25 { //Smoke
        ace_frag_force = 0;
    };
    
};
