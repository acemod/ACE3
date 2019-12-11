class cfgMagazines {
    class VehicleMagazine;
    class rhs_30Rnd_545x39_7N6_AK;

    class rhs_100Rnd_762x54mmR: rhs_30Rnd_545x39_7N6_AK {
        ace_isbelt = 1;
    };
    class rhs_mag_127x108mm_50: VehicleMagazine {
        ace_isbelt = 1;
    };
    class rhs_mag_127x108mm_150: rhs_mag_127x108mm_50 {
        ace_isbelt = 0;
    };
    class rhs_mag_127x108mm_1470 : rhs_mag_127x108mm_50 {
        ace_isbelt = 0;
    };
    class RHS_mag_VOG30_30: VehicleMagazine {
        ace_isbelt = 1;
    };
    class RHS_mag_GPD30_30: RHS_mag_VOG30_30 {};

    // RHS magazines for crew handled ammo
    class rhs_mag_9M131M;
    class GVAR(mag_9M131M): rhs_mag_9M131M {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_metis_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_9M131F;
    class GVAR(mag_9M131F): rhs_mag_9M131F {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_metis_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_9m133;
    class GVAR(mag_9m133): rhs_mag_9m133 {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_kornet_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_9m133f;
    class GVAR(mag_9m133f): rhs_mag_9m133f {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_kornet_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_9m1331;
    class GVAR(mag_9m1331): rhs_mag_9m1331 {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_kornet_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_9m133m2;
    class GVAR(mag_9m133m2): rhs_mag_9m133m2 {
        scope = 2;
        type = 256;
        count = 1;
        mass = 55;
        model = "rhsafrf\addons\rhs_heavyweapons\atgm\rhs_kornet_emptytube.p3d";
        picture = "\A3\Weapons_F_Tank\Launchers\Vorona\Data\UI\icon_rocket_vorona_HEAT_F_ca.paa";
    };
    class rhs_mag_PG9V;
    class GVAR(mag_PG9V): rhs_mag_PG9V {
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_CA.paa";
    };
    class rhs_mag_PG9N;
    class GVAR(mag_PG9N): rhs_mag_PG9N {
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_CA.paa";
    };
    class rhs_mag_PG9VNT;
    class GVAR(mag_PG9VNT): rhs_mag_PG9VNT {
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_CA.paa";
    };
    class rhs_mag_OG9VM;
    class GVAR(mag_OG9VM): rhs_mag_OG9VM {
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_CA.paa";
    };
    class rhs_mag_OG9V;
    class GVAR(mag_OG9V): rhs_mag_OG9V {
        scope = 2;
        type = 256;
        count = 1;
        mass = 80;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = "\A3\Weapons_F_Exp\Launchers\RPG7\Data\UI\icon_rocket_RPG7_CA.paa";
    };

    class GVAR(mag_VOG30_30): RHS_mag_VOG30_30 {
        scope = 2;
        type = 256;
        count = 30;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
    class GVAR(mag_GPD30_30): RHS_mag_GPD30_30 {
        scope = 2;
        type = 256;
        count = 30;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };
    class RHS_mag_VOG17m_30;
    class GVAR(mag_VOG17m_30): RHS_mag_VOG17m_30 {
        scope = 2;
        type = 256;
        count = 30;
        mass = 40;
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        picture = QPATHTOEF(csw,UI\ammoBox_50bmg_ca.paa);
    };

};
