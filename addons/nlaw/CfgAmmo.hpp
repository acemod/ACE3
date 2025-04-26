class ace_missileguidance_type_Nlaw;
class CfgAmmo {
    class M_NLAW_AT_F;
    class ACE_NLAW: M_NLAW_AT_F {
        hit = 95; // Vanilla: 50
        indirectHit = 15; // Vanilla: 25
        indirectHitRange = 2.4; // Vanilla: 2.4
        explosive = 0.67;
        submunitionAmmo = "ACE_NLAW_ShapedCharge";
        submunitionInitialOffset[] = {0,0,-0.25};
        typicalSpeed = 180;
        warheadName = "HEAT";
        class ace_missileguidance: ace_missileguidance_type_Nlaw {
            enabled = 1;
        };
    };


    class ammo_Penetrator_NLAW;
    class ACE_NLAW_ShapedCharge: ammo_Penetrator_NLAW { // Shaped charge from rocket explosion, no effects
        hit = 667; // Vanilla: 525
        // 500mm of RHA pen (manufacturer claim) - vanilla has 400mm of RHA pen (caliber 26.67)
        // formula: typicalSpeed * caliber * 15 / 1000 
        // -> 1000 * 33.333 * 15 / 1000 = ~500
        caliber = 33.333;
        warheadName = "HEAT";
    };
};
