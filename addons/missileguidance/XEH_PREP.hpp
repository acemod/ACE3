LOG("prep");
PREP(cycleAttackProfileKeyDown);
PREP(keybind_add);
PREP(keybind_pressed);

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
PREP(MCLOS_mouseInput);

// Attack Profiles
PREP(attackProfile_AIR);
PREP(attackProfile_DIR);
PREP(attackProfile_LIN);
PREP(attackProfile_LOFT);
PREP(attackProfile_WIRE);
PREP(attackProfile_BEAM);
PREP(attackProfile_JDAM);

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
PREP(seekerType_GPS);
PREP(seekerType_IR);

// Attack Profiles OnFired
PREP(wire_onFired);
PREP(gps_attackOnFired);

// Seeker OnFired
PREP(doppler_onFired);
PREP(SACLOS_onFired);
PREP(MCLOS_onFired);
PREP(mwr_onFired);
PREP(gps_seekerOnFired);
PREP(IR_onFired);

// Navigation OnFired
PREP(proNav_onFired);
PREP(line_onFired);

// GPS ui
PREP(gps_onLoad);
PREP(gps_onUnload);
PREP(gps_pbModeCycle);
PREP(gps_confirm);
PREP(gps_modeSelect);
PREP(gps_saveAttackSettings);
PREP(gps_loadAttackSettings);
PREP(gps_getAttackData);
PREP(gps_setupVehicle);

