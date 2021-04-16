LOG("prep");
PREP(cycleAttackProfileKeyDown);

PREP(changeMissileDirection);

PREP(checkSeekerAngle);
PREP(checkLos);

PREP(onFired);
PREP(onIncomingMissile);

PREP(guidancePFH);
PREP(doAttackProfile);
PREP(doSeekerSearch);

PREP(doHandoff);
PREP(handleHandoff);

PREP(shouldFilterRadarHit);

// Attack Profiles
PREP(attackProfile_AIR);
PREP(attackProfile_DIR);
PREP(attackProfile_LIN);
PREP(attackProfile_LOFT);
PREP(attackProfile_WIRE);
PREP(attackProfile_BEAM);

// Javelin profiles
PREP(attackProfile_JAV_DIR);
PREP(attackProfile_JAV_TOP);

// Navigation Profiles
PREP(navigationType_zeroEffortMiss);
PREP(navigationType_augmentedProNav);
PREP(navigationType_proNav);
PREP(navigationType_lineOfSight);

// Seeker search functions
PREP(seekerType_SALH);
PREP(seekerType_Optic);
PREP(seekerType_SACLOS);
PREP(seekerType_Doppler);
PREP(seekerType_MWR);
PREP(seekerType_IR);

// Attack Profiles OnFired
PREP(wire_onFired);

// Seeker OnFired
PREP(SACLOS_onFired);
PREP(doppler_onFired);
PREP(mwr_onFired);
PREP(IR_onFired);

// Navigation OnFired
PREP(proNav_onFired);

// State transitions
PREP(javelin_midCourseTransition);

