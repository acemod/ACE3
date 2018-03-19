class CfgMagazines {
    class 100Rnd_127x99_mag;
    class 1Rnd_GAT_missiles;
    class 40Rnd_20mm_G_belt;
    class 1Rnd_GAA_missiles;
    
    class GVAR(100Rnd_127x99_mag): 100Rnd_127x99_mag {
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(127x99_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 2;
        type = 256;
        count = 100;
        mass = 40;
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        ACE_isBelt = 1;
    };
    // The maximum amount of ammo the HMG can hold. Its a dummy since all this purpose is for is to allow for 200 bullets
    class GVAR(HMG_Dummy_200Rnd_mag): 100Rnd_127x99_mag {
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(DummyMagazine_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 1;
        type = 0;
        count = 200;
        mass = 40;
    };
    
    class GVAR(50Rnd_127x108_mag) : 100Rnd_127x99_mag {
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(127x108_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 2;
        type = 256;
        count = 50;
        mass = 40;
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        ACE_isBelt = 1;
    };
    
    class GVAR(20Rnd_20mm_G_belt): 40Rnd_20mm_G_belt {
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(GMGBelt_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 2;
        type = 256;
        count = 20;
        mass = 40;
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
        ACE_isBelt = 1;
    };
    class GVAR(GMG_Dummy_120Rnd_mag): 40Rnd_20mm_G_belt {
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(DummyMagazine_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 1;
        type = 0;
        count = 120;
        mass = 40;
    };
    
    class GVAR(1Rnd_GAT_missiles): 1Rnd_GAT_missiles {
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(ATRocket_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 2;
        type = 256;
        count = 1;
        mass = 125;
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
    };
    class GVAR(TitanAT_Dummy_Missile): 1Rnd_GAT_missiles {
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(DummyMagazine_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 1;
        type = 0;
        count = 1;
        mass = 125;
    };
    
    class GVAR(1Rnd_GAA_missiles): 1Rnd_GAA_missiles {
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(AARocket_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 2;
        type = 256;
        count = 1;
        mass = 125;
        picture = QPATHTOF(UI\ammoBox_50bmg_ca.paa);
    };
    class GVAR(TitanAA_Dummy_Missile): 1Rnd_GAA_missiles {
        author = ECSTRING(common, ACETeam);
        displayName = CSTRING(DummyMagazine_displayName);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        scope = 1;
        type = 0;
        count = 1;
        mass = 125;
    };
    
};

