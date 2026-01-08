class CfgAmmo {
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
        ACE_muzzleVelocityVariationSD=0.4;
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
        ACE_caliber = 5.67;
        ACE_bulletLength = 24.3;
        ACE_bulletMass = 5.2;
        ACE_ammoTempMuzzleVelocityShifts[] = {-8.85,-8.49,-7.61667,-6.70667,-5.66,-4.26667,-2.54667,-0.51,1.98667,5.05667,8.73};
        ACE_muzzleVelocities[] = {300, 320, 335};
        ACE_barrelLengths[] = {200, 300, 400};
    };
    class rhs_B_762x39_U_Ball: rhs_B_762x39_Ball {
        ACE_caliber = 7.94;
        ACE_bulletLength = 33.62;
        ACE_bulletMass = 12.5;
        ACE_ammoTempMuzzleVelocityShifts[] = {-8.85,-8.49,-7.61667,-6.70667,-5.66,-4.26667,-2.54667,-0.51,1.98667,5.05667,8.73}; //Just Scaled Down Normal?
        ACE_muzzleVelocities[]= {270, 290, 320};
        ACE_barrelLengths[]= {254.0, 414.02, 508.0};
    };
    class rhs_B_9x39_SP5: rhs_B_762x39_Ball {
        ACE_caliber = 9.246;
        ACE_bulletLength = 31.496;
        ACE_bulletMass = 16.1;
        ACE_ammoTempMuzzleVelocityShifts[] = {-2.655,-2.547,-2.285,-2.012,-1.698,-1.28,-0.764,-0.153,0.596,1.517,2.619};
        ACE_ballisticCoefficients[] = {0.275};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_muzzleVelocities[] = {280, 300, 320};
        ACE_barrelLengths[] = {254.0, 414.02, 508.0};
    };
    class rhs_B_9x39_SP6: rhs_B_9x39_SP5 {
        ACE_caliber = 9.26;
        ACE_bulletMass = 16.2;
        ACE_ballisticCoefficients[] = {0.225};
        ACE_muzzleVelocities[] = {290, 310, 335};
        ACE_barrelLengths[] = {254.0, 414.02, 508.0};
    };

    class SubmunitionBase;
    class rhs_ammo_127x108mm_x5: SubmunitionBase {
        ACE_rearm_caliber=13;
    };

    class GrenadeHand;
    class rhs_ammo_rgd5: GrenadeHand {
        EGVAR(frag,metal) = 200;
        EGVAR(frag,charge) = 110;
        EGVAR(frag,gurney_c) = 2440;
        EGVAR(frag,gurney_k) = 3/5;
        EGVAR(frag,classes)[] = {"ACE_frag_small_HD"};
        EGVAR(frag,skip) = 0;
        EGVAR(frag,force) = 1;
    };
    class rhs_ammo_rgn: rhs_ammo_rgd5 {
        EGVAR(frag,enabled) = 0;
        EGVAR(frag,skip) = 1;
        EGVAR(frag,force) = 0;
    };
    class rhs_ammo_fakel: GrenadeHand {
        EGVAR(frag,enabled) = 0;
        EGVAR(frag,skip) = 1;
        EGVAR(frag,force) = 0;
    };

    class rhs_rpg7v2_pg7vl;
    class rhs_rpg7v2_og7v: rhs_rpg7v2_pg7vl {
        EGVAR(frag,metal) = 400;
        EGVAR(frag,charge) = 210;
        EGVAR(frag,gurney_c) = 2800;
        EGVAR(frag,gurney_k) = 3/5;
        EGVAR(frag,classes)[] = {"ACE_frag_medium_HD"};
        EGVAR(frag,skip) = 0;
        EGVAR(frag,force) = 1;
        EGVAR(vehicle_damage,incendiary) = 0.1;
    };
    class rhs_rpg7v2_tbg7v: rhs_rpg7v2_pg7vl {
        EGVAR(frag,enabled) = 0;
        EGVAR(frag,skip) = 1;
        EGVAR(frag,force) = 0;
        EGVAR(vehicle_damage,incendiary) = 0.7;
    };
    class rhs_rshg2_rocket: rhs_rpg7v2_tbg7v {
        EGVAR(frag,enabled) = 0;
        EGVAR(frag,skip) = 1;
        EGVAR(frag,force) = 0;
    };

    class G_40mm_HE;
    class rhs_g_vog25: G_40mm_HE {};
    class rhs_g_vg40tb: rhs_g_vog25 { //Thermobaric
        EGVAR(frag,force) = 0;
    };
    class rhs_g_vg40sz: rhs_g_vog25 { //Flashbang
        EGVAR(frag,force) = 0;
    };
    class rhs_g_gdm40: rhs_g_vog25 { //Smoke
        EGVAR(frag,force) = 0;
    };
    class rhs_g_vg40md_white: rhs_g_vog25 { //Smoke
        EGVAR(frag,force) = 0;
    };

    class SmokeShell;
    class rhs_ammo_rdg2_white: SmokeShell {
        EGVAR(grenades,rollVectorDirAndUp)[] = {{0, 1, 0}, {0, 0, 1}};
    };

    class Sh_125mm_APFSDS;
    class Sh_125mm_HE;
    class rhs_ammo_bm_base: Sh_125mm_APFSDS {
        EGVAR(vehicle_damage,incendiary) = 0.1;
    };
    class rhs_ammo_bk_base: rhs_ammo_bm_base {
        EGVAR(vehicle_damage,incendiary) = 1.0;
    };
    class rhs_ammo_3bm_base: rhs_ammo_bm_base {};
    class rhs_ammo_of_base: Sh_125mm_HE {
        EGVAR(vehicle_damage,incendiary) = 0.30;
    };
    class rhs_ammo_base_penetrator: rhs_ammo_3bm_base {
        EGVAR(vehicle_damage,incendiary) = 1.0;
    };
    class rhs_ammo_ap_penetrator: Sh_125mm_APFSDS {
        EGVAR(vehicle_damage,incendiary) = 0.1;
    };

    class M_Titan_AT;
    class rhs_ammo_atgmCore_base: M_Titan_AT {
        EGVAR(vehicle_damage,incendiary) = 1.0;
    };
    class rhs_ammo_atgmBase_base: M_Titan_AT {
        EGVAR(vehicle_damage,incendiary) = 1.0;
    };

    class rhs_ammo_rpgShell_base;
    class rhs_ammo_og9v: rhs_ammo_rpgShell_base {
        EGVAR(vehicle_damage,incendiary) = 0.1;
    };

    class rhs_ammo_rpg15Shell_base;
    class rhs_ammo_og15v: rhs_ammo_rpg15Shell_base {
        EGVAR(vehicle_damage,incendiary) = 0.1;
    };

    class B_30mm_AP;
    class rhs_ammo_30x165mm_base: B_30mm_AP {
        EGVAR(vehicle_damage,incendiary) = 0.2;
    };
};
