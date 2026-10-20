class GVAR(type_Ataka) {
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

    lineGainP = 16;
    lineGainD = 10.44;

    initialPitch = 2;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 30;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 6000;      // Range from the missile which the seeker can visually search

    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "BEAM";
    attackProfiles[] = {"BEAM"};
};

class GVAR(type_Bastion) {
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

    lineGainP = 16;
    lineGainD = 10.44;

    initialPitch = 2;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 30;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 6000;      // Range from the missile which the seeker can visually search

    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "BEAM";
    attackProfiles[] = {"BEAM"};
};

class GVAR(type_Drakon) {
    enabled = 0;

    pitchRate = 25;          // Minium flap deflection for guidance
    yawRate = 25;            // Maximum flap deflection for guidance

    canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

    showTrail = 1;

    // Guidance type for munitions
    defaultSeekerType = "SACLOS";
    seekerTypes[] = { "SACLOS" };

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = { "LOAL", "LOBL" };

    defaultNavigationType = "Line";
    navigationTypes[] = { "Line" };

    lineGainP = 16;
    lineGainD = 9.5;

    initialPitch = 2;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 30;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 3300;      // Range from the missile which the seeker can visually search

    correctionDistance = 30; // distance from center of crosshair where missile slows down
    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "BEAM";
    attackProfiles[] = {"BEAM"};
};

class GVAR(type_Fagot) {
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

    lineGainP = 16;
    lineGainD = 10.44;

    initialPitch = 2;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 30;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 2000;      // Range from the missile which the seeker can visually search

    correctionDistance = 30; // distance from center of crosshair where missile slows down
    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "BEAM";
    attackProfiles[] = {"BEAM"};
};

class GVAR(type_Falanga) {
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
    seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

    correctionDistance = 0; // distance from center of crosshair where missile slows down
    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "WIRE";
    attackProfiles[] = {"WIRE"};
};

class GVAR(type_Fleyta) {
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
    seekerMaxRange = 3000;      // Range from the missile which the seeker can visually search

    correctionDistance = 0; // distance from center of crosshair where missile slows down
    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "WIRE";
    attackProfiles[] = {"WIRE"};
};

class GVAR(type_Igla) {
    enabled = 0;

    pitchRate = 30;          // Minium flap deflection for guidance
    yawRate = 43;            // Maximum flap deflection for guidance

    canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "IR";
    seekerTypes[] = { "IR" };

    flareDistanceFilter = 100;
    flareAngleFilter = 1.1; // can filter out flares that are >= flareAngleFilter to known target velocity

    defaultSeekerLockMode = "LOBL";
    seekerLockModes[] = { "LOBL" };

    defaultNavigationType = "AugmentedProportionalNavigation";
    navigationTypes[] = { "AugmentedProportionalNavigation" };

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 45;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 0.76;         // seeker accuracy multiplier

    seekerMinRange = 5;
    seekerMaxRange = 5200;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "DIR";
    attackProfiles[] = {"DIR"};
};

class GVAR(type_KAB) {
    enabled = 0;

    pitchRate = 8;
    yawRate = 8;

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

class GVAR(type_KH25) {
    enabled = 0;

    pitchRate = 20;
    yawRate = 20;

    canVanillaLock = 0;

    defaultSeekerType = "SALH";
    seekerTypes[] = {"SALH"};

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = {"LOAL"};

    defaultNavigationType = "AugmentedProportionalNavigation";
    navigationTypes[] = { "AugmentedProportionalNavigation" };

    seekLastTargetPos = 1;
    seekerAngle = 40;
    seekerAccuracy = 1;

    seekerMinRange = 1;
    seekerMaxRange = 10000;

    defaultAttackProfile = "maverick";
    attackProfiles[] = {"maverick"};
};

class GVAR(type_KH29) {
    enabled = 0;

    pitchRate = 20;
    yawRate = 20;

    canVanillaLock = 0;

    defaultSeekerType = "SALH";
    seekerTypes[] = {"SALH"};

    defaultSeekerLockMode = "LOAL";
    seekerLockModes[] = {"LOAL"};

    defaultNavigationType = "AugmentedProportionalNavigation";
    navigationTypes[] = { "AugmentedProportionalNavigation" };

    seekLastTargetPos = 1;
    seekerAngle = 40;
    seekerAccuracy = 1;

    seekerMinRange = 1;
    seekerMaxRange = 10000;

    defaultAttackProfile = "maverick";
    attackProfiles[] = {"maverick"};
};

class GVAR(type_Kobra) {
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

    lineGainP = 16;
    lineGainD = 9.5;

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

class GVAR(type_Konkurs) {
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

    lineGainP = 10;
    lineGainD = 8.5;

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

class GVAR(type_Kornet) {
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

