class CfgAmmo {
    class ammo_Missile_AMRAAM_C;
    class GVAR(c): ammo_Missile_AMRAAM_C {
        author = "Brandon (TCVM)";
        maneuvrability = 0;
        flightProfiles[] = {"Direct", "Loft"};
        class Direct {}; // dummy to allow for F cycling of missile mode
        class Loft {};
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 40;          // Minium flap deflection for guidance
            yawRate = 40;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "DopplerRadar";
            seekerTypes[] = { "DopplerRadar" };
            lockableTypes[] = {"Air"};

            minimumSpeedFilter = 25;    // filter out targets that have a closing velocity less than this
            minimumTimeFilter = 0.0001; // filter out targets that are this close to the ground (speed of light)
            maxTerrainCheck = 16000;    // How far we should check for terrain

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" };

            defaultNavigationType = "ZeroEffortMiss";
            navigationTypes[] = { "ZeroEffortMiss" };

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 50;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 75;
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR", "LOFT"};
            useModeForAttackProfile = 1;
        };
    };
    
    class ammo_Missile_AMRAAM_D;
    class GVAR(d): ammo_Missile_AMRAAM_D {
        author = "Brandon (TCVM)";
        maneuvrability = 0;
        flightProfiles[] = {"Direct", "TopDown"};
        class Direct {}; // dummy to allow for F cycling of missile mode
        class TopDown {};
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 50;          // Minium flap deflection for guidance
            yawRate = 50;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "DopplerRadar";
            seekerTypes[] = { "DopplerRadar" };
            lockableTypes[] = {"Air"};

            minimumSpeedFilter = 15;    // filter out targets that have a closing velocity less than this
            minimumTimeFilter = 0.00005; // filter out targets that are this close to the ground (speed of light)
            maxTerrainCheck = 16000;    // How far we should check for terrain

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" };

            defaultNavigationType = "ZeroEffortMiss";
            navigationTypes[] = { "ZeroEffortMiss" };

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 50;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 75;
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR", "LOFT"};
            useModeForAttackProfile = 1;
        };
    };
};

