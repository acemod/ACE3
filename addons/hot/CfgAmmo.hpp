class CfgAmmo {
    class M_Scalpel_AT;
    class ammo_Penetrator_Base;
    
    class GVAR(ammo_Penetrator_HOT1): ammo_Penetrator_Base {
        caliber = 60;
        warheadName = "HEAT";
        hit = 720;
    };
    
    class GVAR(ammo_Penetrator_HOT2): ammo_Penetrator_Base {
        caliber = 65;
        warheadName = "HEAT";
        hit = 900;
    };
    
    class GVAR(ammo_Penetrator_HOT3): ammo_Penetrator_Base {
        caliber = 80;
        warheadName = "TandemHEAT";
        hit = 1000;
    };
    
    class GVAR(HOT1): M_Scalpel_AT {
        model = "\A3\Weapons_F_Tank\Launchers\Vorona\Vorona_missile_heat_fly";
        proxyShape = "\A3\Weapons_F\Ammo\Missile_AT_03_F";
        submunitionAmmo = QGVAR(ammo_Penetrator_HOT1);
        submunitionDirectionType = "SubmunitionModelDirection";
        submunitionInitSpeed = 1000;
        submunitionParentSpeedCoef = 0;
        submunitionInitialOffset[] = { 0, 0, -0.2 };
        hit = 150;
        warheadName = "HEAT";
        indirectHit = 25;
        indirectHitRange = 3.5;
        explosive = 0.8;
        
        displayName = CSTRING(hot1_long);
        displayNameShort = CSTRING(hot1_short);
        description = CSTRING(missileType_Description);
        descriptionShort = CSTRING(missileType);


        effectsMissile = "missile2";

        irLock = 0;
        laserLock = 0;
        manualControl = 0;
        maxSpeed = 240;

        thrustTime = 17;
        thrust = 125;
        timeToLive = 40;
        initTime = 0.3;

        EGVAR(rearm,caliber) = 178;

        class ace_missileguidance {
            enabled = 1;

            minDeflection = 0;          // Minium flap deflection for guidance
            maxDeflection = 0.0015;      // Maximum flap deflection for guidance
            incDeflection = 0.0005;     // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "SACLOS";
            seekerTypes[] = { "SACLOS" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" };
            
            onFired = QFUNC(onFired);
            
            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 30;           // Angle in front of the missile which can be searched
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 75;
            seekerMaxRange = 4000;      // Range from the missile which the seeker can visually search
            
            correctionDistance = 15; // distance from center of crosshair where missile slows down
            offsetFromCrosshair[] = { 0, 0, 0.5 }; // where the missile wants to stay in relation to the center of the crosshair.
            
            // Attack profile type selection
            defaultAttackProfile = "WIRE";
            attackProfiles[] = {"WIRE"};
        };
    };
    
    class GVAR(HOT2): GVAR(HOT1) {
        submunitionAmmo = QGVAR(ammo_Penetrator_HOT2);
        displayName = CSTRING(hot2_long);
        displayNameShort = CSTRING(hot2_short);
        
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    
    class GVAR(HOT2MP): GVAR(HOT2) {
        submunitionAmmo = "";
        warheadName = "HE";
        hit = 200;
        indirectHit = 200;
        indirectHitRange = 12;
        explosionEffects = "BombExplosion";
        
        displayName = CSTRING(hot2mp_long);
        displayNameShort = CSTRING(hot2mp_short);
        description = CSTRING(missileType_Description_AP);
        
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    
    class GVAR(HOT3): GVAR(HOT2) {
        submunitionAmmo = QGVAR(ammo_Penetrator_HOT3);
        warheadName = "TandemHEAT";
        displayName = CSTRING(hot3_long);
        displayNameShort = CSTRING(hot3_short);
        
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            seekerMaxRange = 4300;
        };
    };
};

