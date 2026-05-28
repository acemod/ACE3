class CfgAmmo {
    class SubmunitionBase;
    class ace_155mm_m712_launch: SubmunitionBase {
        model = "\A3\weapons_f\ammo\shell";
        hit = 1200;
        indirectHit = 200;
        indirectHitRange = 4;
        EGVAR(frag,force) = 1;
        EGVAR(frag,skip) = 0;
        EGVAR(frag,charge) = 9979;
        EGVAR(frag,metal) = 36000;
        EGVAR(frag,gurney_c) = 2700;
        EGVAR(frag,gurney_k) = 0.5;
        EGVAR(frag,classes)[] = {QEGVAR(frag,small), QEGVAR(frag,small_HD), QEGVAR(frag,medium), QEGVAR(frag,medium_HD), QEGVAR(frag,large_HD)};

        GVAR(artilleryDrag) = 1;
        GVAR(deployCondition) = QFUNC(copperhead_deployCondition);
        submunitionAmmo = "ace_155mm_m712_guidance";
        submunitionCount = 1;
        submunitionConeAngle = 0;
        triggerDistance = 0;
        muzzleEffect = "";
        airFriction = 0;

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
        model = "\A3\Weapons_F_beta\Launchers\titan\titan_missile_at_fly";
        hit = 1200;
        indirectHit = 200;
        indirectHitRange = 4;
        EGVAR(frag,skip) = 0;
        EGVAR(frag,charge) = 9979;
        EGVAR(frag,metal) = 36000;
        EGVAR(frag,gurney_c) = 2440;
        EGVAR(frag,gurney_k) = 1/2;
        EGVAR(frag,classes)[] = {QEGVAR(frag,large), QEGVAR(frag,large), QEGVAR(frag,large_HD), QEGVAR(frag,large), QEGVAR(frag,huge), QEGVAR(frag,huge_HD), QEGVAR(frag,huge)};

        maneuvrability = 0;
        airFriction = 0.01; // note: works differently from shellsim (v^3...)
        sideAirFriction = 0.1;

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
            pitchRate = 10; // replace minDeflection, maxDeflection, incDeflection
            yawRate = 10;
            stabilityCoefficient = 0.2; // helps make the shot follow velocity

            // Guidance type for munitions
            defaultSeekerType = "SALH";
            seekerTypes[] = { "SALH" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL" };

            defaultNavigationType = "Direct";
            navigationTypes[] = { "Direct" };

            seekerAngle = 70;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 0;
            seekerMaxRange = 3000;      // Range from the missile which the seeker can visually search

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]

            // Attack profile type selection
            defaultAttackProfile = "copperhead";
            attackProfiles[] = {"copperhead"};
            useModeForAttackProfile = 0;
            canVanillaLock = 0;
        };
    };

    class GVAR(pike_launch): SubmunitionBase {
        model = QPATHTOF(data\ace_pike_ammo.p3d);
        submunitionAmmo = QGVAR(pike_guidance);
        submunitionCount = 1;
        submunitionConeAngle = 0;
        triggerTime = 0.1;
        class Eventhandlers {
            fired = QUOTE(call FUNC(submunition_ammoFired));
        };
    };

    class MissileBase;
    class GVAR(pike_guidance): MissileBase {
        irLock = 0;
        laserLock = 0;
        airLock = 0;
        manualControl = 0;
        timeToLive = 22;

        model = QPATHTOF(data\ace_pike_ammo.p3d);
        maxSpeed = 150; // ~2km in 15sec
        thrust = 19;
        thrustTime = 14;
        initTime = 0;
        airFriction = 0.1;
        sideAirFriction = 0.1;

        hit = 120;
        indirectHit = 10;
        indirectHitRange = 10;
        warheadName = "HE";

        EGVAR(frag,force) = 1;
        EGVAR(frag,classes)[] = {QEGVAR(frag,tiny_HD)};
        EGVAR(frag,metal) = 200;
        EGVAR(frag,charge) = 270; // ~8x a normal 40mm
        EGVAR(frag,gurney_c) = 2700;
        EGVAR(frag,gurney_k) = 1/2;

        CraterEffects="ExploAmmoCrater";
        explosionEffects="ExploAmmoExplosion";
        effectsMissileInit = "";
        effectsMissile = "missile2";

        SoundSetExplosion[] = {"GrenadeHe_Exp_SoundSet", "GrenadeHe_Tail_SoundSet", "Explosion_Debris_SoundSet"};
        soundHit1[] = { "A3\Sounds_F\arsenal\explosives\Grenades\Explosion_gng_grenades_01", 3.1622777, 1, 1500};
        soundHit2[] = { "A3\Sounds_F\arsenal\explosives\Grenades\Explosion_gng_grenades_02", 3.1622777, 1, 1500};
        soundHit3[] = { "A3\Sounds_F\arsenal\explosives\Grenades\Explosion_gng_grenades_03", 3.1622777, 1, 1500};
        soundHit4[] = { "A3\Sounds_F\arsenal\explosives\Grenades\Explosion_gng_grenades_04", 3.1622777, 1, 1500};
        multiSoundHit[] = {"soundHit1", 0.25, "soundHit2", 0.25, "soundHit3", 0.25, "soundHit4", 0.25};
        whistleDist=16;

        // Begin ACE guidance Configs
        class ace_missileguidance {
            enabled = 2;

            pitchRate = 15;
            yawRate = 20;

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "SALH";
            seekerTypes[] = {"SALH"};

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = {"LOAL"};

            defaultNavigationType = "Direct";
            navigationTypes[] = { "Direct" };

            seekerAngle = 90;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 1;
            seekerMaxRange = 3000;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "LIN";
            attackProfiles[] = {"LIN"};
        };
    };
};
