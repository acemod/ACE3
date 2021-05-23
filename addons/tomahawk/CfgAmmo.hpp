class CfgAmmo {
    class ammo_Missile_Cruise_01;
    class ammo_Missile_Cruise_01_Cluster;

    class GVAR(c): ammo_Missile_Cruise_01 {
        maneuvrability = 0;
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 25;          // Minium flap deflection for guidance
            yawRate = 25;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "TERCOM";
            seekerTypes[] = { "TERCOM" };

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            defaultNavigationType = "Line";
            navigationTypes[] = { "Line" };

            lineGainP = 50;
            lineGainD = 50;

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

    class GVAR(d): ammo_Missile_Cruise_01_Cluster {
        maneuvrability = 0;
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 25;          // Minium flap deflection for guidance
            yawRate = 25;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "TERCOM";
            seekerTypes[] = { "TERCOM" };

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            defaultNavigationType = "Line";
            navigationTypes[] = { "Line" };

            lineGainP = 50;
            lineGainD = 50;

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

