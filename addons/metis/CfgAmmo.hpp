class CfgAmmo {
    class M_Vorona_HEAT;
    class GVAR(HEAT): M_Vorona_HEAT {
        manualControl = 0;
        irLock = 0;
        laserLock = 0;
        airLock = 0;
        lockType = 0;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 50;          // Minium flap deflection for guidance
            yawRate = 50;     // Maximum flap deflection for guidance
            initialPitch = 2;

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            showTrail = 1;

            // Guidance type for munitions
            defaultSeekerType = "SACLOS";
            seekerTypes[] = { "SACLOS" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" };

            defaultNavigationType = "Line";
            navigationTypes[] = { "Line" };

            lineGainP = 30;
            lineGainD = 30;

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 15;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 80;
            seekerMaxRange = 2000;      // Range from the missile which the seeker can visually search

            correctionDistance = 3; // distance from center of crosshair where missile slows down
            offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

            // Attack profile type selection
            defaultAttackProfile = "WIRE";
            attackProfiles[] = {"WIRE"};
        };
    };

    class M_Vorona_HE;
    class GVAR(HE): M_Vorona_HE {
        manualControl = 0;
        irLock = 0;
        laserLock = 0;
        airLock = 0;
        lockType = 0;

        class ace_missileguidance {
            enabled = 1;

            pitchRate = 25;          // Minium flap deflection for guidance
            yawRate = 25;     // Maximum flap deflection for guidance

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "SACLOS";
            seekerTypes[] = { "SACLOS" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" };

            defaultNavigationType = "Line";
            navigationTypes[] = { "Line" };

            lineGainP = 21;
            lineGainD = 18;

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 15;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 80;
            seekerMaxRange = 2000;      // Range from the missile which the seeker can visually search

            correctionDistance = 1; // distance from center of crosshair where missile slows down
            offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

            // Attack profile type selection
            defaultAttackProfile = "WIRE";
            attackProfiles[] = {"WIRE"};
        };
    };
};
