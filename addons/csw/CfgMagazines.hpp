class CfgMagazines {
    class 100Rnd_127x99_mag;
    class GVAR(100Rnd_127x99_mag): 100Rnd_127x99_mag {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(127x99_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 2;
        type = 256;
        count = 100;
        mass = 96;
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        ACE_isBelt = 1;
    };
    class GVAR(100Rnd_127x99_mag_red): GVAR(100Rnd_127x99_mag) {
        displayName = CSTRING(127x99_red_displayName);
    };
    class GVAR(100Rnd_127x99_mag_green): GVAR(100Rnd_127x99_mag) {
        displayName = CSTRING(127x99_green_displayName);
    };
    class GVAR(100Rnd_127x99_mag_yellow): GVAR(100Rnd_127x99_mag) {
        displayName = CSTRING(127x99_yellow_displayName);
    };

    class GVAR(50Rnd_127x108_mag) : GVAR(100Rnd_127x99_mag) {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(127x108_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 2;
        type = 256;
        count = 50;
        mass = 50;
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        ACE_isBelt = 1;
    };
    
    class 40Rnd_20mm_G_belt;
    class GVAR(20Rnd_20mm_G_belt): 40Rnd_20mm_G_belt {
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(GMGBelt_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 2;
        type = 256;
        count = 20;
        mass = 96;
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        ACE_isBelt = 1;
    };
};
