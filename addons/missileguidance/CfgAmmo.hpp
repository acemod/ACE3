class CfgAmmo {
    class MissileBase;

    class M_PG_AT : MissileBase {
        model = "\A3\Weapons_F\Ammo\Rocket_01_fly_F";
		proxyShape = "\A3\Weapons_F\Ammo\Rocket_01_F";
        
        irLock = 0;
		laserLock = 0;
		airLock = 0;
        manualControl = 1;
		weaponLockSystem = "2 + 16";
        
        hit = 600;
		indirectHit = 50;
		indirectHitRange = 4;

		maxSpeed = 720;
		maxControlRange = 5000;
		trackOversteer = 1;
		trackLead = 1;
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

        ACE_maxDeflection = 0.15;       // Maximum flap deflection for guidance
        ACE_minDeflection = 0.005;      // Minium flap deflection for guidance
        ACE_incDeflection = 0.005;      // The incrmeent in which deflection adjusts.
        
        ACE_seekerTypes[] = { "SALH" };   // {"SALH", "LIDAR", "BeamRide", "SARH", "Optic", "Thermal"};
        ACE_seekerAngle = 90;           // Angle in front of the missile which can be searched
        ACE_seekerAccuracy = 1;         // seeker accuracy multiplier
        ACE_seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search
        
        ACE_attackProfiles[] = { "LOAL-LIN", "LOAL-DIR", "LOAL-MID", "LOAL-HI" };
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