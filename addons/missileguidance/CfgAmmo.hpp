class CfgAmmo {
    class MissileBase;

    class M_PG_AT : MissileBase {
        model = "\A3\Weapons_F\Ammo\Rocket_01_fly_F";
		proxyShape = "\A3\Weapons_F\Ammo\Rocket_01_F";
        
        irLock = 0;
		laserLock = 0;
		airLock = 0;
		weaponLockSystem = "2 + 16";
        
        hit = 600;
		indirectHit = 50;
		indirectHitRange = 4;

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
		fuseDistance = 5;
        
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
        class ACE_MissileGuidance {
            enabled = 1;
            
            minDeflection = 0.005;      // Minium flap deflection for guidance
            maxDeflection = 0.025;       // Maximum flap deflection for guidance
            incDeflection = 0.005;      // The incrmeent in which deflection adjusts.
            
            // Guidance type for munitions
            defaultSeekerType = "SALH";
            seekerTypes[] = { "SALH", "LIDAR", "SARH", "Optic", "Thermal", "GPS", "SACLOS", "MCLOS",  };   
            seekerAngle = 90;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier
            seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search
            
            // Attack profile type selection
            defaultAttackProfile = "LOAL-LIN";
            attackProfiles[] = { "LOBL-LIN", "LOBL-DIR", "LOBL-MID", "LOBL-HI", "LOBL-TOP-DOWN", "LOAL-LIN", "LOAL-DIR", "LOAL-MID", "LOAL-HI", "LOAL-TOP-DOWN"  };
        };
    };
    
    class ACE_Hydra70_DAGR : M_PG_AT {
        displayName = "ACE_Hydra70_DAGR";
		displayNameShort = "ACE_Hydra70_DAGR";
		descriptionShort = "ACE_Hydra70_DAGR";
    };
    
    class ACE_Hellfire_AGM114K : ACE_Hydra70_DAGR {
        displayName = "ACE_Hellfire_AGM114K";
		displayNameShort = "ACE_Hellfire_AGM114K";
		descriptionShort = "ACE_Hellfire_AGM114K";
        
        hit = 1400;
        indirectHit = 71;
		indirectHitRange = 4.5;
		effectsMissile = "missile2";
    };
};