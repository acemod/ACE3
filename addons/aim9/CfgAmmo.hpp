class CfgAmmo {
    class Missile_AA_04_F;
    class GVAR(m): Missile_AA_04_F {
        missileLockCone = 45;
        missileKeepLockedCone = 45;
        missileLockMaxDistance = 5000;
        missileLockMinDistance = 250;

        author = "Brandon (TCVM)";
        maneuvrability = 0;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 25;          // Minium flap deflection for guidance
            yawRate = 25;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "IR";
            seekerTypes[] = { "IR" };

            flareDistanceFilter = 100;
            flareAngleFilter = 2.0; // can filter out flares that are >= flareAngleFilter to known target velocity

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

    class ammo_Missile_BIM9X;
    class GVAR(x): ammo_Missile_BIM9X {
        missileLockCone = 120;
        missileKeepLockedCone = 120;
        missileLockMaxDistance = 5000;
        missileLockMinDistance = 250;

        author = "Brandon (TCVM)";
        maneuvrability = 0;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 40;          // Minium flap deflection for guidance
            yawRate = 40;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "IR";
            seekerTypes[] = { "IR" };

            flareDistanceFilter = 50;
            flareAngleFilter = 0.8; // can filter out flares that are >= flareAngleFilter to known target velocity

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            defaultNavigationType = "AugmentedProportionalNavigation";
            navigationTypes[] = { "AugmentedProportionalNavigation" };

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 120;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 0.95;         // seeker accuracy multiplier

            seekerMinRange = 75;
            seekerMaxRange = 5000;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR"};
        };
    };

    // AIM-132
    class M_Air_AA;
    class GVAR(aim132): M_Air_AA {
        missileLockCone = 120;
        missileKeepLockedCone = 120;
        missileLockMaxDistance = 8000;
        missileLockMinDistance = 250;

        author = "Brandon (TCVM)";
        maneuvrability = 0;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 40;          // Minium flap deflection for guidance
            yawRate = 40;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "IR";
            seekerTypes[] = { "IR" };

            flareDistanceFilter = 50;
            flareAngleFilter = 0.8; // can filter out flares that are >= flareAngleFilter to known target velocity

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            defaultNavigationType = "ZeroEffortMiss";
            navigationTypes[] = { "ZeroEffortMiss" };

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 120;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 0.98;         // seeker accuracy multiplier

            seekerMinRange = 75;
            seekerMaxRange = 8000;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR"};
        };
    };
};

