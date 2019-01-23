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
};
