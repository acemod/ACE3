class cfgMagazines {
    class 8Rnd_82mm_Mo_shells;
    class ACE_1Rnd_82mm_Mo_HE: 8Rnd_82mm_Mo_shells {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_HE_displayName);
        displayNameShort = "";
        descriptionShort = CSTRING(magazine_descriptionShort);
        model = QPATHTOF(data\l16_ammo_he.p3d);
        picture = QPATHTOF(UI\w_l16_ammo_he_ca.paa);
        mass = 50;
    };
    class 8Rnd_82mm_Mo_Smoke_white;
    class ACE_1Rnd_82mm_Mo_Smoke: 8Rnd_82mm_Mo_Smoke_white {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_Smoke_displayName);
        displayNameShort = "";
        descriptionShort = CSTRING(magazine_descriptionShort);
        model = QPATHTOF(data\l16_ammo_smk_white.p3d);
        picture = QPATHTOF(UI\w_l16_ammo_smk_white_ca.paa);
        mass = 50;
    };
    class 8Rnd_82mm_Mo_Flare_white;
    class ACE_1Rnd_82mm_Mo_Illum: 8Rnd_82mm_Mo_Flare_white {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_Illum_displayName);
        displayNameShort = "";
        descriptionShort = CSTRING(magazine_descriptionShort);
        model = QPATHTOF(data\l16_ammo_illum.p3d);
        picture = QPATHTOF(UI\w_l16_ammo_illum_ca.paa);
        mass = 50;
    };
    class 8Rnd_82mm_Mo_guided;
    class ACE_1Rnd_82mm_Mo_HE_Guided: 8Rnd_82mm_Mo_guided {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_HE_Guided_displayName);
        displayNameShort = "";
        descriptionShort = CSTRING(magazine_descriptionShort);
        model = QPATHTOF(data\l16_ammo_he.p3d);
        picture = QPATHTOF(UI\w_l16_ammo_he_ca.paa);
        mass = 50;
    };
    class 8Rnd_82mm_Mo_LG;
    class ACE_1Rnd_82mm_Mo_HE_LaserGuided: 8Rnd_82mm_Mo_LG {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_HE_LaserGuided_displayName);
        displayNameShort = "";
        descriptionShort = CSTRING(magazine_descriptionShort);
        model = QPATHTOF(data\l16_ammo_he.p3d);
        picture = QPATHTOF(UI\w_l16_ammo_he_ca.paa);
        mass = 50;
    };
};
