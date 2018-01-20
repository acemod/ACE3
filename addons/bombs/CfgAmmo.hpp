class CfgAmmo {
    class LaserBombCore;
    class Bomb_04_F: LaserBombCore {
        laserLock = 0;
        class ADDON {
            enabled = 1;

            minDeflection = 0;      // Minium flap deflection for guidance
            maxDeflection = 0.0025;       // Maximum flap deflection for guidance
            incDeflection = 0.0005;      // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;

            // Guidance type for munitions
            defaultSeekerType = "SALH";
            seekerTypes[] = { "SALH" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL" };

            seekerAngle = 30;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 0;
            seekerMaxRange = 10000;      // Range from the missile which the seeker can visually search

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]

            // Attack profile type selection
            defaultAttackProfile = "Ballistic";
            attackProfiles[] = { "Ballistic", "DIR" };
        };
    };
};