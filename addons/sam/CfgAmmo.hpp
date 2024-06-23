class CfgAmmo {
    class ammo_Missile_mim145;
    class GVAR(patriot): ammo_Missile_mim145 {
        author = "Dani (TCVM)";
        maneuvrability = 0;
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 30;          // Minium flap deflection for guidance
            yawRate = 30;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "DopplerRadar";
            seekerTypes[] = { "DopplerRadar" };
            lockableTypes[] = {"Air"};

            minimumSpeedFilter = 10;    // filter out targets that have a closing velocity less than this
            minimumTimeFilter = 0.00001; // filter out targets that are this close to the ground (speed of light)
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
            attackProfiles[] = {"DIR"};
        };
    };

    class ammo_Missile_rim162;
    class GVAR(RIM162): ammo_Missile_rim162 {
        author = "Dani (TCVM)";
        maneuvrability = 0;
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 15;          // Minium flap deflection for guidance
            yawRate = 15;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "DopplerRadar";
            seekerTypes[] = { "DopplerRadar" };
            lockableTypes[] = {"Air"};

            minimumSpeedFilter = 20;    // filter out targets that have a closing velocity less than this
            minimumTimeFilter = 0.00001; // filter out targets that are this close to the ground (speed of light)
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
            attackProfiles[] = {"DIR"};
        };
    };

    class ammo_Missile_s750;
    class GVAR(s400): ammo_Missile_s750 {
        author = "Dani (TCVM)";
        maneuvrability = 0;
        class ace_missileguidance {
            enabled = 1;

            pitchRate = 25;          // Minium flap deflection for guidance
            yawRate = 25;            // Maximum flap deflection for guidance

            canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "DopplerRadar";
            seekerTypes[] = { "DopplerRadar" };
            lockableTypes[] = {"Air"};

            minimumSpeedFilter = 5;    // filter out targets that have a closing velocity less than this
            minimumTimeFilter = 0.000001; // filter out targets that are this close to the ground (speed of light)
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
            attackProfiles[] = {"DIR"};
        };
    };
};

