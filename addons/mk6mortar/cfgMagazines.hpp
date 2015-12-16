 // Artificially low for testing
#DEFINE __MASS = 10

class cfgMagazines {
    class 8Rnd_82mm_Mo_shells;
    class ACE_1Rnd_82mm_Mo_HE: 8Rnd_82mm_Mo_shells {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_HE_displayName);
        descriptionShort = CSTRING(magazine_HE_descriptionShort);
        model = "";
        picture = "";
        mass = __MASS;
    };
    class 8Rnd_82mm_Mo_Smoke_white;
    class ACE_1Rnd_82mm_Mo_Smoke: 8Rnd_82mm_Mo_Smoke_white {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_Smoke_displayName);
        descriptionShort = CSTRING(magazine_Smoke_descriptionShort);
        model = "";
        picture = "";
        mass = __MASS;
    };
    class 8Rnd_82mm_Mo_Flare_white;
    class ACE_1Rnd_82mm_Mo_Illum: 8Rnd_82mm_Mo_Flare_white {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_Illum_displayName);
        descriptionShort = CSTRING(magazine_Illum_descriptionShort);
        model = "";
        picture = "";
        mass = __MASS;
    };
    class 8Rnd_82mm_Mo_guided;
    class ACE_1Rnd_82mm_Mo_HE_Guided: 8Rnd_82mm_Mo_guided {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_HE_Guided_displayName);
        descriptionShort = CSTRING(magazine_HE_Guided_descriptionShort);
        model = "";
        picture = "";
        mass = __MASS;
    };
    class 8Rnd_82mm_Mo_LG;
    class ACE_1Rnd_82mm_Mo_HE_LaserGuided: 8Rnd_82mm_Mo_LG {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_HE_LaserGuided_displayName);
        descriptionShort = CSTRING(magazine_HE_LaserGuided_descriptionShort);
        model = "";
        picture = "";
        mass = __MASS;
    };
};
