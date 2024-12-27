class ace_missileguidance_type_Nlaw;
class CfgAmmo {
    class M_NLAW_AT_F;
    class ACE_NLAW: M_NLAW_AT_F {
        hit = 400; // Default was 500
        indirectHit = 20; // Default was 15
        class ace_missileguidance: ace_missileguidance_type_Nlaw {
            enabled = 1;
        };
    };

    // Sub ammos used in OTA mode (see fnc_seeker.sqf)
    class ACE_NLAW_Explosion: ACE_NLAW { // Based on FCS-Airburst, will explode right away
        timeToLive = 0;
        model = "\A3\weapons_f\empty";
    };
    class ACE_NLAW_ShapedCharge: ACE_NLAW { // Shaped charge from rocket explosion, no effects
        timeToLive = 1;
        model = "\A3\weapons_f\empty";
        hit = 750;
        indirectHit = 0;
        indirectHitRange = 0;
        explosionSoundEffect = "";
        explosionEffects = "";
        CraterEffects = "";
        muzzleEffect = "";
    };
};
