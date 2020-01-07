class CfgAmmo {
    class BulletBase;
    class Gatling_30mm_DEBUG: BulletBase {
        hit = 70; // default: 180
        indirectHit = 12; // default: 4
        indirectHitRange = 4; // default: 3
        caliber = 1.4; // default: 5
        deflecting = 3; // default: 5
        fuseDistance = 3; // default: 10
        tracerStartTime = 0.02; // default: 0.1
        timeToLive = 40; // default: 6
        class ADDON {
            enabled = 1;

            minDeflection = 0.0005;      // Minium flap deflection for guidance
            maxDeflection = 0.0025;       // Maximum flap deflection for guidance
            incDeflection = 0.0005;      // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "SALH";
            seekerTypes[] = {"GPS", "SALH"};

            defaultSeekerLockMode = "LIN";
            seekerLockModes[] = {"LIN"};

            seekerAngle = 90;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 1;
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "LIN";
            attackProfiles[] = {"LIN"};
        };
    };
    
    class Sh_82mm_AMOS;
    class Sh_82mm_DEBUG: Sh_82mm_AMOS {
        class ADDON {
            enabled = 1;

            minDeflection = 0.0005;      // Minium flap deflection for guidance
            maxDeflection = 0.0025;       // Maximum flap deflection for guidance
            incDeflection = 0.0005;      // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};

            defaultSeekerLockMode = "LIN";
            seekerLockModes[] = {"LIN"};

            seekerAngle = 90;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 1;
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "INDIRECT";
            attackProfiles[] = {"INDIRECT"};
        };
    };

    class G_40mm_HE;
    class G_40mm_DEBUG: G_40mm_HE {
        class ADDON {
            enabled = 1;

            minDeflection = 0.0005;      // Minium flap deflection for guidance
            maxDeflection = 0.0025;       // Maximum flap deflection for guidance
            incDeflection = 0.0005;      // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};

            defaultSeekerLockMode = "LIN";
            seekerLockModes[] = {"LIN"};

            seekerAngle = 90;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 1;
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "INDIRECT";
            attackProfiles[] = {"INDIRECT"};
        };
    };
    
};

