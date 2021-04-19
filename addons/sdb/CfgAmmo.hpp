class CfgAmmo {
    class ammo_Bomb_SDB;
    class GVAR(sdb): ammo_Bomb_SDB {
        author = "Brandon (TCVM)";
        maneuvrability = 0; // no maneuvrability so that default guidance doesnt work
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 15;
            yawRate = 5;

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "GPS";
            seekerTypes[] = { "GPS" };

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            defaultNavigationType = "ZeroEffortMiss";
            navigationTypes[] = { "ZeroEffortMiss" };

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 60;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 5;
            seekerMaxRange = 4000;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "JDAM";
            attackProfiles[] = {"JDAM"};
        };
    };
};

