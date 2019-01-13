class CfgAmmo {
    class ammo_Penetrator_Base;
    
    class GVAR(penetrator_super): ammo_Penetrator_Base {
        caliber = 60;
        warheadName = "HEAT";
        hit = 460;
    };
    
    class Rocket_03_AP_F;
    class GVAR(dragonBase): Rocket_03_AP_F {
        scope = 1;
        model = QPATHTOF(models\dragon.p3d);
        maxSpeed = 200;
        thrust = 300;
        initTime = 0.151;
        thrustTime = 0;
        sideAirFriction = 0.05;
        effectsMissile = "missile2";
        effectFlare = "";
        airFriction = 0.5;
        fuseDistance = 75;
        whistleDist = 2;
        
        indirectHit = 9;
        indirectHitRange = 1;
        explosive = 0.02;
        timeToLive = 60;
        cost = 4000;
        simulationStep = 0.005;
        maxControlRange = 1500;
        
        class ace_missileguidance {
            minDeflection = 0;
            maxDeflection = 0;
            incDeflection = 0;

            canVanillaLock = 0;

            // Guidance type for munitions
            defaultSeekerType = "SACLOS";
            seekerTypes[] = { "SACLOS" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" };

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
    };
    
    class GVAR(super) : GVAR(dragonBase) {
        scope = 1;
        aiAmmoUsageFlags = "128+512";
        hit = 460;
        indirectHit = 9;
        indirectHitRange = 1;
        explosive = 0.02;
        cost = 4000;
        
        submunitionAmmo = QGVAR(penetrator_super);
        submunitionDirectionType = "SubmunitionModelDirection";
        submunitionInitSpeed = 200;
        submunitionParentSpeedCoef = 0;
        submunitionInitialOffset[] = { 0, 0, -0.2 };

        class ace_missileguidance {
            enabled = 1;

            // Guidance type for munitions
            defaultSeekerType = "SACLOS";
            seekerTypes[] = { "SACLOS" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" };

            seekLastTargetPos = 0;
            seekerAngle = 30;
            seekerAccuracy = 1;

            seekerMinRange = 30;
            seekerMaxRange = 1500;

            correctionDistance = 30;
            missileLeadDistance = 0;
            
            serviceInterval = 0.33; // how many seconds between pops
            serviceCharges = 65// how many charges are in this missile
            serviceChargeAcceleration = 10;
            dragonSpeed = 200; // meters per second

            defaultAttackProfile = "DRAGON";
            attackProfiles[] = {"DRAGON"};
        };
    };
    
    class ShellBase;
    class ace_m47_dragon_serviceCharge : ShellBase {
        hit = 1;
        indirectHit = 2;
        indirectHitRange = 1;
        typicalSpeed = 100;
        explosive = 1;
        cost = 300;
        model = "\A3\Weapons_F\empty.p3d";
        airFriction = 0;
        timeToLive = 1;
        explosionTime = 0.001;
        soundFly[] = {"",1,1};
        soundEngine[] = {"",1,4};
        CraterEffects = "";
        explosionEffects = QGVAR(serviceExplosion);
        hitarmor[] = {"soundDefault1", 1};
        hitbuilding[] = {"soundDefault1", 1};
        hitconcrete[] = {"soundDefault1", 1};
        hitdefault[] = {"soundDefault1", 1};
        hitfoliage[] = {"soundDefault1", 1};
        hitglass[] = {"soundDefault1", 1};
        hitglassarmored[] = {"soundDefault1", 1};
        hitgroundhard[] = {"soundDefault1", 1};
        hitgroundsoft[] = {"soundDefault1", 1};
        hitiron[] = {"soundDefault1", 1};
        hitman[] = {"soundDefault1", 1};
        hitmetal[] = {"soundDefault1", 1};
        hitmetalplate[] = {"soundDefault1", 1};
        hitplastic[] = {"soundDefault1", 1};
        hitrubber[] = {"soundDefault1", 1};
        hitwood[] = {"soundDefault1", 1};
        sounddefault1[] = {QPATHTOF(sounds\service_charge.wss), 56.2341, 1, 1800};
        soundHit[] = {QPATHTOF(sounds\service_charge.wss),56.23413,1,1800};
        multiSoundHit[] = {"soundDefault1", 1};
    };
};

