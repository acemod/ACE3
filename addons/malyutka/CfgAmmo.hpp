class CfgAmmo {
    class M_Scalpel_AT;
    class ammo_Penetrator_Base;

    class GVAR(9m14): M_Scalpel_AT {
        aiAmmoUsageFlags = 0;
        model = QPATHTOF(data\9m14.p3d);
        proxyShape = "\A3\Weapons_F\Ammo\Missile_AT_03_F";
        submunitionAmmo = QGVAR(9m14_penetrator);
        submunitionDirectionType = "SubmunitionModelDirection";
        submunitionInitSpeed = 1000;
        submunitionParentSpeedCoef = 0;
        submunitionInitialOffset[] = { 0, 0, -0.2 };
        hit = 150;
        warheadName = "HEAT";
        indirectHit = 25;
        indirectHitRange = 3.5;
        explosive = 0.8;

        //displayName = CSTRING(9m14_missile);
        //displayNameShort = CSTRING(9m14_missile);
        //description = CSTRING(9m14_missile_description);
        //descriptionShort = CSTRING(9m14_missile_descriptionShort);

        effectsMissile = "missile2";

        irLock = 0;
        laserLock = 0;
        manualControl = 0;
        maxSpeed = 100;

        thrustTime = 3;
        thrust = 125;
        timeToLive = 40;
        initTime = 0;

        EGVAR(rearm,caliber) = 178;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 5;          // Minium flap deflection for guidance
            yawRate = 5;            // Maximum flap deflection for guidance

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "MCLOS";
            seekerTypes[] = { "MCLOS" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL" };

            defaultNavigationType = "Line";
            navigationTypes[] = { "Line" };

            lineGainP = 1;
            lineGainD = 0;

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 30;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 0;
            seekerMaxRange = 3000;      // Range from the missile which the seeker can visually search

            correctionDistance = 0; // distance from center of crosshair where missile slows down
            offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

            // Attack profile type selection
            defaultAttackProfile = "WIRE";
            attackProfiles[] = {"WIRE"};
        };
    };
};

