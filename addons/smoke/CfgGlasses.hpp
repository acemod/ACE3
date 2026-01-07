class CfgGlasses {
    class None;

    class G_AirPurifyingRespirator_01_base_F: None {
        GVAR(Eyes_Protection) = 1;
        GVAR(Breathing_Protection) = 1;
    };

    class G_Balaclava_blk: None {
        GVAR(Breathing_Protection) = 0.2;
    };
    class G_Balaclava_combat: G_Balaclava_blk {
        GVAR(Eyes_Protection) = 1;
    };
    class G_Balaclava_lowprofile: G_Balaclava_blk {
        GVAR(Eyes_Protection) = 1;
    };

    class G_Combat: None {
        GVAR(Eyes_Protection) = 1;
    };
    class G_Lowprofile: None {
        GVAR(Eyes_Protection) = 1;
    };

    class G_RegulatorMask_base_F: None {
        GVAR(Eyes_Protection) = 1;
        GVAR(Breathing_Protection) = 1;
    };

    class G_Respirator_base_F: None {
        GVAR(Breathing_Protection) = 0.8;
    };

    class G_EyeProtectors_base_F: None {
        GVAR(Eyes_Protection) = 0.2;
    };

    class G_Balaclava_TI_blk_F: None {
        GVAR(Breathing_Protection) = 0.4;
    };
    class G_Balaclava_TI_G_blk_F: G_Balaclava_TI_blk_F {
        GVAR(Eyes_Protection) = 1;
    };
    class G_Balaclava_TI_tna_F;
    class G_Balaclava_TI_G_tna_F: G_Balaclava_TI_tna_F {
        GVAR(Eyes_Protection) = 1;
    };

    class G_Blindfold_01_base_F: None {
        GVAR(Eyes_Protection) = 0.6;
    };
};