    lineGainP = 16;
    lineGainD = 10.44;

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

class GVAR(type_Malyutka) {
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
    seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

    correctionDistance = 0; // distance from center of crosshair where missile slows down
    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "WIRE";
    attackProfiles[] = {"WIRE"};
};

class GVAR(type_Metis) {
    enabled = 0;

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

    lineGainP = 16;
    lineGainD = 10.44;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 15;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 80;
    seekerMaxRange = 1000;      // Range from the missile which the seeker can visually search

    correctionDistance = 3; // distance from center of crosshair where missile slows down
    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "WIRE";
    attackProfiles[] = {"WIRE"};
};

class GVAR(type_Molniya) {
    enabled = 0;

    pitchRate = 45;          // Minium flap deflection for guidance
    yawRate = 45;            // Maximum flap deflection for guidance

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
    seekerAngle = 40;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 0.85;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 5000;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "DIR";
    attackProfiles[] = {"DIR"};
};

class GVAR(type_R73) {
    enabled = 0;

    pitchRate = 35;          // Minium flap deflection for guidance
    yawRate = 35;            // Maximum flap deflection for guidance

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
    seekerAngle = 40;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 0.85;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 5000;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "DIR";
    attackProfiles[] = {"DIR"};
};

class GVAR(type_R74) {
    enabled = 1;

    pitchRate = 50;          // Minium flap deflection for guidance
    yawRate = 50;            // Maximum flap deflection for guidance

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
    seekerAngle = 75;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 0.95;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 8000;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "DIR";
    attackProfiles[] = {"DIR"};
};

class GVAR(type_R77) {
    enabled = 0;

    pitchRate = 40;          // Minium flap deflection for guidance
    yawRate = 40;            // Maximum flap deflection for guidance

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

class GVAR(type_Refleks) {
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

    lineGainP = 16;
    lineGainD = 10.44;

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

class GVAR(type_S400) {
    enabled = 0;

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

class GVAR(type_Shturm) {
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

    lineGainP = 16;
    lineGainD = 10.44;

    initialPitch = 2;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 30;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 4000;      // Range from the missile which the seeker can visually search

    offsetFromCrosshair[] = { 0, 0, 0 }; // where the missile wants to stay in relation to the center of the crosshair.

    // Attack profile type selection
    defaultAttackProfile = "BEAM";
    attackProfiles[] = {"BEAM"};
};

class GVAR(type_Strela) {
    enabled = 0;

    pitchRate = 30;          // Minium flap deflection for guidance
    yawRate = 30;            // Maximum flap deflection for guidance

    canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "IR";
    seekerTypes[] = { "IR" };

    flareDistanceFilter = 100;
    flareAngleFilter = 1.6; // can filter out flares that are >= flareAngleFilter to known target velocity

    defaultSeekerLockMode = "LOBL";
    seekerLockModes[] = { "LOBL" };

    defaultNavigationType = "ProportionalNavigation";
    navigationTypes[] = { "ProportionalNavigation" };

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 45;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 0.6;         // seeker accuracy multiplier

    seekerMinRange = 10;
    seekerMaxRange = 3700;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "DIR";
    attackProfiles[] = {"DIR"};
};

class GVAR(type_Vikhr) {
    enabled = 0;
    showTrail = 1;

    pitchRate = 60;          // Minium flap deflection for guidance
    yawRate = 60;            // Maximum flap deflection for guidance

    canVanillaLock = 1;          // Can this default vanilla lock? Only applicable to non-cadet mode

    // Guidance type for munitions
    defaultSeekerType = "SACLOS";
    seekerTypes[] = { "SACLOS" };

    defaultSeekerLockMode = "LOBL";
    seekerLockModes[] = { "LOBL" };

    defaultNavigationType = "Line";
    navigationTypes[] = { "Line" };

    lineGainP = 20;
    lineGainD = 16;
    correctionDistance = 5;

    seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
    seekerAngle = 15;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 1;         // seeker accuracy multiplier

    seekerMinRange = 30;
    seekerMaxRange = 12000;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "BEAM";
    attackProfiles[] = {"BEAM"};
};

class GVAR(type_Vympel) {
    enabled = 0;

    pitchRate = 35;          // Minium flap deflection for guidance
    yawRate = 35;            // Maximum flap deflection for guidance

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
    seekerAngle = 40;           // Angle from the shooter's view that can track the missile
    seekerAccuracy = 0.85;         // seeker accuracy multiplier

    seekerMinRange = 75;
    seekerMaxRange = 5000;      // Range from the missile which the seeker can visually search

    // Attack profile type selection
    defaultAttackProfile = "DIR";
    attackProfiles[] = {"DIR"};
};
