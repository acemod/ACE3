//CfgAmmo.hpp

class CfgAmmo {
    class MissileBase;
    class ace_m47_dragon_base: MissileBase {
        model = QPATHTOF(models\dragon.p3d);
        irLock = 1;
        manualControl = 1;
        deflecting = 0;
        fuseDistance = 5;
        effectsMissile = "missile2";
        whistleDist = 2;
        
        hit = 360;
        indirectHit = 9;
        indirectHitRange = 1;
        cost = 4000;
        trackOversteer = 0.95;
        trackLead = 0.9;
        timeToLive = 20;
        maneuvrability = 10;
        simulationStep = 0.005;
        sideAirFriction = 0.05;
        maxControlRange = 1500;
        maxSpeed = 200;
        initTime = 0.151;
        thrustTime = 1.45;
        thrust = 300;
        scope = 2;
    };
    
    class Rocket_03_AP_F;
    class ace_missile_dragon : Rocket_03_AP_F {
        model = QPATHTOF(models\dragon.p3d);
        maxSpeed = 200;
        thrust = 300;
        initTime = 0.151;
        thrustTime = 0;
        sideAirFriction = 0.05;
        effectsMissile = "missile2";
        effectFlare = "";
        airFriction = 0.5;
        irLock = 1;
        manualControl = 1;
        deflecting = 0;
        fuseDistance = 5;
        whistleDist = 2;
        
        hit = 360;
        indirectHit = 9;
        indirectHitRange = 1;
        cost = 4000;
        trackOversteer = 0.95;
        trackLead = 0.9;
        timeToLive = 20;
        maneuvrability = 10;
        simulationStep = 0.005;
        maxControlRange = 1500;
        scope = 2;
        
        class ace_missileguidance {
            enabled = 1;

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
            seekerMaxRange = 1500;

            correctionDistance = 15;
            missileLeadDistance = 0;
            offsetFromCrosshair[] = { 0, 0, 0 };

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
        explosionEffects = "ace_m47_serviceExplosion";
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
        scope = 2;
    };
};