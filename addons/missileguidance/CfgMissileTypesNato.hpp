class GVAR(type_AMRAAM) {
    enabled = 0;

    pitchRate = 30;          // Minium flap deflection for guidance
    yawRate = 30;            // Maximum flap deflection for guidance

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

class GVAR(type_ASRAAM) {
    enabled = 0;

    pitchRate = 100;          // Minium flap deflection for guidance
    yawRate = 100;            // Maximum flap deflection for guidance

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

class GVAR(type_Dagr) {
    enabled = 0;

    pitchRate = 40; // degrees per second
    yawRate = 40;

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "SALH";
    seekerTypes[] = { "SALH" };

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = { "LOAL", "LOBL" };

    defaultNavigationType = "AugmentedProportionalNavigation";
    navigationTypes[] = { "AugmentedProportionalNavigation" };

    seekerAngle = 90;           // Angle in front of the missile which can be searched
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 1;
    seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "LIN";
    attackProfiles[] = { "LIN", "DIR", "MID", "HI" };
};

class GVAR(type_Dragon) {
    enabled = 0;

    pitchRate = 0;
    yawRate = 0;

    canVanillaLock = 0;

    // Guidance type for munitions
    defaultSeekerType = "SACLOS";
    seekerTypes[] = { "SACLOS" };

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = { "LOAL", "LOBL" };

    defaultNavigationType = "LineOfSight";
    navigationTypes[] = { "LineOfSight" };

    seekLastTargetPos = 0;
    seekerAngle = 30;
    seekerAccuracy = 1;

    seekerMinRange = 65;
    seekerMaxRange = 1000;

    correctionDistance = 30;
    missileLeadDistance = 0;
    offsetFromCrosshair[] = { 0, 0, 0 };

    serviceInterval = 0.33; // how many seconds between pops
    serviceCharges = 32; // how many charges are in this missile
    serviceChargeAcceleration = 6.5;
    dragonSpeed = 100; // meters per second

    defaultAttackProfile = "DRAGON";
    attackProfiles[] = {"DRAGON"};
};

class GVAR(type_ESSM) {
    enabled = 0;

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

class GVAR(type_Hellfire) {
    enabled = 0;

    pitchRate = 30; // degrees per second
    yawRate = 30;

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "SALH";
    seekerTypes[] = { "SALH" };

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = { "LOAL", "LOBL" };

    defaultNavigationType = "Direct";
    navigationTypes[] = { "Direct", "ZeroEffortMiss" };

    seekLastTargetPos = 1;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 70;           // Angle in front of the missile which can be searched
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 1;
    seekerMaxRange = 8000;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "hellfire";
    attackProfiles[] = {"hellfire", "hellfire_hi", "hellfire_lo"};

    class navigationStates {
        class initial {
            transitionCondition = QEFUNC(hellfire,midCourseTransition);
            navigationType = "Direct";
        };
        class terminal {
            transitionCondition = "";
            navigationType = "ZeroEffortMiss";
        };
        // transitions from initial -> termimal
        states[] = {"initial", "terminal"};
    };
};

class GVAR(type_Hot) {
    enabled = 0;

    pitchRate = 45;          // Minium flap deflection for guidance
    yawRate = 45;            // Maximum flap deflection for guidance

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    showTrail = 1;

    // Guidance type for munitions
    defaultSeekerType = "SACLOS";
    seekerTypes[] = { "SACLOS" };

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = { "LOAL", "LOBL" };

    defaultNavigationType = "Line";
    navigationTypes[] = { "Line" };

    lineGainP = 7;
    lineGainD = 6;

    initialPitch = 2;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 30;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 4000;      // Range from the missile which the seeker can visually search

    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "WIRE";
    attackProfiles[] = {"WIRE"};
};

class GVAR(type_Javelin) {
    enabled = 0;

    pitchRate = 120; // degrees per second
    yawRate = 120;
    stabilityCoefficient = 0.2;
    bangBangGuidance = 0;

    canVanillaLock = 0;

    // Guidance type for munitions
    defaultSeekerType = "Optic";
    seekerTypes[] = { "Optic" };

    defaultSeekerLockMode = "LOBL";
    seekerLockModes[] = { "LOBL" };

    defaultNavigationType = "Direct";
    navigationTypes[] = { "Direct", "ZeroEffortMiss" };

    navigationGain = 3;

    seekerAngle = 180;           // Angle in front of the missile which can be searched
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 0;
    seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

    seekLastTargetPos = 1;      // seek last target position [if seeker loses LOS of target, continue to last known pos]

    // Attack profile type selection
    defaultAttackProfile = "JAV_TOP";
    attackProfiles[] = { "JAV_TOP", "JAV_DIR" };
    useModeForAttackProfile = 1;

    class navigationStates {
        class initial {
            transitionCondition = QFUNC(javelin_midCourseTransition);
            navigationType = "Direct";
        };
        class terminal {
            transitionCondition = "";
            navigationType = "ZeroEffortMiss";
        };
        // transitions from initial -> termimal
        states[] = {"initial", "terminal"};
    };
};

class GVAR(type_Jdam) {
    enabled = 0;

    pitchRate = 15;
    yawRate = 20;

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "GPS";
    seekerTypes[] = { "GPS" };

    defaultSeekerLockMode = "LOBL";
    seekerLockModes[] = { "LOBL" };

    defaultNavigationType = "LINE";
    navigationTypes[] = { "LINE" };

    lineGainP = 50;
    lineGainD = 0;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 60;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 5;
    seekerMaxRange = 4000;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "JDAM";
    attackProfiles[] = {"JDAM"};
};

class GVAR(type_Maverick) {
    enabled = 0;

    pitchRate = 15;
    yawRate = 15;

    canVanillaLock = 1;

    defaultSeekerType = "Optic";
    seekerTypes[] = {"Optic"};

    defaultSeekerLockMode = "LOBL";
    seekerLockModes[] = {"LOBL"};

    defaultNavigationType = "AugmentedProportionalNavigation";
    navigationTypes[] = { "AugmentedProportionalNavigation" };

    seekLastTargetPos = 1;
    seekerAngle = 60;
    seekerAccuracy = 1;

    seekerMinRange = 1;
    seekerMaxRange = 14000;

    defaultAttackProfile = "maverick";
    attackProfiles[] = {"maverick"};
};

class GVAR(type_Milan) {
    enabled = 0;

    pitchRate = 60;          // Minium flap deflection for guidance
    yawRate = 60;            // Maximum flap deflection for guidance

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    showTrail = 0;

    // Guidance type for munitions
    defaultSeekerType = "SACLOS";
    seekerTypes[] = { "SACLOS" };

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = { "LOAL", "LOBL" };

    defaultNavigationType = "Line";
    navigationTypes[] = { "Line" };

    lineGainP = 25;
    lineGainD = 12;

    initialPitch = -0.4;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 5;           // Angle from the shooter's view that can track the missile, implemented
    seekerAccuracy = 1;         // seeker accuracy multiplier, not implemented?

    seekerMinRange = 100;
    seekerMaxRange = 2000;      // Range from the missile which the seeker can visually search

    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "WIRE";
    attackProfiles[] = {"WIRE"};
};

class GVAR(type_Nlaw) {
    enabled = 0;

    pitchRate = 5;      // Minium flap deflection for guidance
    yawRate = 10;      // Maximum flap deflection for guidance

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = QEGVAR(nlaw,seeker);
    seekerTypes[] = {QEGVAR(nlaw,seeker)};

    defaultSeekerLockMode = "LOBL";
    seekerLockModes[] = {"LOBL"};

    defaultNavigationType = QEGVAR(nlaw,PLOS);
    navigationTypes[] = { QEGVAR(nlaw,PLOS) };

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 45;           // Angle in front of the missile which can be searched
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 0;
    seekerMaxRange = 10;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = QEGVAR(nlaw,directAttack);
    attackProfiles[] = {QEGVAR(nlaw,directAttack), QEGVAR(nlaw,overflyTopAttack)};
    useModeForAttackProfile = 1;
    showHintOnCycle = 1;

    // Run once at fired event
    onFired = QEFUNC(nlaw,onFired);
};

class GVAR(type_Patriot) {
    enabled = 0;

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

class GVAR(type_Paveway) {
    enabled = 0;

    pitchRate = 5;
    yawRate = 5;

    bangBangGuidance = 1;
    stabilityCoefficient = 0.4; // how much this projectile likes to "weathervane" (keep direction toward velocity)

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "SALH";
    seekerTypes[] = { "SALH" };

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = { "LOAL" };

    defaultNavigationType = "Direct";
    navigationTypes[] = { "Direct" };

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 60;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 5;
    seekerMaxRange = 4000;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "DIR";
    attackProfiles[] = {"DIR"};
};

class GVAR(type_RAM) {
    enabled = 0;

    pitchRate = 50;          // Minium flap deflection for guidance
    yawRate = 50;            // Maximum flap deflection for guidance

    canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "IR";
    seekerTypes[] = { "IR" };

    flareDistanceFilter = 100;
    flareAngleFilter = 0.5; // can filter out flares that are >= flareAngleFilter to known target velocity

    defaultSeekerLockMode = "LOBL";
    seekerLockModes[] = { "LOBL" };

    defaultNavigationType = "ZeroEffortMiss";
    navigationTypes[] = { "ZeroEffortMiss" };

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 45;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 0.8;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 5000;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "DIR";
    attackProfiles[] = {"DIR"};
};

class GVAR(type_RBS70) {
    enabled = 0;

    pitchRate = 45;          // Minium flap deflection for guidance
    yawRate = 45;            // Maximum flap deflection for guidance

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    showTrail = 1;

    // Guidance type for munitions
    defaultSeekerType = "SACLOS";
    seekerTypes[] = { "SACLOS" };

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = { "LOAL", "LOBL" };

    defaultNavigationType = "Line";
    navigationTypes[] = { "Line" };

    lineGainP = 20;
    lineGainD = 16;

    initialPitch = 2;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 30;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 5000;      // Range from the missile which the seeker can visually search

    correctionDistance = 30; // distance from center of crosshair where missile slows down
    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "BEAM";
    attackProfiles[] = {"BEAM"};
};

class GVAR(type_Redeye) {
    enabled = 0;

    pitchRate = 40;          // Minium flap deflection for guidance
    yawRate = 40;            // Maximum flap deflection for guidance

    canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "IR";
    seekerTypes[] = { "IR" };

    flareDistanceFilter = 100;
    flareAngleFilter = 2.0; // can filter out flares that are >= flareAngleFilter to known target velocity

    defaultSeekerLockMode = "LOBL";
    seekerLockModes[] = { "LOBL" };

    defaultNavigationType = "LineOfSight";
    navigationTypes[] = { "LineOfSight" };
    navigationGain = 3;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 45;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 0.4;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 4500;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "DIR";
    attackProfiles[] = {"DIR"};
};

class GVAR(type_Sidewinder) {
    enabled = 0;

    pitchRate = 35;          // Minium flap deflection for guidance
    yawRate = 35;            // Maximum flap deflection for guidance

    canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "IR";
    seekerTypes[] = { "IR" };

    flareDistanceFilter = 100;
    flareAngleFilter = 1.6; // can filter out flares that are >= flareAngleFilter to known target velocity

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

class GVAR(type_Stinger) {
    enabled = 0;

    pitchRate = 42;          // Minium flap deflection for guidance
    yawRate = 42;            // Maximum flap deflection for guidance

    canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "IR";
    seekerTypes[] = { "IR" };

    flareDistanceFilter = 100;
    flareAngleFilter = 1.3; // can filter out flares that are >= flareAngleFilter to known target velocity

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

class GVAR(type_TOW) {
    enabled = 0;

    pitchRate = 45;          // Minium flap deflection for guidance
    yawRate = 45;            // Maximum flap deflection for guidance

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    showTrail = 1;

    // Guidance type for munitions
    defaultSeekerType = "SACLOS";
    seekerTypes[] = { "SACLOS" };

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = { "LOAL", "LOBL" };

    defaultNavigationType = "Line";
    navigationTypes[] = { "Line" };

    lineGainP = 20;
    lineGainD = 7;

    initialPitch = 2;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 30;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 65;
    seekerMaxRange = 3750;      // Range from the missile which the seeker can visually search

    correctionDistance = 30; // distance from center of crosshair where missile slows down
    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "WIRE";
    attackProfiles[] = {"WIRE"};
};
class GVAR(type_Blowpipe) {
    enabled = 0;

    pitchRate = 15;          // Minium flap deflection for guidance
    yawRate = 15;            // Maximum flap deflection for guidance

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    showTrail = 1;

    // Guidance type for munitions
    defaultSeekerType = "MCLOS";
    seekerTypes[] = { "MCLOS" };

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = { "LOAL" };

    defaultNavigationType = "Line";
    navigationTypes[] = { "Line" };

    lineGainP = 5;
    lineGainD = 0;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 30;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 0;
    seekerMaxRange = 3500;      // Range from the missile which the seeker can visually search

    correctionDistance = 0; // distance from center of crosshair where missile slows down
    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "BEAM";
    attackProfiles[] = {"BEAM"};
};
