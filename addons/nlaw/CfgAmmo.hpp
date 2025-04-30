class ace_missileguidance_type_Nlaw;
class CfgAmmo {

    // Base projectile without penetrator submunition, used in DA but not in OTA
    class M_NLAW_AT_F;
    class ACE_NLAW: M_NLAW_AT_F {
        hit = 150; // Vanilla: 50
        indirectHit = 15; // Vanilla: 25
        indirectHitRange = 2.4; // Vanilla: 2.4
        explosive = 0.67;
        submunitionAmmo = "";
        typicalSpeed = 180;
        warheadName = "HEAT";
        class ace_missileguidance: ace_missileguidance_type_Nlaw {
            enabled = 1;
        };
    };

    // Used in OTA - has the penetrator submunition
    class ACE_NLAW_ShapedCharge: ACE_NLAW {
        submunitionAmmo = "ACE_NLAW_Penetrator";
        submunitionInitialOffset[] = {0,0,-0.25};
    };

    class ammo_Penetrator_NLAW;
    class ACE_NLAW_Penetrator: ammo_Penetrator_NLAW { // Shaped charge from rocket explosion, no effects
        hit = 667; // Vanilla: 525
        // 500mm of RHA pen (manufacturer claim) - vanilla has 400mm of RHA pen (caliber 26.67)
        // formula: typicalSpeed * caliber * 15 / 1000 
        // -> 1000 * 33.333 * 15 / 1000 = ~500
        caliber = 33.333;
        warheadName = "HEAT";
    };
};
