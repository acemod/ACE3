class CfgMagazines {
    class 100Rnd_127x99_mag;
    class GVAR(100Rnd_127x99_mag): 100Rnd_127x99_mag {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(127x99_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        type = 256;
        mass = 96;
        ACE_isBelt = 1;
    };

    class 100Rnd_127x99_mag_Tracer_Red;
    class GVAR(100Rnd_127x99_mag_red): 100Rnd_127x99_mag_Tracer_Red {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(127x99_red_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        type = 256;
        mass = 96;
        ACE_isBelt = 1;
    };

    class 100Rnd_127x99_mag_Tracer_Green;
    class GVAR(100Rnd_127x99_mag_green): 100Rnd_127x99_mag_Tracer_Green {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(127x99_green_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        type = 256;
        mass = 96;
        ACE_isBelt = 1;
    };

    class 100Rnd_127x99_mag_Tracer_Yellow;
    class GVAR(100Rnd_127x99_mag_yellow): 100Rnd_127x99_mag_Tracer_Yellow {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(127x99_yellow_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        type = 256;
        mass = 96;
        ACE_isBelt = 1;
    };

    class 50Rnd_127x108_Ball;
    class GVAR(50Rnd_127x108_mag): 50Rnd_127x108_Ball {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(127x108_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        type = 256;
        mass = 50;
        ACE_isBelt = 1;
    };

    class 40Rnd_20mm_G_belt;
    class GVAR(20Rnd_20mm_G_belt): 40Rnd_20mm_G_belt {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(GMGBelt_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        type = 256;
        count = 20;
        mass = 96;
        ACE_isBelt = 1;
    };

    // vehicle stuff
    class 96Rnd_40mm_G_belt;
    class GVAR(96Rnd_40mm_G_belt): 96Rnd_40mm_G_belt {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(GMGBelt96_displayName);
        model = "\A3\Weapons_F\Ammoboxes\Proxy_UsBasicAmmoBox.p3d";
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        type = 256;
        mass = 192;     // 2*40rnds
        ACE_isBelt = 1;
    };

    class 12rnd_SPG9_HEAT;
    class GVAR(12rnd_SPG9_HEAT): 12rnd_SPG9_HEAT {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(SPGHEAT_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        type = 256;
        mass = 240;
        ACE_isBelt = 0;
    };

    class 8rnd_SPG9_HE;
    class GVAR(8rnd_SPG9_HE): 8rnd_SPG9_HE {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(SPGHE_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        type = 256;
        mass = 160;
        ACE_isBelt = 0;
    };

    // TODO: green tracers aren't the only tracer 
    class 500Rnd_65x39_Belt_Tracer_Green_Splash;
    class GVAR(500Rnd_65x39_Belt_Tracer_Green_Splash): 500Rnd_65x39_Belt_Tracer_Green_Splash {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(65_39Belt_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        type = 256;
        mass = 192;
        count = 500;
        ACE_isBelt = 1;
    };

};
