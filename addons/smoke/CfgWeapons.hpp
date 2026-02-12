class CfgWeapons {
    class H_HelmetB;
    class H_HelmetO_ViperSP_hex_F: H_HelmetB {
        GVAR(Eyes_Protection) = 1;
    };

    class H_PilotHelmetFighter_B: H_HelmetB {
        GVAR(Breathing_Protection) = 1;
        GVAR(Eyes_Protection) = 1;
    };

    class H_HelmetB_camo;
    class H_RacingHelmet_1_F: H_HelmetB_camo {
        GVAR(Breathing_Protection) = 0.3;
        GVAR(Eyes_Protection) = 0.7;
    };
};
