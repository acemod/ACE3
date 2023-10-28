class CfgAmmo {

    class SubmunitionBase;
    class ace_155mm_m712_launch: SubmunitionBase {
        model = "\A3\weapons_f\ammo\shell";
        hit = 1200;
        indirectHit = 200;
        indirectHitRange = 4;

        GVAR(deployCondition) = QFUNC(copperhead_deployCondition);
        submunitionAmmo = "ace_155mm_m712_guidance";
        submunitionCount = 1;
        submunitionConeAngle = 0;
        triggerDistance = 0;
        muzzleEffect = "";
        airFriction = 0;

        EGVAR(frag,skip) = 1; // don't frag because this is a scripted ammo
        class Eventhandlers {
            fired = QUOTE(call FUNC(submunition_ammoFired));
        };
        class CamShakeFire {
            power = 3.00922;
            duration = 1.8;
            frequency = 20;
            distance = 72.4431;
        };
        class CamShakePlayerFire {
            power = 0.01;
            duration = 0.1;
            frequency = 20;
            distance = 1;
        };
    };

    class ammo_Bomb_LaserGuidedBase;
    class ace_155mm_m712_guidance: ammo_Bomb_LaserGuidedBase {
        model = "\A3\Weapons_F_EPC\Ammo\Bomb_04_fly_F.p3d";
        hit = 1200;
        indirectHit = 200;
        indirectHitRange = 4;
        // todo frag

        maneuvrability = 12;
        airFriction = 0.04; // note: works differently from shell (v^3...) 
        sideAirFriction = 0.225;

        artilleryLock = 0; // would keep shell pointed towards velocity, but disables manuverability and airfric

        initTime = 0;
        thrustTime = 0;
        thrust = 0; // free fall

        manualControl = 0;
        flightProfiles[] = {};
        autoSeekTarget = 0;
        weaponLockSystem = 0;
        irLock = 0;
        laserLock = 0;
        airLock = 0;
        
        timeToLive = 200;

        class ace_missileguidance {
            enabled = 2;

            useVanillaDeflection = 1; // use missileTarget for deflection
            minDeflection = 0.002;      // Minium flap deflection for guidance
            maxDeflection = 0.002;       // Maximum flap deflection for guidance

            canVanillaLock = 0;

            // Guidance type for munitions
            defaultSeekerType = "SALH";
            seekerTypes[] = { "SALH" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL" };

            seekerAngle = 70;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 0;
            seekerMaxRange = 3000;      // Range from the missile which the seeker can visually search

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]

            // Attack profile type selection
            defaultAttackProfile = "copperhead";
            attackProfiles[] = {"copperhead"};
            useModeForAttackProfile = 0;
        };
    };

};
