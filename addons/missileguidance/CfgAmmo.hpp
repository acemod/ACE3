class CfgAmmo {
    class MissileBase;

    class M_PG_AT : MissileBase {
        irLock = 0;
        laserLock = 0;
        airLock = 0;
        manualControl = 0;
        timeToLive = 120;
        
        hit = 150;
		indirectHit = 40;
		indirectHitRange = 2.5;
		explosive = 0.1; // KE penetrators
		inittime = 0.05;
		thrust = 1900;
		thrusttime = 1;
		maxspeed = 1030;
		maneuvrability = 8;
		sideairfriction = 0.065;
        
        ACE_maxDeflection = 0.15;       // Maximum flap deflection for guidance
        ACE_minDeflection = 0.005;      // Minium flap deflection for guidance
        ACE_incDeflection = 0.005;      // The incrmeent in which deflection adjusts.
        
        ACE_seekerTypes = [ "SALH" ];   // {"SALH", "LIDAR", "BeamRide", "SARH", "Optic", "Thermal"};
        ACE_seekerAngle = 90;           // Angle in front of the missile which can be searched
        ACE_seekerAccuracy = 1;         // seeker accuracy multiplier
        ACE_seekerMaxRange = 2500;      // Range from the missile which the seeker can visually search
        
        ACE_attackProfiles = [ "LOAL-LIN", "LOAL-DIR", "LOAL-MID", "LOAL-HI"];
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