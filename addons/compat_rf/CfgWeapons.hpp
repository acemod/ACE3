class CfgWeapons {
    // Ballistics
    class Pistol_Base_F;
    class hgun_Glock19_RF: Pistol_Base_F {
        ace_barrelTwist = 254;
        ace_barrelLength = 102;
        ace_twistDirection = 1;
    };

    class hgun_DEagle_RF: Pistol_Base_F {
        ace_barrelTwist = 482;
        ace_barrelLength = 127;
        ace_twistDirection = 1;
    };

    class Rifle_Long_Base_F;
    class srifle_h6_base_rf: Rifle_Long_Base_F {
        ace_barrelTwist = 228.6;
        ace_barrelLength = 460;
        ace_twistDirection = 1;
    };

    class Rifle_Base_F;
    class arifle_ash12_base_RF: Rifle_Base_F {
        ace_barrelTwist = 228.6;
        ace_barrelLength = 400;
        ace_twistDirection = 1;
    };

    class arifle_ash12_LR_base_RF: arifle_ash12_base_RF {
        ace_barrelLength = 450;
    };

    // Hearing
    class H_HelmetIA;
    class H_HelmetIA_sb_arid_RF: H_HelmetIA {
        ace_hearing_protection = 0.75;
    };
    class H_HelmetIA_sb_digital_RF: H_HelmetIA {
        ace_hearing_protection = 0.75;
    };
};
