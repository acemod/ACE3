class CfgMagazines {
    // MILAN
    class gm_1Rnd_milan_heat_dm82;
    class GVAR(gm_1Rnd_milan_heat_dm82): gm_1Rnd_milan_heat_dm82 {
        displayName = SUBCSTRING(mag_Milan1_dm82_displayName);
        scope = 2;
        scopeArsenal = 2;
        type = 256;
        count = 1;
        model = "\gm\gm_weapons\gm_launchers\gm_milan\gm_1rnd_milan_heat_dm92.p3d";
        ACE_isBelt = 0;
        mass = 159;
    };

    class gm_1Rnd_milan_heat_dm92;
    class GVAR(gm_1Rnd_milan_heat_dm92): gm_1Rnd_milan_heat_dm92 {
        displayName = SUBCSTRING(mag_Milan2_dm92_displayName);
        scope = 2;
        scopeArsenal = 2;
        type = 256;
        count = 1;
        model = "\gm\gm_weapons\gm_launchers\gm_milan\gm_1rnd_milan_heat_dm92.p3d";
        ACE_isBelt = 0;
        mass = 168;
    };

    // Fagot
    class gm_1Rnd_fagot_heat_9m111;
    class GVAR(gm_1Rnd_fagot_heat_9m111): gm_1Rnd_fagot_heat_9m111 {
        displayName = SUBCSTRING(mag_9M111_displayName);
        scope = 2;
        scopeArsenal = 2;
        type = 256;
        picture = QPATHTOEF(csw,UI\StaticAT_Icon.paa);
        ACE_isBelt = 0;
        mass = 276;
    };

    // MG3
    class gm_120rnd_762x51mm_mg3_grn;
    class gm_120Rnd_762x51mm_b_t_DM21_mg3_grn: gm_120rnd_762x51mm_mg3_grn {
        ACE_isBelt = 0;
    };
    class gm_120Rnd_762x51mm_b_t_DM21A1_mg3_grn: gm_120rnd_762x51mm_mg3_grn {
        ACE_isBelt = 0;
    };
    class gm_120Rnd_762x51mm_b_t_DM21A2_mg3_grn: gm_120rnd_762x51mm_mg3_grn {
        ACE_isBelt = 0;
    };

    // Mortar Rounds
    class gm_1Rnd_120mm_he_of843;
    class GVAR(1Rnd_120mm_he_of843): gm_1Rnd_120mm_he_of843 {
        EGVAR(arsenal,hide) = -1;
        displayName = SUBCSTRING(mag_of843_displayName);
        mass = 362;
        model = "\gm\gm_weapons\gm_mortars\gm_2s12\gm_shell_120mm_he_of843";
        picture = QPATHTOEF(mk6mortar,UI\w_l16_ammo_he_ca.paa);
        scope = 2;
    };
    class gm_1Rnd_120mm_illum_s843;
    class GVAR(1Rnd_120mm_illum_s843): gm_1Rnd_120mm_illum_s843 {
        EGVAR(arsenal,hide) = -1;
        displayName = SUBCSTRING(mag_s843_displayName);
        mass = 362;
        model = "\gm\gm_weapons\gm_mortars\gm_2s12\gm_shell_120mm_illum_s843";
        picture = QPATHTOEF(mk6mortar,UI\w_l16_ammo_illum_ca.paa);
        scope = 2;
        type = 256;
    };
    class gm_1Rnd_120mm_smoke_d843;
    class GVAR(1Rnd_120mm_smoke_d843): gm_1Rnd_120mm_smoke_d843 {
        EGVAR(arsenal,hide) = -1;
        displayName = SUBCSTRING(mag_d843_displayName);
        mass = 362;
        model = "\gm\gm_weapons\gm_mortars\gm_2s12\gm_shell_120mm_smoke_d843";
        picture = QPATHTOEF(mk6mortar,UI\w_l16_ammo_smk_white_ca.paa);
        scope = 2;
        type = 256;
    };
    class gm_1Rnd_120mm_he_dm51;
    class GVAR(1Rnd_120mm_he_dm51): gm_1Rnd_120mm_he_dm51 {
        EGVAR(arsenal,hide) = -1;
        displayName = SUBCSTRING(mag_dm51_displayName);
        mass = 287;
        model = "\gm\gm_weapons\gm_mortars\gm_m120\gm_shell_120mm_he_dm51";
        picture = QPATHTOEF(mk6mortar,UI\w_l16_ammo_he_ca.paa);
        scope = 2;
        type = 256;
    };
    class gm_1Rnd_120mm_illum_dm26;
    class GVAR(1Rnd_120mm_illum_dm26): gm_1Rnd_120mm_illum_dm26 {
        EGVAR(arsenal,hide) = -1;
        displayName = SUBCSTRING(mag_dm26_displayName);
        mass = 287;
        model = "\gm\gm_weapons\gm_mortars\gm_m120\gm_shell_120mm_illum_dm26";
        picture = QPATHTOEF(mk6mortar,UI\w_l16_ammo_illum_ca.paa);
        scope = 2;
        type = 256;
    };
    class gm_1Rnd_120mm_smoke_dm25;
    class GVAR(1Rnd_120mm_smoke_dm25): gm_1Rnd_120mm_smoke_dm25 {
        EGVAR(arsenal,hide) = -1;
        displayName = SUBCSTRING(mag_dm25_displayName);
        mass = 287;
        model = "\gm\gm_weapons\gm_mortars\gm_m120\gm_shell_120mm_smoke_dm25";
        picture = QPATHTOEF(mk6mortar,UI\w_l16_ammo_smk_white_ca.paa);
        scope = 2;
        type = 256;
    };
};
