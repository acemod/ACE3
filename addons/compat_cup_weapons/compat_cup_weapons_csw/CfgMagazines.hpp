class CfgMagazines {
    class VehicleMagazine;
    class CUP_29Rnd_30mm_AGS30_M: VehicleMagazine {
        ace_isbelt = 1;
    };

    class CUP_compats_29Rnd_30mm_AGS30_M: CUP_29Rnd_30mm_AGS30_M {
        scope = 2;
        type = 256;
        count = 29;
        mass = 40;
        displayName = SUBCSTRING(mag_AGS30_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };

    class 200Rnd_40mm_G_belt;
    class CUP_48Rnd_40mm_MK19_M: 200Rnd_40mm_G_belt {
        ace_isbelt = 1;
    };

    class CUP_compats_48Rnd_40mm_MK19_M: CUP_29Rnd_30mm_AGS30_M {
        scope = 2;
        type = 256;
        count = 48;
        mass = 40;
        displayname = SUBCSTRING(mag_MK19_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };

    class CUP_6Rnd_TOW_HMMWV_M;
    class CUP_compats_TOW_M: CUP_6Rnd_TOW_HMMWV_M {
        scope = 2;
        type = 256;
        count = 1;
        mass = 200;
        displayname = SUBCSTRING(mag_TOW_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_ca.paa";
    };

    class CUP_6Rnd_TOW2_M;
    class CUP_compats_TOW2_M: CUP_6Rnd_TOW2_M {
        scope = 2;
        type = 256;
        count = 1;
        mass = 200;
        displayname = SUBCSTRING(mag_TOW2_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_beta\Launchers\titan\Data\UI\gear_titan_missile_at_ca.paa";
    };

    class CUP_16Rnd_PG9_AT_M;
    class CUP_compats_PG9_M: CUP_16Rnd_PG9_AT_M {
        displayName = SUBCSTRING(mag_PG9_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_ca.paa";
    };

    class CUP_16Rnd_OG9_HE_M;
    class CUP_compats_OG9_M: CUP_16Rnd_OG9_HE_M {
        displayName = SUBCSTRING(mag_OG9_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_ca.paa";
    };

    class ACE_1Rnd_82mm_Mo_HE;
    class CUP_compats_105mm_he: ACE_1Rnd_82mm_Mo_HE {
        displayName = SUBCSTRING(mag_M1HE_displayName);
        mass = 120;
    };
    class CUP_compats_105mm_smoke: CUP_compats_105mm_he {
        displayName = SUBCSTRING(mag_M84Smoke_displayName);
    };
    class CUP_compats_105mm_wp: CUP_compats_105mm_he {
        displayName = SUBCSTRING(mag_M60A2_displayName);
    };
    class CUP_compats_105mm_laser: CUP_compats_105mm_he {
        displayName = SUBCSTRING(mag_M67AT_displayName);
    };
    class CUP_compats_105mm_illum: CUP_compats_105mm_he {
        displayName = SUBCSTRING(mag_M314Illum_displayName);
    };
    class CUP_compats_122mm_he: CUP_compats_105mm_he {
        displayName = SUBCSTRING(mag_3OF56_displayName);
    };
    class CUP_compats_122mm_laser: CUP_compats_105mm_he {
        displayName = SUBCSTRING(mag_3OF69M_displayName);
    };
    class CUP_compats_122mm_wp: CUP_compats_105mm_he {
        displayName = SUBCSTRING(mag_122mmWP_displayName);
    };
    class CUP_compats_122mm_smoke: CUP_compats_105mm_he {
        displayName = SUBCSTRING(mag_122mmSmoke_displayName);
    };
    class CUP_compats_122mm_illum: CUP_compats_105mm_he {
        displayName = SUBCSTRING(mag_122mmIllum_displayName);
    };
    class CUP_compats_122mm_at: CUP_compats_105mm_he {
        displayName = SUBCSTRING(mag_122mmAT_displayName);
    };
};
