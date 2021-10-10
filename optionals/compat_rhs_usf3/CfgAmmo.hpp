class CfgAmmo {
    class BulletBase;
    class B_127x99_Ball;
    class rhsusf_ammo_127x99_M33_Ball: B_127x99_Ball { // B_127x99_Ball (ballistics/CfgAmmo.hpp)
        ACE_caliber = 12.954;
        ACE_bulletLength = 58.674;
        ACE_bulletMass = 41.9256;
        ACE_muzzleVelocityVariationSD=0.35;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.670};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {900};
        ACE_barrelLengths[] = {736.6};
    };
    class rhsusf_ammo_127x99_mk211: rhsusf_ammo_127x99_M33_Ball { // ACE_127x99_API (ballistics/CfgAmmo.hpp)
        ACE_caliber = 12.954;
        ACE_bulletLength = 58.674;
        ACE_bulletMass = 41.9904;
        ACE_muzzleVelocityVariationSD=0.4;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.670};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {900};
        ACE_barrelLengths[] = {736.6};
    };
    class B_762x54_Ball;
    class rhsusf_B_300winmag: B_762x54_Ball { // ACE_762x67_Ball_Mk248_Mod_1 (ballistics/CfgAmmo.hpp)
        ACE_caliber = 7.823;
        ACE_bulletLength = 37.821;
        ACE_bulletMass = 14.256;
        ACE_muzzleVelocityVariationSD=0.3;
        ACE_ammoTempMuzzleVelocityShifts[] = {-5.3, -5.1, -4.6, -4.2, -3.4, -2.6, -1.4, -0.3, 1.4, 3.0, 5.2};
        ACE_ballisticCoefficients[] = {0.310};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {847, 867, 877};
        ACE_barrelLengths[] = {508.0, 609.6, 660.4};
    };
    class B_556x45_Ball;
    class rhs_ammo_556x45_M855_Ball: B_556x45_Ball { // B_556x45_Ball (ballistics/CfgAmmo.hpp)
        ACE_caliber = 5.69;
        ACE_bulletLength = 23.012;
        ACE_bulletMass = 4.0176;
        ACE_ammoTempMuzzleVelocityShifts[] = {-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
        ACE_ballisticCoefficients[] = {0.151};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
        ACE_barrelLengths[] = {210.82, 238.76, 269.24, 299.72, 330.2, 360.68, 391.16, 419.1, 449.58, 480.06, 508.0, 609.6};
    };
    class rhs_ammo_556x45_M855A1_Ball: B_556x45_Ball { // B_556x45_Ball (ballistics/CfgAmmo.hpp)
        ACE_caliber = 5.69;
        ACE_bulletLength = 23.012;
        ACE_bulletMass = 4.0176;
        ACE_ammoTempMuzzleVelocityShifts[] = {-27.20, -26.44, -23.76, -21.00, -17.54, -13.10, -7.95, -1.62, 6.24, 15.48, 27.75};
        ACE_ballisticCoefficients[] = {0.151};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
        ACE_barrelLengths[] = {210.82, 238.76, 269.24, 299.72, 330.2, 360.68, 391.16, 419.1, 449.58, 480.06, 508.0, 609.6};
    };
    class rhs_ammo_556x45_M855A1_Ball_Red: rhs_ammo_556x45_M855A1_Ball {}; // B_556x45_Ball (ballistics/CfgAmmo.hpp)
    class rhs_ammo_556x45_M855A1_Ball_Green: rhs_ammo_556x45_M855A1_Ball_Red {}; // B_556x45_Ball (ballistics/CfgAmmo.hpp)
    class rhs_ammo_556x45_M855A1_Ball_Yellow: rhs_ammo_556x45_M855A1_Ball_Red {}; // B_556x45_Ball (ballistics/CfgAmmo.hpp)
    class rhs_ammo_556x45_M855A1_Ball_Orange: rhs_ammo_556x45_M855A1_Ball_Red {}; // B_556x45_Ball (ballistics/CfgAmmo.hpp)
    class rhs_ammo_556x45_Mk318_Ball: B_556x45_Ball { // ACE_556x45_Ball_Mk318 (ballistics/CfgAmmo.hpp)
        ACE_caliber = 5.69;
        ACE_bulletLength = 23.012;
        ACE_bulletMass = 4.0176;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.307};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {780, 886, 950};
        ACE_barrelLengths[] = {254.0, 393.7, 508.0};
    };
    class rhs_ammo_556x45_Mk262_Ball: B_556x45_Ball { // ACE_556x45_Ball_Mk262 (ballistics/CfgAmmo.hpp)
        ACE_caliber = 5.69;
        ACE_bulletLength = 23.012;
        ACE_bulletMass = 4.9896;
        ACE_muzzleVelocityVariationSD=0.4;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.361};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {624, 816, 832, 838};
        ACE_barrelLengths[] = {190.5, 368.3, 457.2, 508.0};
    };
    class rhs_ammo_762x51_M80_Ball: BulletBase { // B_762x51_Ball (ballistics/CfgAmmo.hpp)
        ACE_caliber = 7.823;
        ACE_bulletLength = 28.956;
        ACE_bulletMass = 9.4608;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.2};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {700, 800, 820, 833, 845};
        ACE_barrelLengths[] = {254.0, 406.4, 508.0, 609.6, 660.4};
    };
    class rhs_ammo_762x51_M61_AP: rhs_ammo_762x51_M80_Ball {}; // B_762x51_Ball (ballistics/CfgAmmo.hpp)
    class rhs_ammo_762x51_M62_tracer: rhs_ammo_762x51_M80_Ball {}; // B_762x51_Ball (ballistics/CfgAmmo.hpp)
    class rhs_ammo_762x51_M80A1EPR_Ball: rhs_ammo_762x51_M80_Ball {}; // B_762x51_Ball (ballistics/CfgAmmo.hpp)
    class rhs_ammo_762x51_M118_Special_Ball: rhs_ammo_762x51_M80_Ball { // ACE_762x51_Ball_M118LR (ballistics/CfgAmmo.hpp)
        ACE_caliber = 7.823;
        ACE_bulletLength = 31.496;
        ACE_bulletMass = 11.34;
        ACE_muzzleVelocityVariationSD=0.4;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.243};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {750, 780, 790, 794};
        ACE_barrelLengths[] = {406.4, 508.0, 609.6, 660.4};
    };
    class rhs_ammo_762x51_M993_Ball: rhs_ammo_762x51_M80_Ball { // ACE_762x51_Ball_M993_AP (ballistics/CfgAmmo.hpp)
        ACE_caliber = 7.823;
        ACE_bulletLength = 31.496;
        ACE_bulletMass = 8.22946157;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.80, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.359};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {875, 910, 930, 945};
        ACE_barrelLengths[] = {330.2, 406.4, 508.0, 609.6};
    };
    class rhs_ammo_46x30_FMJ: rhs_ammo_556x45_M855A1_Ball { // RUAG Ammotec: https://www.heckler-koch.com/en/products/military/submachine-guns/mp7a1/mp7a2/ammunition.html
        ACE_caliber = 4.65; // https://bobp.cip-bobp.org/uploads/tdcc/tab-i/4-6-x-30-en.pdf
        ACE_bulletLength = 21;
        ACE_bulletMass = 2.6;
        ACE_ammoTempMuzzleVelocityShifts[] = {-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[] = {0.089};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {621}; // at 21°C, 620 m/s at 15°C according with the 4.6x30 FMJ magazine initSpeed
        ACE_barrelLengths[] = {180};
        airFriction = -0.002635; // default RHS value -0.0027667
    };
    class rhs_ammo_46x30_JHP: rhs_ammo_46x30_FMJ { // RUAG Ammotec
        ACE_caliber = 4.65;
        ACE_bulletLength = 17.4;
        ACE_bulletMass = 2.0;
        ACE_ammoTempMuzzleVelocityShifts[] = {-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[] = {0.112};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {691}; // at 21°C, 690 m/s at 15°C according with the 4.6x30 JHP magazine initSpeed
        ACE_barrelLengths[] = {180};
        airFriction = -0.003723; // default RHS value -0.00348301
    };
    class rhs_ammo_46x30_AP: rhs_ammo_46x30_FMJ { // RUAG Ammotec
        ACE_caliber = 4.65;
        ACE_bulletLength = 20.3;
        ACE_bulletMass = 2.0;
        ACE_ammoTempMuzzleVelocityShifts[] = {-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[] = {0.141};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {681}; // at 21°C, 680 m/s at 15°C according with the 4.6x30 AP magazine initSpeed
        ACE_barrelLengths[] = {180};
        airFriction = -0.003045; // default RHS value -0.00266241
    };
    class rhs_ammo_45ACP_MHP: BulletBase { // B_45ACP_Ball (ballistics/CfgAmmo.hpp)
        ACE_caliber = 11.481;
        ACE_bulletLength = 17.272;
        ACE_bulletMass = 14.904;
        ACE_ammoTempMuzzleVelocityShifts[] = {-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[] = {0.195};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {230, 250, 285};
        ACE_barrelLengths[] = {101.6, 127.0, 228.6};
    };
    class rhs_ammo_9x19_FMJ: BulletBase { // ACE_9x19_Ball (ballistics/CfgAmmo.hpp)
        ACE_caliber = 9.017;
        ACE_bulletLength = 15.494;
        ACE_bulletMass = 8.0352;
        ACE_ammoTempMuzzleVelocityShifts[] = {-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[] = {0.165};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {340, 370, 400};
        ACE_barrelLengths[] = {101.6, 127.0, 228.6};
    };
    class rhs_ammo_9x19_JHP: BulletBase { // ACE_9x19_Ball (ballistics/CfgAmmo.hpp)
        ACE_caliber = 9.017;
        ACE_bulletLength = 15.494;
        ACE_bulletMass = 8.0352;
        ACE_ammoTempMuzzleVelocityShifts[] = {-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[] = {0.165};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {340, 370, 400};
        ACE_barrelLengths[] = {101.6, 127.0, 228.6};
    };

    class MissileBase;
    class rhs_ammo_M_fgm148_AT: MissileBase {
        irLock = 1;
        laserLock = 0;
        airLock = 0;

        // Begin ACE guidance Configs
        class ace_missileguidance {
            enabled = 1;

            minDeflection = 0.00005;      // Minium flap deflection for guidance
            maxDeflection = 0.025;       // Maximum flap deflection for guidance
            incDeflection = 0.00005;      // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;

            // Guidance type for munitions
            defaultSeekerType = "Optic";
            seekerTypes[] = { "Optic" };

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            seekerAngle = 180;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 0;
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

            seekLastTargetPos = 1;      // seek last target position [if seeker loses LOS of target, continue to last known pos]

            // Attack profile type selection
            defaultAttackProfile = "JAV_TOP";
            attackProfiles[] = { "JAV_TOP", "JAV_DIR" };
            useModeForAttackProfile = 1;
        };
    };

    class GrenadeHand;
    class rhs_ammo_mk3a2: GrenadeHand {
        ace_frag_enabled = 0;
        ace_frag_skip = 1;
        ace_frag_force = 0;
    };
    class rhs_ammo_m84: GrenadeHand {
        ace_frag_enabled = 0;
        ace_frag_skip = 1;
        ace_frag_force = 0;
    };
    class rhs_ammo_m7a3_cs: GrenadeHand {
        ace_frag_enabled = 0;
        ace_frag_skip = 1;
        ace_frag_force = 0;
    };
    class GrenadeHand_stone;
    class rhs_ammo_m69: GrenadeHand_stone {
        ace_frag_enabled = 0;
        ace_frag_skip = 1;
        ace_frag_force = 0;
    };
    class rhs_ammo_m67: GrenadeHand {
        ace_frag_enabled = 1;
        ace_frag_metal = 213;
        ace_frag_charge = 185;
        ace_frag_gurney_c = 2700;
        ace_frag_gurney_k = "3/5";
        ace_frag_classes[] = {"ACE_frag_medium_HD"};
        ace_frag_skip = 0;
        ace_frag_force = 1;
    };
    class RocketBase;
    class rhs_ammo_M136_rocket: RocketBase {};
    class rhs_ammo_M136_hedp_rocket: rhs_ammo_M136_rocket {
        ace_frag_enabled = 1;
        ace_frag_metal = 330;
        ace_frag_charge = 280;
        ace_frag_gurney_c = 2800;
        ace_frag_gurney_k = "3/5";
        ace_frag_classes[] = {"ACE_frag_medium_HD"};
        ace_frag_skip = 0;
        ace_frag_force = 1;
    };
    class rhs_ammo_smaw_SR: RocketBase {
        ACE_caliber = 9;
    };

    // ACE Explosives
    class PipeBombBase;
    class rhsusf_m112_ammo: PipeBombBase {
        ace_explosives_defuseObjectPosition[] = {0.055, 0, 0.038};
    };

    class rhsusf_m112x4_ammo: PipeBombBase {
        ace_explosives_defuseObjectPosition[] = {0.055, -0.025, 0.102};
    };

    class MineBase;
    class rhsusf_mine_m19_ammo: MineBase {
        ace_explosives_defuseObjectPosition[] = {0, 0.02, 0.046};
    };

    class rhsusf_mine_m14_ammo: MineBase {
        ace_explosives_defuseObjectPosition[] = {-0.02, -0.015, 0.02};
    };

    class APERSMine_Range_Ammo;
    class rhsusf_mine_m49a1_3m_ammo: APERSMine_Range_Ammo {
        ace_explosives_defuseObjectPosition[] = {0, 0.016, 0.296};
    };
};
