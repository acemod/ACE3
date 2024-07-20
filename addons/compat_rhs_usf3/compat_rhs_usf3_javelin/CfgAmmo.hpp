class CfgAmmo {
    class MissileBase;
    class rhs_ammo_M_fgm148_AT: MissileBase {
        irLock = 1;
        laserLock = 0;
        airLock = 0;

        // Begin ACE guidance Configs
        class ace_missileguidance {
            enabled = 1;

            minDeflection = 0.00005;      // Minium flap deflection for guidance
            maxDeflection = 0.025;       // Maximum flap deflection for guidance
            incDeflection = 0.00005;      // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;

            // Guidance type for munitions
            defaultSeekerType = "Optic";
            seekerTypes[] = { "Optic" };

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            seekerAngle = 180;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 0;
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

            seekLastTargetPos = 1;      // seek last target position [if seeker loses LOS of target, continue to last known pos]

            // Attack profile type selection
            defaultAttackProfile = "JAV_TOP";
            attackProfiles[] = { "JAV_TOP", "JAV_DIR" };
            useModeForAttackProfile = 1;
        };
    };
};
