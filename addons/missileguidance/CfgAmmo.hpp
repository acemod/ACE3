enum {
    ACE_LOBL = 1,
    ACE_LOAL = 2
};

class CfgAmmo {
    class MissileBase;
    
    class M_PG_AT : MissileBase {
        model = "\A3\Weapons_F\Ammo\Rocket_01_fly_F";
        proxyShape = "\A3\Weapons_F\Ammo\Rocket_01_F";

        irLock = 0;
        laserLock = 0;
        airLock = 0;
        weaponLockSystem = "2 + 16";

        maxSpeed = 720;
        maxControlRange = 5000;
        maneuvrability = 8;
        timeToLive = 60;
        simulationStep = 0.01;
        airFriction = 0.1;
        sideAirFriction = 0.16;
        initTime = 0.002;
        thrustTime = 1.07;
        thrust = 530;
        fuseDistance = 2;
        
        effectsMissileInit = "MissileDAR1";
        effectsMissile = "missile2";
        whistleDist = 4;
        muzzleEffect = "";

        // Turn off arma crosshair-guidance
        manualControl = 0;
        
        // ACE uses these values
        trackOversteer = 1;
        trackLead = 0;
       
        // Begin ACE guidance Configs
        class ADDON {
            enabled = 1;
            
            minDeflection = 0.00025;      // Minium flap deflection for guidance
            maxDeflection = 0.001;       // Maximum flap deflection for guidance
            incDeflection = 0.0005;      // The incrmeent in which deflection adjusts.
            
            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode
            
            // Guidance type for munitions
            defaultSeekerType = "SALH";
            seekerTypes[] = { "SALH", "LIDAR", "SARH", "Optic", "Thermal", "GPS", "SACLOS", "MCLOS" };  
           
            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" }; 
            
            seekerAngle = 90;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier
            
            seekerMinRange = 1;
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search
            
            // Attack profile type selection
            defaultAttackProfile = "LIN";
            attackProfiles[] = { "LIN", "DIR", "MID", "HI" };
        };
    };
    
    class ACE_Hydra70_DAGR : M_PG_AT {
        displayName = CSTRING(Hydra70_DAGR);
        displayNameShort = CSTRING(Hydra70_DAGR_Short);
        
        description = CSTRING(Hydra70_DAGR_Desc);
        descriptionShort = CSTRING(Hydra70_DAGR_Desc);
    };
    
    class ACE_Hellfire_AGM114K : ACE_Hydra70_DAGR {
        displayName = CSTRING(Hellfire_AGM114K);
        displayNameShort = CSTRING(Hellfire_AGM114K_Short);
        
        description = CSTRING(Hellfire_AGM114K_desc);
        descriptionShort = CSTRING(Hellfire_AGM114K_desc);
        
        // @TODO: placeholder model to at least make it look different
        model = "\A3\Weapons_F\Ammo\Missile_AT_03_fly_F";
        proxyShape = "\A3\Weapons_F\Ammo\Missile_AT_03_F";
        
        hit = 1400;
        indirectHit = 71;
        indirectHitRange = 4.5;
        effectsMissile = "missile2";
    };
    
    // Titan
    class M_Titan_AT : MissileBase {};

    class ACE_Javelin_FGM148: M_Titan_AT {
        irLock = 0;
        laserLock = 0;
        airLock = 0;

        // Turn off arma crosshair-guidance
        manualControl = 0;

        hit = 1400;         // default: 800
        indirectHit = 20;
        indirectHitRange = 2;
        // ACE uses these values
        //trackOversteer = 1;
        //trackLead = 0;

        initTime = 2;

        // Begin ACE guidance Configs
        class ADDON {
            enabled = 1;

            minDeflection = 0.00005;      // Minium flap deflection for guidance
            maxDeflection = 0.025;       // Maximum flap deflection for guidance
            incDeflection = 0.00005;      // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;

            // Guidance type for munitions
            defaultSeekerType = "Optic";
            seekerTypes[] = { "Optic" };

            defaultSeekerLockMode = "LOBL";
            seekerLockModes[] = { "LOBL" };

            seekerAngle = 180;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 0;
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search

            // Attack profile type selection
            defaultAttackProfile = "JAV_TOP";
            attackProfiles[] = { "JAV_TOP", "JAV_DIR" };
        };
    };
    class ACE_Javelin_FGM148_static: ACE_Javelin_FGM148 {
        //Take config changes from (M_Titan_AT_static: M_Titan_AT)
        initTime = 0.25;  //"How long (in seconds) the projectile waits before starting it's engine.", - but doesn't seem to do anything
        effectsMissileInit = "RocketBackEffectsStaticRPG";
        class ADDON: ADDON {
            enabled = 1;
        };
    };
};
