LOG("prep");
PREP(cycleAttackProfileKeyDown);

PREP(changeMissileDirection);

PREP(checkSeekerAngle);
PREP(checkLos);

PREP(dev_ProjectileCamera);

PREP(onFired);
PREP(onFiredGetArgs);
PREP(onIncomingMissile);

PREP(guidancePFH);
PREP(doAttackProfile);
PREP(doSeekerSearch);

PREP(doHandoff);
PREP(handleHandoff);

PREP(shouldFilterRadarHit);

PREP(MCLOS_buttonPressed);

// Attack Profiles
PREP(attackProfile_AIR);
PREP(attackProfile_DIR);
PREP(attackProfile_LIN);
PREP(attackProfile_LOFT);
PREP(attackProfile_WIRE);
PREP(attackProfile_BEAM);
//re-enable after feature merge - PREP(attackProfile_JDAM);

// Javelin profiles
PREP(attackProfile_JAV_DIR);
PREP(attackProfile_JAV_TOP);
PREP(javelin_midCourseTransition);

// Navigation Profiles
PREP(navigationType_zeroEffortMiss);
PREP(navigationType_augmentedProNav);
PREP(navigationType_proNav);
PREP(navigationType_lineOfSight);
PREP(navigationType_line);
PREP(navigationType_direct);

// Seeker search functions
PREP(seekerType_SALH);
PREP(seekerType_Optic);
PREP(seekerType_SACLOS);
PREP(seekerType_MCLOS);
PREP(seekerType_Doppler);
PREP(seekerType_MWR);
PREP(seekerType_IR);

// Attack Profiles OnFired
PREP(wire_onFired);

// Seeker OnFired
PREP(doppler_onFired);
PREP(SACLOS_onFired);
PREP(MCLOS_onFired);
PREP(mwr_onFired);
PREP(IR_onFired);

// Navigation OnFired
PREP(proNav_onFired);
PREP(line_onFired);

