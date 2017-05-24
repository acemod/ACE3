class CfgAmmo {
    class M_PG_AT;

    class ACE_Hellfire_AGM114K: M_PG_AT {
        displayName = "AGM-114K";
        displayNameShort = "AGM-114K";
        description = "AGM-114K";
        descriptionShort = "AGM-114K";

        model = "\A3\Weapons_F\Ammo\Missile_AT_03_fly_F";
        proxyShape = "\A3\Weapons_F\Ammo\Missile_AT_03_F";

        hit = 1400;
        indirectHit = 71;
        indirectHitRange = 4.5;
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
            seekerMaxRange = 5000;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "hellfire";
            attackProfiles[] = {"hellfire", "hellfire_hi", "hellfire_lo"};
        };
    };
};
