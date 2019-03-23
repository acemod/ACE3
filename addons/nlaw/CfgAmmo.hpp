class CfgAmmo {
    class M_NLAW_AT_F;
    class ACE_NLAW: M_NLAW_AT_F {
        hit = 400; // Default was 500
        indirectHit = 20; // Default was 15
        class ace_missileguidance {
            enabled = 1;

            minDeflection = 0.0005;      // Minium flap deflection for guidance
            maxDeflection = 0.01;       // Maximum flap deflection for guidance
            incDeflection = 0.0005;      // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = QGVAR(seeker);
            seekerTypes[] = {QGVAR(seeker)};

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = {"LOBL"};

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 45;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 0;
            seekerMaxRange = 10;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = QGVAR(directAttack);
            attackProfiles[] = {QGVAR(directAttack), QGVAR(overflyTopAttack)};
            useModeForAttackProfile = 1;
            showHintOnCycle = 1;

            // Run once at fired event
            onFired = QFUNC(onFired);
        };
    };

    // Sub ammos used in OTA mode (see fnc_seeker.sqf)
    class ACE_NLAW_Explosion: ACE_NLAW { // Based on FCS-Airburst, will explode right away
        timeToLive = 0;
        model = "\A3\weapons_f\empty";
    };
    class ACE_NLAW_ShapedCharge: ACE_NLAW { // Shaped charge from rocket explosion, no effects
        timeToLive = 1;
        model = "\A3\weapons_f\empty";
        hit = 750;
        indirectHit = 0;
        indirectHitRange = 0;
        explosionSoundEffect = "";
        explosionEffects = "";
        CraterEffects = "";
        muzzleEffect = "";
    };
};
