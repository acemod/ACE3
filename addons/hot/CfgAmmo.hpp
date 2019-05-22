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
        aiAmmoUsageFlags = "128+512";
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

        displayName = CSTRING(hot1);
        displayNameShort = CSTRING(hot1);
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
            maxDeflection = 0.0030;     // Maximum flap deflection for guidance
            incDeflection = 0.0005;     // The incrmeent in which deflection adjusts.

            canVanillaLock = 0;          // Can this default vanilla lock? Only applicable to non-cadet mode

            // Guidance type for munitions
            defaultSeekerType = "SACLOS";
            seekerTypes[] = { "SACLOS" };

            defaultSeekerLockMode = "LOAL";
            seekerLockModes[] = { "LOAL", "LOBL" };

            seekLastTargetPos = 0;      // seek last target position [if seeker loses LOS of target, continue to last known pos]
            seekerAngle = 30;           // Angle from the shooter's view that can track the missile
            seekerAccuracy = 1;         // seeker accuracy multiplier

            seekerMinRange = 75;
            seekerMaxRange = 4000;      // Range from the missile which the seeker can visually search

            correctionDistance = 8; // distance from center of crosshair where missile slows down
            offsetFromCrosshair[] = { 0, 0, 0.5 }; // where the missile wants to stay in relation to the center of the crosshair.

            // Attack profile type selection
            defaultAttackProfile = "WIRE";
            attackProfiles[] = {"WIRE"};
        };
    };

    class GVAR(HOT2): GVAR(HOT1) {
        submunitionAmmo = QGVAR(ammo_Penetrator_HOT2);
        displayName = CSTRING(hot2);
        displayNameShort = CSTRING(hot2);

        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };

    class GVAR(HOT2MP): GVAR(HOT2) {
        aiAmmoUsageFlags = "64+128";
        submunitionAmmo = "";
        warheadName = "HE";
        allowAgainstInfantry = 1;
        hit = 200;
        indirectHit = 200;
        indirectHitRange = 5;
        explosionEffects = "BombExplosion";
        explosive = 0.7;

        EGVAR(frag,enabled) = 1;
        EGVAR(frag,metal) = 7100; // 1000 steel balls
        EGVAR(frag,charge) = 4100;
        EGVAR(frag,gurney_c) = 2700;
        EGVAR(frag,gurney_k) = 3/5;
        EGVAR(frag,classes)[] = {"ACE_frag_small"};

        displayName = CSTRING(hot2mp);
        displayNameShort = CSTRING(hot2mp);
        description = CSTRING(missileType_Description_AP);

        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };

    class GVAR(HOT3): GVAR(HOT2) {
        submunitionAmmo = QGVAR(ammo_Penetrator_HOT3);
        warheadName = "TandemHEAT";
        displayName = CSTRING(hot3);
        displayNameShort = CSTRING(hot3);

        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            seekerMaxRange = 4300;
        };
    };
};

