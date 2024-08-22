LOG("prep");
PREP(cycleAttackProfileKeyDown);

PREP(changeMissileDirection);

PREP(checkSeekerAngle);
PREP(checkLos);

PREP(dev_ProjectileCamera);

PREP(onFired);
PREP(onIncomingMissile);

PREP(guidancePFH);
PREP(doAttackProfile);
PREP(doSeekerSearch);

PREP(doHandoff);
PREP(handleHandoff);

//re-enable after feature merge - PREP(shouldFilterRadarHit);

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
//re-enable after feature merge - PREP(seekerType_Doppler);
PREP(seekerType_MWR);

// Attack Profiles OnFired
PREP(wire_onFired);

// Seeker OnFired
PREP(SACLOS_onFired);
PREP(mwr_onFired);

// Navigation OnFired
PREP(proNav_onFired);
PREP(line_onFired);

