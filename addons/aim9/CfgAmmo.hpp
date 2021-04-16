class CfgAmmo {
    class Missile_AA_04_F;
    class GVAR(m): Missile_AA_04_F {
        author = "Brandon (TCVM)";
        maneuvrability = 0;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 45;          // Minium flap deflection for guidance
            yawRate = 45;            // Maximum flap deflection for guidance

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
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR"};
        };
    };

    class ammo_Missile_BIM9X;
    class GVAR(x): ammo_Missile_BIM9X {
        author = "Brandon (TCVM)";
        maneuvrability = 0;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 65;          // Minium flap deflection for guidance
            yawRate = 65;            // Maximum flap deflection for guidance

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
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR"};
        };
    };
};

