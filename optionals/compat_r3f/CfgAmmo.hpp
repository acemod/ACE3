class CfgAmmo {
    class Default;
    class BulletBase;
    class R3F_9x19_Ball: BulletBase { // https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L370
        hit = 6; // R3F default value 13, BI default value 5
        typicalSpeed = 350; // R3F config
        airFriction = -0.00201185; // ACE3 value, default -0.001413
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
    class R3F_556x45_Ball: BulletBase { // M855 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L9
        typicalSpeed = 930; // R3F config
        airFriction = -0.00130094; // ACE3 value, default -0.001625
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
    class R3F_762x51_Ball: BulletBase { // M80 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L155
        typicalSpeed = 820; // R3F config
        airFriction = -0.00103711; // ACE3 value, default -0.00095
        ACE_caliber = 7.823;
        ACE_bulletLength = 28.956;
        ACE_bulletMass = 9.4608;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.2};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 7;
        ACE_muzzleVelocities[] = {700, 800, 820, 833, 845};
        ACE_barrelLengths[] = {254.0, 406.4, 508.0, 609.6, 660.4};
    };
    class R3F_762x51_Ball2: R3F_762x51_Ball { // M993 AP https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L226
        typicalSpeed = 850; // R3F config
        airFriction = -0.00110718; // ACE3 value, default -0.00095
        ACE_caliber = 7.823;
        ACE_bulletLength = 31.496;
        ACE_bulletMass = 8.22946157;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.359};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ICAO";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {850};
        ACE_barrelLengths[] = {650};
    };
    class R3F_762x51_Minimi_Ball: R3F_762x51_Ball { // M80 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L155
        airFriction = -0.00103711; // ACE3 value, default -0.002000
    };
    class R3F_127x99_Ball: BulletBase { // M33 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L510
        typicalSpeed = 780; // R3F config
        airFriction = -0.00062115; // ACE3 value, default -0.00086
        ACE_caliber = 12.954;
        ACE_bulletLength = 58.674;
        ACE_bulletMass = 41.9256;
        ACE_muzzleVelocityVariationSD = 0.35;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.670};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {780};
        ACE_barrelLengths[] = {700};
    };
    class R3F_127x99_PEI: R3F_127x99_Ball { // M33 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L510
        typicalSpeed = 780; // R3F config
        airFriction = -0.00062115; // ACE3 value, default -0.00086
        ACE_caliber = 12.954;
        ACE_bulletLength = 58.674;
        ACE_bulletMass = 41.9256;
        ACE_muzzleVelocityVariationSD = 0.4;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.670};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {780};
        ACE_barrelLengths[] = {700};
    };
    class R3F_127x99_Ball2: BulletBase { // M33 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L510
        typicalSpeed = 850; // R3F config
        airFriction = -0.000601; // ACE3 value, default -0.00086
        ACE_caliber = 12.954;
        ACE_bulletLength = 58.674;
        ACE_bulletMass = 41.9256;
        ACE_muzzleVelocityVariationSD = 0.35;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.670};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {850};
        ACE_barrelLengths[] = {736.6};
    };
    class R3F_127x99_PEI2: R3F_127x99_Ball2 { // M33 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L510
        typicalSpeed = 850; // R3F config
        airFriction = -0.000601; // ACE3 value, default -0.00086
        ACE_caliber = 12.954;
        ACE_bulletLength = 58.674;
        ACE_bulletMass = 41.9256;
        ACE_muzzleVelocityVariationSD = 0.4;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.670};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {850};
        ACE_barrelLengths[] = {736.6};
    };
    class R3F_127x99_Ball3: BulletBase { // M33 https://github.com/acemod/ACE3/blob/master/addons/ballistics/CfgAmmo.hpp#L510
        typicalSpeed = 820; // R3F config
        airFriction = -0.00060964; // ACE3 value, default -0.00086
        ACE_caliber = 12.954;
        ACE_bulletLength = 58.674;
        ACE_bulletMass = 41.9256;
        ACE_muzzleVelocityVariationSD = 0.35;
        ACE_ammoTempMuzzleVelocityShifts[] = {-18.91, -17.83, -15.21, -12.48, -09.34, -05.16, 0, 6.11, 13.60, 22.81, 33.83};
        ACE_ballisticCoefficients[] = {0.670};
        ACE_velocityBoundaries[] = {};
        ACE_standardAtmosphere = "ASM";
        ACE_dragModel = 1;
        ACE_muzzleVelocities[] = {820};
        ACE_barrelLengths[] = {736.6};
    };
};
