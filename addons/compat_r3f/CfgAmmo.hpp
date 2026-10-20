class CfgAmmo {
    class BulletBase;
    class R3F_9x19_Ball: BulletBase { // https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L495
        airFriction = -0.00201185; // ACE3 value, default -0.001413
        ACE_caliber = 9.017;
        ACE_bulletLength = 15.494;
        ACE_bulletMass = 8.0352;
        ACE_ammoTempMuzzleVelocityShifts[] = {-2.655, -2.547, -2.285, -2.012, -1.698, -1.280, -0.764, -0.153, 0.596, 1.517, 2.619};
        ACE_ballisticCoefficients[] = {0.165};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {341, 371, 401}; // at 21°C, at 15°C 400 m/s according with the R3F_MP5A5 initSpeed
        ACE_barrelLengths[] = {101.6, 127, 225};
    };
    class R3F_556x45_Ball: BulletBase { // M855 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L117
        ACE_caliber = 5.69;
        ACE_bulletLength = 23.012;
        ACE_bulletMass = 4.0176;
        ACE_ammoTempMuzzleVelocityShifts[] = {-19.25, -18.49, -15.81, -13.05, -9.59, -5.15, 0, 6.33, 14.19, 23.43, 35.70};
        ACE_ballisticCoefficients[] = {0.151};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {723, 764, 796, 825, 843, 866, 878, 892, 906, 915, 922, 900};
        ACE_barrelLengths[] = {210.82, 238.76, 269.24, 299.72, 330.2, 360.68, 391.16, 419.1, 449.58, 480.06, 508.0, 609.6};
    };
    class R3F_762x51_Ball: BulletBase { // M80 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L280
        ACE_caliber = 7.82;
        ACE_bulletLength = 28.96;
        ACE_bulletMass = 9.46;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.2};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {700, 800, 820, 833, 845};
        ACE_barrelLengths[] = {254.0, 406.4, 508.0, 609.6, 660.4};
    };
    class R3F_762x51_Ball2: R3F_762x51_Ball { // M993 AP https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L351
        ACE_caliber = 7.82;
        ACE_bulletLength = 31.5;
        ACE_bulletMass = 8.23;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.359};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {850};
        ACE_barrelLengths[] = {650};
    };
    class R3F_762x51_Ball_SCAR: BulletBase { // M80 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L280
        ACE_caliber = 7.82;
        ACE_bulletLength = 28.96;
        ACE_bulletMass = 9.46;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.8, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {0.2};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {708, 808, 828, 841, 853}; // at 21°C, at 15°C 820 m/s according with the R3F SCAR-H initSpeed
        ACE_barrelLengths[] = {254.0, 406.4, 508.0, 609.6, 660.4};
    };
    class R3F_127x99_Ball: BulletBase { // PGM Hécate 2 M33 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L635
        ACE_caliber = 12.95;
        ACE_bulletLength = 58.67;
        ACE_bulletMass = 41.93;
        ACE_muzzleVelocityVariationSD = 0.35;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.670};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {780};
        ACE_barrelLengths[] = {700};
        EGVAR(vehicle_damage,incendiary) = 0.2;
    };
    class R3F_127x99_PEI: R3F_127x99_Ball {
        EGVAR(vehicle_damage,incendiary) = 1.0;
    };
    class R3F_127x99_Ball2: BulletBase { // BARRETT M107 M33 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L635
        airFriction = -0.000618; // ACE3 value, default -0.00086
        ACE_caliber = 12.95;
        ACE_bulletLength = 58.67;
        ACE_bulletMass = 41.93;
        ACE_muzzleVelocityVariationSD = 0.35;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.670};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {850};
        ACE_barrelLengths[] = {736.6};
        EGVAR(vehicle_damage,incendiary) = 0.2;
    };
    class R3F_127x99_PEI2: R3F_127x99_Ball2 {
        EGVAR(vehicle_damage,incendiary) = 1.0;
    };
    class R3F_127x99_Ball3: BulletBase { //  McMillan TAC-50 AMAX https://web.archive.org/web/20080527201619/http://mcmfamily.com/pdfs/Tac-50%20Technical%20Data.pdf
        typicalSpeed = 823; // R3F default value 820
        airFriction = -0.000388; // R3F default value -0.00086
        ACE_caliber = 12.98;
        ACE_bulletLength = 64.52;
        ACE_bulletMass = 48.6;
        ACE_muzzleVelocityVariationSD = 0.2;
        ACE_ammoTempMuzzleVelocityShifts[] = {-26.55, -25.47, -22.85, -20.12, -16.98, -12.8, -7.64, -1.53, 5.96, 15.17, 26.19};
        ACE_ballisticCoefficients[] = {1.05};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {831}; // at 21°C, at 15°C 823 m/s (2700 fps) according with the R3F_TAC50 initSpeed
        ACE_barrelLengths[] = {736.6};
        EGVAR(vehicle_damage,incendiary) = 0.2;
    };
};
