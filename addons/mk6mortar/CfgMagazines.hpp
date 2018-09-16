class CfgMagazines {
    class 8Rnd_82mm_Mo_shells;
    class ACE_1Rnd_82mm_Mo_HE: 8Rnd_82mm_Mo_shells {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        EGVAR(arsenal,hide) = -1;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_HE_displayName);
        displayNameShort = CSTRING(magazine_HE_displayNameShort);
        descriptionShort = CSTRING(magazine_descriptionShort);
        model = QPATHTOF(data\l16_ammo_he.p3d);
        picture = QPATHTOF(UI\w_l16_ammo_he_ca.paa);
        mass = 50;
        initSpeed = 200;
        GVAR(hasCharges) = 1;
        GVAR(baseCharge) = 1;
        GVAR(timeToPrep) = 2.5;
        GVAR(timeToLoad) = 2.5;
        GVAR(chargeClass) = "ACE_Propelling_Charge";
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE_Charge_3",1},
            {"ACE_1Rnd_82mm_Mo_HE_Charge_2",2},
            {"ACE_1Rnd_82mm_Mo_HE_Charge_1",3}
        };
    };
    class ACE_1Rnd_82mm_Mo_HE_Charge_3: ACE_1Rnd_82mm_Mo_HE {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_HE_charge_3_displayName);
        displayNameShort = CSTRING(magazine_HE_charge_3_displayNameShort);
        initSpeed = 150;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE",-1},
            {"ACE_1Rnd_82mm_Mo_HE_Charge_2",1},
            {"ACE_1Rnd_82mm_Mo_HE_Charge_1",2}
        };
    };
    class ACE_1Rnd_82mm_Mo_HE_Charge_2: ACE_1Rnd_82mm_Mo_HE {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_HE_charge_2_displayName);
        displayNameShort = CSTRING(magazine_HE_charge_2_displayNameShort);
        initSpeed = 100;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE",-2},
            {"ACE_1Rnd_82mm_Mo_HE_Charge_3",-1},
            {"ACE_1Rnd_82mm_Mo_HE_Charge_1",1}
        };
    };
    class ACE_1Rnd_82mm_Mo_HE_Charge_1: ACE_1Rnd_82mm_Mo_HE {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_HE_charge_1_displayName);
        displayNameShort = CSTRING(magazine_HE_charge_1_displayNameShort);
        initSpeed = 50;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE",-3},
            {"ACE_1Rnd_82mm_Mo_HE_Charge_3",-2},
            {"ACE_1Rnd_82mm_Mo_HE_Charge_2",-1}
        };
    };
    class 8Rnd_82mm_Mo_Smoke_white;
    class ACE_1Rnd_82mm_Mo_Smoke: 8Rnd_82mm_Mo_Smoke_white {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        EGVAR(arsenal,hide) = -1;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_Smoke_displayName);
        displayNameShort = CSTRING(magazine_Smoke_displayNameShort);
        descriptionShort = CSTRING(magazine_descriptionShort);
        model = QPATHTOF(data\l16_ammo_smk_white.p3d);
        picture = QPATHTOF(UI\w_l16_ammo_smk_white_ca.paa);
        mass = 50;
        initSpeed = 200;
        GVAR(hasCharges) = 1;
        GVAR(baseCharge) = 1;
        GVAR(timeToPrep) = 2.5;
        GVAR(timeToLoad) = 2.5;
        GVAR(chargeClass) = "ACE_Propelling_Charge";
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_Smoke_Charge_3",1},
            {"ACE_1Rnd_82mm_Mo_Smoke_Charge_2",2},
            {"ACE_1Rnd_82mm_Mo_Smoke_Charge_1",3}
        };
    };
    class ACE_1Rnd_82mm_Mo_Smoke_Charge_3: ACE_1Rnd_82mm_Mo_Smoke {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_Smoke_charge_3_displayName);
        displayNameShort = CSTRING(magazine_Smoke_charge_3_displayNameShort);
        initSpeed = 150;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_Smoke",-1},
            {"ACE_1Rnd_82mm_Mo_Smoke_Charge_2",1},
            {"ACE_1Rnd_82mm_Mo_Smoke_Charge_1",2}
        };
    };
    class ACE_1Rnd_82mm_Mo_Smoke_Charge_2: ACE_1Rnd_82mm_Mo_Smoke {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_Smoke_charge_2_displayName);
        displayNameShort = CSTRING(magazine_Smoke_charge_2_displayNameShort);
        initSpeed = 100;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_Smoke",-2},
            {"ACE_1Rnd_82mm_Mo_Smoke_Charge_3",-1},
            {"ACE_1Rnd_82mm_Mo_Smoke_Charge_1",1}
        };
    };
    class ACE_1Rnd_82mm_Mo_Smoke_Charge_1: ACE_1Rnd_82mm_Mo_Smoke {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_Smoke_charge_1_displayName);
        displayNameShort = CSTRING(magazine_Smoke_charge_1_displayNameShort);
        initSpeed = 50;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_Smoke",-3},
            {"ACE_1Rnd_82mm_Mo_Smoke_Charge_3",-2},
            {"ACE_1Rnd_82mm_Mo_Smoke_Charge_2",-1}
        };
    };
    class 8Rnd_82mm_Mo_Flare_white;
    class ACE_1Rnd_82mm_Mo_Illum: 8Rnd_82mm_Mo_Flare_white {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        EGVAR(arsenal,hide) = -1;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_Illum_displayName);
        displayNameShort = CSTRING(magazine_Illum_displayNameShort);
        descriptionShort = CSTRING(magazine_descriptionShort);
        model = QPATHTOF(data\l16_ammo_illum.p3d);
        picture = QPATHTOF(UI\w_l16_ammo_illum_ca.paa);
        mass = 50;
        initSpeed = 200;
        GVAR(hasCharges) = 1;
        GVAR(baseCharge) = 1;
        GVAR(timeToPrep) = 5;
        GVAR(timeToLoad) = 5;
        GVAR(chargeClass) = "ACE_Propelling_Charge";
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_Illum_Charge_3",1},
            {"ACE_1Rnd_82mm_Mo_Illum_Charge_2",2},
            {"ACE_1Rnd_82mm_Mo_Illum_Charge_1",3}
        };
    };
    class ACE_1Rnd_82mm_Mo_Illum_Charge_3: ACE_1Rnd_82mm_Mo_Illum {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_Illum_charge_3_displayName);
        displayNameShort = CSTRING(magazine_Illum_charge_3_displayNameShort);
        initSpeed = 150;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_Illum",-1},
            {"ACE_1Rnd_82mm_Mo_Illum_Charge_2",1},
            {"ACE_1Rnd_82mm_Mo_Illum_Charge_1",2}
        };
    };
    class ACE_1Rnd_82mm_Mo_Illum_Charge_2: ACE_1Rnd_82mm_Mo_Illum {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_Illum_charge_2_displayName);
        displayNameShort = CSTRING(magazine_Illum_charge_2_displayNameShort);
        initSpeed = 100;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_Illum",-2},
            {"ACE_1Rnd_82mm_Mo_Illum_Charge_3",-1},
            {"ACE_1Rnd_82mm_Mo_Illum_Charge_1",1}
        };
    };
    class ACE_1Rnd_82mm_Mo_Illum_Charge_1: ACE_1Rnd_82mm_Mo_Illum {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_Illum_charge_1_displayName);
        displayNameShort = CSTRING(magazine_Illum_charge_1_displayNameShort);
        initSpeed = 50;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_Illum",-3},
            {"ACE_1Rnd_82mm_Mo_Illum_Charge_3",-2},
            {"ACE_1Rnd_82mm_Mo_Illum_Charge_2",-1}
        };
    };
    class 8Rnd_82mm_Mo_guided;
    class ACE_1Rnd_82mm_Mo_HE_Guided: 8Rnd_82mm_Mo_guided {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        EGVAR(arsenal,hide) = -1;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_HE_Guided_displayName);
        displayNameShort = CSTRING(magazine_HE_Guided_displayNameShort);
        descriptionShort = CSTRING(magazine_descriptionShort);
        model = QPATHTOF(data\l16_ammo_he.p3d);
        picture = QPATHTOF(UI\w_l16_ammo_he_ca.paa);
        mass = 50;
        initSpeed = 200;
        GVAR(hasCharges) = 1;
        GVAR(baseCharge) = 1;
        GVAR(timeToPrep) = 8;
        GVAR(timeToLoad) = 8;
        GVAR(chargeClass) = "ACE_Propelling_Charge";
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE_Guided_Charge_3",1},
            {"ACE_1Rnd_82mm_Mo_HE_Guided_Charge_2",2},
            {"ACE_1Rnd_82mm_Mo_HE_Guided_Charge_1",3}
        };
    };
    class ACE_1Rnd_82mm_Mo_HE_Guided_Charge_3: ACE_1Rnd_82mm_Mo_HE_Guided {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_HE_Guided_charge_3_displayName);
        displayNameShort = CSTRING(magazine_HE_Guided_charge_3_displayNameShort);
        initSpeed = 150;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE_Guided",-1},
            {"ACE_1Rnd_82mm_Mo_HE_Guided_Charge_2",1},
            {"ACE_1Rnd_82mm_Mo_HE_Guided_Charge_1",2}
        };
    };
    class ACE_1Rnd_82mm_Mo_HE_Guided_Charge_2: ACE_1Rnd_82mm_Mo_HE_Guided {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_HE_Guided_charge_2_displayName);
        displayNameShort = CSTRING(magazine_HE_Guided_charge_2_displayNameShort);
        initSpeed = 100;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE_Guided",-2},
            {"ACE_1Rnd_82mm_Mo_HE_Guided_Charge_3",-1},
            {"ACE_1Rnd_82mm_Mo_HE_Guided_Charge_1",1}
        };
    };
    class ACE_1Rnd_82mm_Mo_HE_Guided_Charge_1: ACE_1Rnd_82mm_Mo_HE_Guided {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_HE_Guided_charge_1_displayName);
        displayNameShort = CSTRING(magazine_HE_Guided_charge_1_displayNameShort);
        initSpeed = 50;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE_Guided",-3},
            {"ACE_1Rnd_82mm_Mo_HE_Guided_Charge_3",-2},
            {"ACE_1Rnd_82mm_Mo_HE_Guided_Charge_2",-1}
        };
    };
    class 8Rnd_82mm_Mo_LG;
    class ACE_1Rnd_82mm_Mo_HE_LaserGuided: 8Rnd_82mm_Mo_LG {
        count = 1;
        scope = 2;
        scopeCurator = 2;
        EGVAR(arsenal,hide) = -1;
        author = ECSTRING(common,ACETeam);
        displayName = CSTRING(magazine_HE_LaserGuided_displayName);
        displayNameShort = CSTRING(magazine_HE_LaserGuided_displayNameShort);
        descriptionShort = CSTRING(magazine_descriptionShort);
        model = QPATHTOF(data\l16_ammo_he.p3d);
        picture = QPATHTOF(UI\w_l16_ammo_he_ca.paa);
        mass = 50;
        initSpeed = 200;
        GVAR(hasCharges) = 1;
        GVAR(baseCharge) = 1;
        GVAR(timeToPrep) = 8;
        GVAR(timeToLoad) = 8;
        GVAR(chargeClass) = "ACE_Propelling_Charge";
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_3",1},
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_2",2},
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_1",3}
        };
    };
    class ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_3: ACE_1Rnd_82mm_Mo_HE_LaserGuided {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_HE_LaserGuided_charge_3_displayName);
        displayNameShort = CSTRING(magazine_HE_LaserGuided_charge_3_displayNameShort);
        initSpeed = 150;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided",-1},
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_2",1},
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_1",2}
        };
    };
    class ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_2: ACE_1Rnd_82mm_Mo_HE_LaserGuided {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_HE_LaserGuided_charge_2_displayName);
        displayNameShort = CSTRING(magazine_HE_LaserGuided_charge_2_displayNameShort);
        initSpeed = 100;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided",-2},
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_3",-1},
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_1",1}
        };
    };
    class ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_1: ACE_1Rnd_82mm_Mo_HE_LaserGuided {
        scope = 2;
        scopeCurator = 2;
        displayName = CSTRING(magazine_HE_LaserGuided_charge_1_displayName);
        displayNameShort = CSTRING(magazine_HE_LaserGuided_charge_1_displayNameShort);
        initSpeed = 50;
        GVAR(baseCharge) = 0;
        GVAR(charges)[] = {
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided",-3},
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_3",-2},
            {"ACE_1Rnd_82mm_Mo_HE_LaserGuided_Charge_2",-1}
        };
    };
};
