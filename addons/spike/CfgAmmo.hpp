class CfgAmmo {
    class MissileBase;
    class M_Titan_AT: MissileBase {};
    class GVAR(lr): M_Titan_AT {
        timeToLive = 120;

        manualControl = 0;
        initTime = 0.5;

        class ace_missileguidance {
            enabled = 1;
            
            pitchRate = 30;
            yawRate = 30;

            canVanillaLock = 0;

            defaultSeekerType = "SPIKE";
            seekerTypes[] = {"SPIKE"};
            
            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL" };

            defaultNavigationType = "SPIKE";
            navigationTypes[] = { "SPIKE", "ZeroEffortMiss" };

            seekLastTargetPos = 0;
            seekerAngle = 20;
            seekerAccuracy = 1;

            seekerMinRange = 50;
            seekerMaxRange = 2500;

            defaultAttackProfile = "DIR";
            attackProfiles[] = {"DIR"};
            useModeForAttackProfile = 0;

            onFired = QFUNC(onFired);

            class navigationStates {
                class initial {
                    transitionCondition = QFUNC(midCourseTransition);
                    navigationType = "SPIKE";
                };
                class terminal {
                    transitionCondition = "";
                    navigationType = "ZeroEffortMiss";
                };
                // transitions from initial -> termimal
                states[] = {"initial", "terminal"};
            };
            
            // TV Guided projectiles have extra data that is irrelevant to most missiles
            class camera {
                enabled = 1;
                switchOnFire = 1; // switch to the camera view immediately upon firing
                
                class gimbal {
                    enabled = 1;
                    
                    gimbalAngleX = 25; // how far left/right can this look in degrees
                    gimbalAngleY = 60; // how far up/down can this look in degrees
                    gimbalSpeedX = 20;  // how many fast we can look left and right
                    gimbalSpeedY = 20;  // how many fast we can look up and down
                    
                    fovGimbalSpeedModifiers[] = { 1, 0.1 }; // the modifier for gimbal speed when at the zoom level

                    gimbalInitOffsetX = 0;
                    gimbalInitOffsetY = -20;
                    
                    stabilizeWhenMoving = 1;
                    trackLockedPosition = 1;
                    designateWhenStationary = 0;    // designate when camera doenst have any inputs
                };

                fovLevels[] = { 0.2, 0.05 }; // levels of zoom this has
                initialFOV = 0.2;
                lerpFOV = 0;
                fovChangeTime = 1;
                
                alwaysDesignate = 0;            // always designate
                canStopDesignating = 0;
                
                enabledThermalTypes[] = { "white_hot_black_cold", "black_hot_white_cold" };
                initialThermalType = "white_hot_black_cold";
                
                class reticle {
                    titleRsc = "ACE_guidance_spike";
                    centerReticle = 242000;
                    controlsToDisappearOnLock[] = { 241000 };
                    controlsToAppearOnLock[] = { 243101, 243201, 243301 };
                    leftGate = 243200;
                    rightGate = 243300;
                    topGate = 0;
                    bottomGate = 243100;
                    uiNamespaceDialogVariable = "ACE_guidance_camera_reticle";
                    reticleMovesWithTrack = 1;
                };
            };
        };
    };
};

