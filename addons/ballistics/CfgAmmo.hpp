
class CfgAmmo {
    class BulletCore;

    class BulletBase: BulletCore {
        timeToLive=6;
    };

    class B_556x45_Ball : BulletBase {
        airFriction=-0.00130094;
        tracerScale = 1;
        tracerStartTime=0.073;  // M856 tracer burns out to 800m
        tracerEndTime=1.57123;  // Time in seconds calculated with ballistics calculator
        ACE_caliber=5.69;
        ACE_bulletLength=23.012;
        ACE_bulletMass=4.0176;
        ACE_ammoTempMuzzleVelocityShifts[]={-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
        ACE_ballisticCoefficients[]={0.151};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
        ACE_barrelLengths[]={210.82, 238.76, 269.24, 299.72, 330.2, 360.68, 391.16, 419.1, 449.58, 480.06, 508.0, 609.6};
    };
    class ACE_556x45_Ball_Mk262 : B_556x45_Ball {
        airFriction=-0.00111805;
        ACE_caliber=5.69;
        ACE_bulletLength=23.012;
        ACE_bulletMass=4.9896;
        ACE_muzzleVelocityVariationSD=0.4;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.361};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={624, 816, 832, 838};
        ACE_barrelLengths[]={190.5, 368.3, 457.2, 508.0};
    };
    class ACE_556x45_Ball_Mk318 : B_556x45_Ball {
        airFriction=-0.0012588;
        ACE_caliber=5.69;
        ACE_bulletLength=23.012;
        ACE_bulletMass=4.0176;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.307};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={780, 886, 950};
        ACE_barrelLengths[]={254.0, 393.7, 508.0};
    };
    class ACE_556x45_Ball_M995_AP : B_556x45_Ball {
        airFriction=-0.00126182;
        caliber=1.6;
        ACE_caliber=5.69;
        ACE_bulletLength=23.012;
        ACE_bulletMass=4.5359237;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.310};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={820, 865, 880};
        ACE_barrelLengths[]={254.0, 368.3, 508.0};
    };
    class B_556x45_Ball_Tracer_Red;
    class ACE_B_556x45_Ball_Tracer_Dim: B_556x45_Ball_Tracer_Red {
        nvgOnly = 1;
    };
    class B_545x39_Ball_F : BulletBase {
        airFriction=-0.00119458;
        ACE_caliber=5.588;
        ACE_bulletLength=21.59;
        ACE_bulletMass=3.42792;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.168};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={735, 883, 892};
        ACE_barrelLengths[]={206.5, 414.02, 508.0};
    };
    class B_56x15_dual: BulletBase {
        tracerScale = 0.5;
    };
    class B_580x42_Ball_F: BulletBase {
        airFriction=-0.00121087;
        ACE_caliber=5.9944;
        ACE_bulletLength=24.2;
        ACE_bulletMass=4.15;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.156};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={790, 930, 950};
        ACE_barrelLengths[]={369.0, 463.0, 600.0};
    };
    class B_65x39_Caseless : BulletBase {
        airFriction=-0.00077363;
        tracerScale = 1.1; //1.0;
        ACE_caliber=6.706;
        ACE_bulletLength=32.893;
        ACE_bulletMass=7.9704;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.263};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={730, 760, 788, 800, 810, 830};
        ACE_barrelLengths[]={254.0, 406.4, 508.0, 609.6, 660.4, 762.0};
    };
    class B_65x39_Case_yellow;
    class ACE_65x39_Caseless_Tracer_Dim : B_65x39_Case_yellow {
        nvgOnly = 1;
    };
    class B_65x39_Caseless_green;
    class ACE_65x39_Caseless_green_Tracer_Dim : B_65x39_Caseless_green {
        nvgOnly = 1;
    };
    class ACE_65x47_Ball_Scenar: B_65x39_Caseless {
        airFriction=-0.00069003;
        caliber=0.9;
        ACE_caliber=6.706;
        ACE_bulletLength=34.646;
        ACE_bulletMass=9.0072;
        ACE_muzzleVelocityVariationSD=0.35;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.290};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={730, 760, 790, 820, 830};
        ACE_barrelLengths[]={254.0, 406.4, 508.0, 609.6, 660.4};
    };
    class ACE_65_Creedmor_Ball: B_65x39_Caseless {
        airFriction=-0.00062437;
        caliber=1.1;
        ACE_caliber=6.706;
        ACE_bulletLength=36.22;
        ACE_bulletMass=9.072;
        ACE_muzzleVelocityVariationSD=0.3;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.317};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={750, 820, 840, 852, 860};
        ACE_barrelLengths[]={254.0, 406.4, 508.0, 609.6, 660.4};
    };
    class SubmunitionBullet;
    class B_65x39_Minigun_Caseless: SubmunitionBullet {
        tracerScale = 1.1; //1.0;
    };
    class B_762x51_Ball : BulletBase {
        airFriction=-0.00103711;
        tracerScale = 1.2; //0.6;
        tracerStartTime=0.073;  // Based on the British L5A1 which burns out to 1000m 
        tracerEndTime=2.15957;  // Time in seconds calculated with ballistics calculator
        ACE_caliber=7.823;
        ACE_bulletLength=28.956;
        ACE_bulletMass=9.4608;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.2};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={700, 800, 820, 833, 845};
        ACE_barrelLengths[]={254.0, 406.4, 508.0, 609.6, 660.4};
    };
    class B_762x51_Tracer_Yellow;
    class ACE_B_762x51_Tracer_Dim: B_762x51_Tracer_Yellow {
        nvgOnly = 1;
    };
    class ACE_762x51_Ball_M118LR : B_762x51_Ball {
        airFriction=-0.00085157;
        caliber=1.8;
        hit=16;
        typicalSpeed=790;
        ACE_caliber=7.823;
        ACE_bulletLength=31.496;
        ACE_bulletMass=11.34;
        ACE_muzzleVelocityVariationSD=0.4;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.243};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={750, 780, 790, 794};
        ACE_barrelLengths[]={406.4, 508.0, 609.6, 660.4};
    };
    class ACE_762x51_Ball_Mk316_Mod_0 : B_762x51_Ball {
        airFriction=-0.00084311;
        caliber=1.8;
        hit=16;
        typicalSpeed=790;
        ACE_caliber=7.823;
        ACE_bulletLength=31.496;
        ACE_bulletMass=11.34;
        ACE_muzzleVelocityVariationSD=0.45;
        ACE_ammoTempMuzzleVelocityShifts[]={-5.3, -5.1, -4.6, -4.2, -3.4, -2.6, -1.4, -0.3, 1.4, 3.0, 5.2};
        ACE_ballisticCoefficients[]={0.243};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={775, 790, 805, 810};
        ACE_barrelLengths[]={406.4, 508.0, 609.6, 660.4};
    };
    class ACE_762x51_Ball_Mk319_Mod_0 : B_762x51_Ball {
        airFriction=-0.00104515;
        caliber=1.5;
        hit=14;
        typicalSpeed=900;
        ACE_caliber=7.823;
        ACE_bulletLength=31.496;
        ACE_bulletMass=8.424;
        ACE_muzzleVelocityVariationSD=0.45;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.377};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={838, 892, 910};
        ACE_barrelLengths[]={330.2, 406.4, 508.0};
    };
    class ACE_762x51_Ball_M993_AP : B_762x51_Ball {
        airFriction=-0.0010939;
        caliber=2.2;
        hit=11;
        typicalSpeed=910;
        ACE_caliber=7.823;
        ACE_bulletLength=31.496;
        ACE_bulletMass=8.22946157;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.359};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={875, 910, 930};
        ACE_barrelLengths[]={330.2, 406.4, 508.0};
    };
    class ACE_762x51_Ball_Subsonic : B_762x51_Ball {
        airFriction=-0.00060194;
        caliber=1;
        hit=6;
        typicalSpeed=320;
        ACE_caliber=7.823;
        ACE_bulletLength=34.036;
        ACE_bulletMass=12.96;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.235};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={305, 325, 335, 340};
        ACE_barrelLengths[]={406.4, 508.0, 609.6, 660.4};
    };
    class ACE_762x67_Ball_Mk248_Mod_0 : B_762x51_Ball {
        airFriction=-0.00072468;
        caliber=1.8;
        hit=17;
        typicalSpeed=900;
        ACE_caliber=7.823;
        ACE_bulletLength=34.366;
        ACE_bulletMass=12.312;
        ACE_muzzleVelocityVariationSD=0.45;
        ACE_ammoTempMuzzleVelocityShifts[]={-5.3, -5.1, -4.6, -4.2, -3.4, -2.6, -1.4, -0.3, 1.4, 3.0, 5.2};
        ACE_ballisticCoefficients[]={0.268};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={865, 900, 924};
        ACE_barrelLengths[]={508.0, 609.6, 660.4};
    };
    class ACE_762x67_Ball_Mk248_Mod_1 : B_762x51_Ball {
        airFriction=-0.00063027;
        caliber=1.9;
        hit=18;
        typicalSpeed=867;
        ACE_caliber=7.823;
        ACE_bulletLength=37.821;
        ACE_bulletMass=14.256;
        ACE_muzzleVelocityVariationSD=0.45;
        ACE_ammoTempMuzzleVelocityShifts[]={-5.3, -5.1, -4.6, -4.2, -3.4, -2.6, -1.4, -0.3, 1.4, 3.0, 5.2};
        ACE_ballisticCoefficients[]={0.310};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={847, 867, 877};
        ACE_barrelLengths[]={508.0, 609.6, 660.4};
    };
    class ACE_762x67_Ball_Berger_Hybrid_OTM : B_762x51_Ball {
        airFriction=-0.00055262;
        caliber=2.0;
        hit=19;
        typicalSpeed=853;
        ACE_caliber=7.823;
        ACE_bulletLength=40.691;
        ACE_bulletMass=14.904;
        ACE_muzzleVelocityVariationSD=0.35;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.368};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={800, 853, 884};
        ACE_barrelLengths[]={508.0, 609.6, 660.4};
    };
    class B_762x54_Ball: B_762x51_Ball {
        airFriction=-0.00101071;
        typicalSpeed=835;
        ACE_caliber=7.925;
        ACE_bulletLength=28.956;
        ACE_bulletMass=9.8496;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.4};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={760, 795, 835, 865};
        ACE_barrelLengths[]={406.4, 508.0, 604.5, 736.6};
    };
    class B_762x54_Tracer_Green;
    class ACE_762x54_Ball_7T2 : B_762x54_Tracer_Green {
        airFriction=-0.00103739;
        typicalSpeed=800;
        tracerStartTime=0.073;  // Based on the 7T2 which burns three seconds
        tracerEndTime=3;
        ACE_caliber=7.925;
        ACE_bulletLength=28.956;
        ACE_bulletMass=9.6552;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.395};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={735, 770, 809, 838};
        ACE_barrelLengths[]={406.4, 508.0, 604.5, 736.6};
    };
    class B_762x39_Ball_F : BulletBase {
        airFriction=-0.00154815;
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
    class B_9x21_Ball : BulletBase {
        airFriction=-0.00211064;
        tracerScale = 0.5;
        ACE_caliber=9.042;
        ACE_bulletLength=15.494;
        ACE_bulletMass=7.452;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.17};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={380, 390, 420, 435};
        ACE_barrelLengths[]={93.5, 101.6, 127.0, 228.6};
    };
    class B_9x21_Ball_Tracer_Green: B_9x21_Ball {
        tracerScale = 0.5;
    };
    class ACE_9x19_Ball : B_9x21_Ball {
        airFriction=-0.00201185;
        ACE_caliber=9.017;
        ACE_bulletLength=15.494;
        ACE_bulletMass=8.0352;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.165};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={340, 370, 400};
        ACE_barrelLengths[]={101.6, 127.0, 228.6};
    };
    class B_93x64_Ball : BulletBase {
        airFriction=-0.00110727;
        ACE_caliber=9.296;
        ACE_bulletLength=34.29;
        ACE_bulletMass=14.904;
        ACE_muzzleVelocityVariationSD=0.4;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.368};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={850, 870, 880};
        ACE_barrelLengths[]={508.0, 620.014, 660.4};
    };
    class B_408_Ball : BulletBase {
        timeToLive=10;
        airFriction=-0.00046249;
        tracerScale = 1.3;
        ACE_caliber=10.363;
        ACE_bulletLength=55.1942;
        ACE_bulletMass=27.1507; // 419 gr
        ACE_transonicStabilityCoef=1;
        ACE_muzzleVelocityVariationSD=0.2;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.434};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={867};
        ACE_barrelLengths[]={736.6};
    };
    class ACE_408_Ball : BulletBase {
        timeToLive=10;
        airFriction=-0.00065414;
        typicalSpeed=1067;
        tracerScale = 1.3;
        ACE_caliber=10.363;
        ACE_bulletLength=41.4528;
        ACE_bulletMass=19.7637; // 305 gr
        ACE_transonicStabilityCoef=1;
        ACE_muzzleVelocityVariationSD=0.2;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.279};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={1067};
        ACE_barrelLengths[]={736.6};
    };
    class B_338_Ball : BulletBase {
        timeToLive=10;
        airFriction=-0.00060841;
        ACE_caliber=8.585;
        ACE_bulletLength=39.573;
        ACE_bulletMass=16.2;
        ACE_muzzleVelocityVariationSD=0.3;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.322};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={880, 915, 925};
        ACE_barrelLengths[]={508.0, 660.4, 711.2};
    };
    class B_338_NM_Ball : BulletBase {
        airFriction=-0.00053639;
        ACE_caliber=8.585;
        ACE_bulletLength=43.18;
        ACE_bulletMass=19.44;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.381};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={790, 807, 820};
        ACE_barrelLengths[]={508.0, 609.6, 660.4};
    };
    class ACE_338_Ball : B_338_Ball {
        timeToLive=10;
        airFriction=-0.00055706;
        typicalSpeed=826;
        ACE_caliber=8.585;
        ACE_bulletLength=44.0182;
        ACE_bulletMass=19.44;
        ACE_muzzleVelocityVariationSD=0.3;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.368};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={800, 820, 826, 830};
        ACE_barrelLengths[]={508.0, 609.6, 673.1, 711.2};
    };
    class ACE_338_Ball_API526 : B_338_Ball {
        timeToLive=10;
        airFriction=-0.0006922;
        caliber=2.8;
        typicalSpeed=895;
        ACE_caliber=8.585;
        ACE_bulletLength=38.989;
        ACE_bulletMass=16.3941242;
        ACE_muzzleVelocityVariationSD=0.4;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.290};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ICAO";
        ACE_dragModel=7;
        ACE_muzzleVelocities[]={880, 895, 900};
        ACE_barrelLengths[]={508.0, 685.8, 711.2};
    };
    class B_127x33_Ball: BulletBase {
        tracerScale = 1.3; //1.2;
    };
    class B_127x54_Ball : BulletBase {
        airFriction=-0.00019568;
        tracerScale = 1.3;//
        ACE_caliber=12.954;
        ACE_bulletLength=64.516;
        ACE_bulletMass=48.6;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={1.050};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={300};
        ACE_barrelLengths[]={436.88};
    };
    class B_127x99_Ball : BulletBase {
        timeToLive=10;
        airFriction=-0.00058679;
        tracerScale = 1.3; //1.2;
        ACE_caliber=12.954;
        ACE_bulletLength=58.674;
        ACE_bulletMass=41.9256;
        ACE_muzzleVelocityVariationSD=0.35;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.670};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={900};
        ACE_barrelLengths[]={736.6};
    };
    class ACE_127x99_API : B_127x99_Ball {
        timeToLive=10;
        airFriction=-0.00058679;
        tracerScale = 1.3;//
        hit=25;
        caliber=4.0;
        ACE_caliber=12.954;
        ACE_bulletLength=58.674;
        ACE_bulletMass=41.9904;
        ACE_muzzleVelocityVariationSD=0.4;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.670};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={900};
        ACE_barrelLengths[]={736.6};
    };
    class ACE_127x99_Ball_AMAX : B_127x99_Ball {
        timeToLive=10;
        airFriction=-0.00037397;
        caliber=3.0;
        ACE_caliber=12.954;
        ACE_bulletLength=64.516;
        ACE_bulletMass=48.6;
        ACE_muzzleVelocityVariationSD=0.2;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={1.050};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={860};
        ACE_barrelLengths[]={736.6};
    };
    class B_127x108_Ball : BulletBase {
        timeToLive=10;
        airFriction=-0.00065098;
        tracerScale = 1.3; //1.5;
        ACE_caliber=12.979;
        ACE_bulletLength=64.008;
        ACE_bulletMass=48.276;
        ACE_ammoTempMuzzleVelocityShifts[]={-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[]={0.63};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={820};
        ACE_barrelLengths[]={728.98};
    };
    class B_127x108_APDS: B_127x108_Ball {
        typicalSpeed = 820;
        airFriction = -0.00065098;
    };
    class B_45ACP_Ball : BulletBase {
        airFriction=-0.00082143;
        tracerScale = 0.6;
        ACE_caliber=11.481;
        ACE_bulletLength=17.272;
        ACE_bulletMass=14.904;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.195};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={230, 250, 285};
        ACE_barrelLengths[]={101.6, 127.0, 228.6};
    };
    class B_50BW_Ball_F : BulletBase {
        airFriction=-0.00205896;
        ACE_caliber=12.7;
        ACE_bulletLength=24.13;
        ACE_bulletMass=21.7076;
        ACE_ammoTempMuzzleVelocityShifts[]={-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[]={0.21};
        ACE_velocityBoundaries[]={};
        ACE_standardAtmosphere="ASM";
        ACE_dragModel=1;
        ACE_muzzleVelocities[]={510, 550, 596};
        ACE_barrelLengths[]={304.8, 406.4, 609.6};
    };
    class B_19mm_HE: BulletBase {
        tracerScale = 1;
    };
    class B_30mm_HE: B_19mm_HE {
        tracerScale = 2.5;
    };
    class B_20mm: BulletBase {
        timeToLive=30;
        tracerScale = 1.5; //1;
    };
    class B_25mm: BulletBase {
        timeToLive=30;
        tracerScale = 2.0; //1;
    };
    class B_30mm_AP: BulletBase {
        timeToLive=30;
        tracerScale = 2.5;
    };
    class B_35mm_AA: BulletBase {
        timeToLive=30;
        tracerScale = 2.75; //1.85;
    };
    class ShellBase;
    class Sh_120mm_HE: ShellBase {
        tracerScale = 3;
    };
    class Sh_120mm_APFSDS: ShellBase {
        tracerScale = 3;
    };
    class Gatling_30mm_HE_Plane_CAS_01_F: BulletBase {
        tracerScale = 2.5;
    };
};
