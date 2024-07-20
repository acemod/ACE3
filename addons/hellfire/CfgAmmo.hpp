class CfgAmmo {
    class M_Scalpel_AT;

    class ACE_Hellfire_AGM114K: M_Scalpel_AT {
        displayName = "AGM-114K";
        displayNameShort = "AGM-114K";
        description = "AGM-114K";
        descriptionShort = "AGM-114K";

        model = "\A3\Weapons_F\Ammo\Missile_AT_03_fly_F";
        proxyShape = "\A3\Weapons_F\Ammo\Missile_AT_03_F";

        effectsMissile = "missile2";

        irLock = 0;
        laserLock = 0;
        manualControl = 0;
        maxSpeed = 450;

        thrustTime = 2.5; // motor burn 2-3 sec
        thrust = 250;
        timeToLive = 40;

        EGVAR(rearm,caliber) = 178;

        class ace_missileguidance {
            enabled = 1;

            minDeflection = 0.0005;      // Minium flap deflection for guidance
            maxDeflection = 0.01;       // Maximum flap deflection for guidance
            incDeflection = 0.0005;      // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "SALH";
            seekerTypes[] = { "SALH", "LIDAR", "SARH", "Optic", "Thermal", "GPS", "SACLOS", "MCLOS" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" };

            seekLastTargetPos = 1;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 70;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 1;
            seekerMaxRange = 8000;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "hellfire";
            attackProfiles[] = {"hellfire", "hellfire_hi", "hellfire_lo"};
        };
    };
    class ACE_Hellfire_AGM114N: ACE_Hellfire_AGM114K {
        displayName = "AGM-114N";
        displayNameShort = "AGM-114N";
        description = "AGM-114N";
        descriptionShort = "AGM-114N";
        hit = 200;
        indirectHit = 200;
        indirectHitRange = 12;
        submunitionAmmo = "";
        explosionEffects = "BombExplosion";
        EGVAR(vehicle_damage,incendiary) = 0.3;
        class ace_missileguidance: ace_missileguidance {
            enabled = 1; // Missile Guidance must be explicitly enabled
        };
    };
    class ACE_Hellfire_AGM114L: ACE_Hellfire_AGM114K {
        displayName = "AGM-114L";
        displayNameShort = "AGM-114L";
        description = "AGM-114L";
        descriptionShort = "AGM-114L";
        class ace_missileguidance: ace_missileguidance {
            canVanillaLock = 1;
            enabled = 1; // Missile Guidance must be explicitly enabled
            seekLastTargetPos = 0;
            defaultSeekerType = "ARH";
            seekerTypes[] = { "ARH" };
            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            activeRadarEngageDistance = 1000;
            seekerMaxRange = 2000; // distance that the hellfire internal radar can scan
        };

        // Vanilla lock system vars
        weaponLockSystem = "8";
        airLock = 1;
        lockType = 0;
        maneuvrability = 0; // no maneuvrability so that default guidance doesnt work

        missileLockMaxDistance      = 8000;
        missileLockMinDistance      = 250;
        missileLockMaxSpeed         = 600;
        missileKeepLockedCone       = 70;

        flightProfiles[] = {};
        class Components {
            class SensorsManagerComponent {
                class Components {
                    class MillimeterWaveRadar {
                        componentType = "ActiveRadarSensorComponent";
                        class AirTarget {
                            minRange = 0;
                            maxRange = 8000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        class GroundTarget {
                            minRange = 0;
                            maxRange = 8000;
                            objectDistanceLimitCoef = -1;
                            viewDistanceLimitCoef = -1;
                        };
                        typeRecognitionDistance     = 4000;
                        angleRangeHorizontal        = 70;
                        angleRangeVertical          = 70;
                        groundNoiseDistanceCoef     = 0; // relevant to AA missiles - not really for this
                        maxGroundNoiseDistance      = 250;
                        minSpeedThreshold           = 0;
                        maxSpeedThreshold           = 600;
                        nightRangeCoef = 1;
                        maxFogSeeThrough = 0.8;
                    };
                };
            };
        };
    };
};
