class CfgAmmo {
    class ammo_Missile_rim116;
    class GVAR(rim116): ammo_Missile_rim116 {
        maneuvrability = 0;
        missileLockMaxSpeed = 2000;

        missileLockCone = 3; // caged lock
        missileKeepLockedCone = 45;
        missileLockMaxDistance = 5000;
        missileLockMinDistance = 250;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 30;          // Minium flap deflection for guidance
            yawRate = 30;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "IR";
            seekerTypes[] = { "IR" };

            flareDistanceFilter = 100;
            flareAngleFilter = 0.5; // can filter out flares that are >= flareAngleFilter to known target velocity

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            defaultNavigationType = "ZeroEffortMiss";
            navigationTypes[] = { "ZeroEffortMiss" };

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 45;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 0.8;         // seeker accuracy multiplier

            seekerMinRange = 75;
            seekerMaxRange = 5000;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR"};
        };
    };

    class M_70mm_SAAMI;
    class GVAR(stinger): M_70mm_SAAMI {
        maneuvrability = 0;
        missileLockMaxSpeed = 2000;

        missileLockCone = 3; // caged lock
        missileKeepLockedCone = 45;
        missileLockMaxDistance = 5000;
        missileLockMinDistance = 250;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 20;          // Minium flap deflection for guidance
            yawRate = 20;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "IR";
            seekerTypes[] = { "IR" };

            flareDistanceFilter = 100;
            flareAngleFilter = 1.3; // can filter out flares that are >= flareAngleFilter to known target velocity

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            defaultNavigationType = "AugmentedProportionalNavigation";
            navigationTypes[] = { "AugmentedProportionalNavigation" };

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 45;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 0.8;         // seeker accuracy multiplier

            seekerMinRange = 75;
            seekerMaxRange = 5000;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR"};
        };
    };
};

