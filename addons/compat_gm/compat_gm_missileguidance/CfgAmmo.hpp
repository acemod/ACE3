
#define ACE_MISSILE(MISSILE) class ace_missileguidance: EGVAR(missileguidance,DOUBLES(type,MISSILE)) { enabled = 1; }

class CfgAmmo {
    class gm_missile_saclos_base;
    // Bastion
    class gm_missile_bastion_base: gm_missile_saclos_base {
        maneuvrability = 0;
        ACE_MISSILE(Bastion);
    };
    class gm_missile_bastion_heat_9M117: gm_missile_bastion_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            pitchRate = 25;
            yawRate = 25;
            lineGainP = 6;
            lineGainD = 5;
            showTrail = 0;
        };
    };
    class gm_missile_bastion_heat_9M117M: gm_missile_bastion_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            pitchRate = 25;
            yawRate = 25;
            lineGainP = 6;
            lineGainD = 5;
            showTrail = 0;
        };
    };
    class gm_missile_bastion_heat_9M117M1: gm_missile_bastion_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            pitchRate = 25;
            yawRate = 25;
            lineGainP = 6;
            lineGainD = 5;
            showTrail = 0;
        };
    };
    // 9K111 missile
    class gm_missile_fagot_base: gm_missile_saclos_base {
        maneuvrability = 0;
        ACE_MISSILE(Fagot);
    };
    class gm_missile_fagot_heat_9m111: gm_missile_fagot_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            showTrail = 0;
            pitchRate = 25;
            yawRate = 25;
            lineGainP = 7;
            lineGainD = 4;
        };
    };
    // HOT missile
    class gm_missile_hot_base: gm_missile_saclos_base {
        maneuvrability = 0;
        ACE_MISSILE(Hot);
    };
    class gm_missile_hot_heat_dm72: gm_missile_hot_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            pitchRate = 40;
            yawRate = 40;
        };
    };
    class gm_missile_hot_heat_dm102: gm_missile_hot_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
        };
    };
    // Malyutka
    class gm_missile_maljutka_base: gm_missile_saclos_base {
        maneuvrability = 0;
        ACE_MISSILE(Malyutka);
    };
    class gm_missile_maljutka_heat_9m14: gm_missile_maljutka_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            showTrail = 1;
        };
    };
    class gm_missile_maljutka_heat_9m14m: gm_missile_maljutka_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 1;
            showTrail = 1;
        };
    };
    // Milan - problem with SCALOS aiming
    /* class gm_missile_milan_base: gm_missile_saclos_base {
        maneuvrability = 0;
        ACE_MISSILE(Milan);
    };
    class gm_missile_milan_heat_dm82: gm_missile_milan_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 0;
            initialPitch = 0.4;
        };
    };
    class gm_missile_milan_heat_dm92: gm_missile_milan_base {
        class ace_missileguidance: ace_missileguidance {
            enabled = 0;
            initialPitch = 0.4;
        };
    };*/
    // AA Missiles
    class gm_rocket_72mm_HE_9m32m_base;
    class gm_rocket_72mm_HE_9m32m: gm_rocket_72mm_HE_9m32m_base {
        maneuvrability = 0;
        ACE_MISSILE(Strela);
    };
    class gm_rocket_70mm_HE_m585_base;
    class gm_rocket_70mm_HE_m585: gm_rocket_70mm_HE_m585_base {
        ACE_MISSILE(Redeye);
    };
};
