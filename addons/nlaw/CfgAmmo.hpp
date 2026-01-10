class ace_missileguidance_type_Nlaw;
class CfgAmmo {
    class M_NLAW_AT_F;
    class ACE_NLAW: M_NLAW_AT_F {
        submunitionAmmo = "ACE_NLAW_Penetrator";
        triggerOnImpact = 0; // The shaped charge only points downwards, so don't fire it in DA mode
        maxSpeed = 200;
        typicalSpeed = 185;
        thrust = 400; // 400 * 0.5 == 200 - swift acceleration to expected speed
        thrustTime = 0.5;
        timeToLive = 5.6; // Time until self-destruction (1000 meters @ 200m/s when accounting for air friction)
        warheadName = "HEAT";
        class ace_missileguidance: ace_missileguidance_type_Nlaw {
            enabled = 1;
        };
    };

    class ammo_Penetrator_NLAW;
    class ACE_NLAW_Penetrator: ammo_Penetrator_NLAW {
        // 500mm of RHA pen (manufacturer claim) - vanilla has 400mm of RHA pen (caliber 26.67)
        // formula: typicalSpeed * caliber * 15 / 1000 
        // -> 1000 * 33.333 * 15 / 1000 = ~500
        caliber = 33.333;
        warheadName = "HEAT";
    };
};
