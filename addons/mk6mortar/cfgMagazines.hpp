class cfgMagazines {
    class 8Rnd_82mm_Mo_shells;
    class ACE_1Rnd_82mm_Mo_HE: 8Rnd_82mm_Mo_shells {
        count = 1;
        displayName = CSTRING(magazine_HE_displayName);
        // Infantry-carry stuff here
    };
    class 8Rnd_82mm_Mo_Smoke_white;
    class ACE_1Rnd_82mm_Mo_Smoke: 8Rnd_82mm_Mo_Smoke_white {
        count = 1;
        displayName = CSTRING(magazine_Smoke_displayName);

    };
    class 8Rnd_82mm_Mo_Flare_white;
    class ACE_1Rnd_82mm_Mo_Illum: 8Rnd_82mm_Mo_Flare_white {
        count = 1;
        displayName = CSTRING(magazine_Illum_displayName);

    };
    class 8Rnd_82mm_Mo_guided;
    class ACE_1Rnd_82mm_Mo_HE_Guided: 8Rnd_82mm_Mo_guided {
        count = 1;
        displayName = CSTRING(magazine_HE_Guided_displayName);

    };
    class 8Rnd_82mm_Mo_LG;
    class ACE_1Rnd_82mm_Mo_HE_LaserGuided: 8Rnd_82mm_Mo_LG {
        count = 1;
        displayName = CSTRING(magazine_HE_LaserGuided_displayName);

    };
};
