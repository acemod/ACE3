#define STRINGS(magazine) author = ECSTRING(common,ACETeam); displayName = CSTRING(magazine)

class CfgMagazines {

    // 5.56mm
    class 150Rnd_556x45_Drum_Mag_F;
    class ACE_150Rnd_556x45_Drum_green : 150Rnd_556x45_Drum_Mag_F {
        ammo = "B_556x45_Ball_tracer_green";
        STRINGS(150Rnd_556x45_Drum_green);
    };
    class ACE_150Rnd_556x45_Drum_yellow : 150Rnd_556x45_Drum_Mag_F {
        ammo = "B_556x45_Ball_tracer_yellow";
        STRINGS(150Rnd_556x45_Drum_yellow);
    };

    class 150Rnd_556x45_Drum_Mag_tracer_F;
    class ACE_150Rnd_556x45_Drum_tracer_green : 150Rnd_556x45_Drum_Mag_tracer_F {
        ammo = "B_556x45_Ball_tracer_green";
        STRINGS(150Rnd_556x45_Drum_tracer_green);
        descriptionShort = CSTRING(150Rnd_556x45_Drum_tracer_green_description);
    };
    class ACE_150Rnd_556x45_Drum_tracer_yellow : 150Rnd_556x45_Drum_Mag_tracer_F {
        ammo = "B_556x45_Ball_tracer_yellow";
        STRINGS(150Rnd_556x45_Drum_tracer_yellow);
        descriptionShort = CSTRING(150Rnd_556x45_Drum_tracer_green_description);
    };

    class 200Rnd_556x45_Box_F;
    class ACE_200Rnd_556x45_Box_green : 200Rnd_556x45_Box_F {
        ammo = "B_556x45_Ball_tracer_green";
        STRINGS(200Rnd_556x45_Box_green);
    };
    class 200Rnd_556x45_Box_tracer_F;
    class ACE_200Rnd_556x45_Box_tracer_green : 200Rnd_556x45_Box_tracer_F {
        ammo = "B_556x45_Ball_tracer_green";
        STRINGS(200Rnd_556x45_Box_tracer_green);
        descriptionShort = CSTRING(200Rnd_556x45_Box_tracer_green_description);
    };

    // 5.8mm
    class 30Rnd_580x42_Mag_F;
    class ACE_30Rnd_580x42_Mag_red : 30Rnd_580x42_Mag_F {
        ammo = "ACE_580x42_Ball_tracer_red";
        STRINGS(30Rnd_580x42_Mag_red);
    };
    class ACE_30Rnd_580x42_Mag_yellow : 30Rnd_580x42_Mag_F {
        ammo = "ACE_580x42_Ball_tracer_yellow";
        STRINGS(30Rnd_580x42_Mag_yellow);
    };

    class 30Rnd_580x42_Mag_tracer_F;
    class ACE_30Rnd_580x42_Mag_tracer_red : 30Rnd_580x42_Mag_tracer_F {
        ammo = "ACE_580x42_Ball_tracer_red";
        STRINGS(30Rnd_580x42_Mag_tracer_red);
        descriptionShort = CSTRING(30Rnd_580x42_Mag_tracer_red_description);
    };
    class ACE_30Rnd_580x42_Mag_tracer_yellow : 30Rnd_580x42_Mag_tracer_F {
        ammo = "ACE_580x42_Ball_tracer_yellow";
        STRINGS(30Rnd_580x42_Mag_tracer_yellow);
        descriptionShort = CSTRING(30Rnd_580x42_Mag_tracer_yellow_description);
    };

    class 100Rnd_580x42_Mag_F;
    class ACE_100Rnd_580x42_Drum_red : 100Rnd_580x42_Mag_F {
        ammo = "ACE_580x42_Ball_tracer_red";
        STRINGS(100Rnd_580x42_Drum_red);
    };
    class ACE_100Rnd_580x42_Drum_yellow : 100Rnd_580x42_Mag_F {
        ammo = "ACE_580x42_Ball_tracer_yellow";
        STRINGS(100Rnd_580x42_Drum_yellow);
    };

    class 100Rnd_580x42_Mag_tracer_F;
    class ACE_100Rnd_580x42_Drum_tracer_red : 100Rnd_580x42_Mag_tracer_F {
        ammo = "ACE_580x42_Ball_tracer_red";
        STRINGS(100Rnd_580x42_Drum_tracer_red);
        descriptionShort = CSTRING(100Rnd_580x42_Drum_tracer_red_description);
    };
    class ACE_100Rnd_580x42_Drum_tracer_yellow : 100Rnd_580x42_Mag_tracer_F {
        ammo = "ACE_580x42_Ball_tracer_yellow";
        STRINGS(100Rnd_580x42_Drum_tracer_yellow);
        descriptionShort = CSTRING(100Rnd_580x42_Drum_tracer_yellow_description);
    };

	// 6.5mm Caseless MX
    class 30Rnd_65x39_caseless_mag;
    class ACE_30Rnd_65x39_mx_green : 30Rnd_65x39_caseless_mag {
        ammo = "B_65x39_Caseless_green";
        STRINGS(30Rnd_65x39_mx_green);
        descriptionShort = CSTRING(30Rnd_65x39_mx_green_description);
    };
    class ACE_30Rnd_65x39_mx_yellow : 30Rnd_65x39_caseless_mag {
        ammo = "B_65x39_Caseless_yellow";
        STRINGS(30Rnd_65x39_mx_yellow);
        descriptionShort = CSTRING(30Rnd_65x39_mx_yellow_description);
    };

    class 30Rnd_65x39_caseless_mag_tracer;
    class ACE_30Rnd_65x39_mx_tracer_green : 30Rnd_65x39_caseless_mag_tracer {
        ammo = "B_65x39_Caseless_green";
        picture = "a3\weapons_f\Data\UI\m_30stanag_caseless_green_CA.paa";
        STRINGS(30Rnd_65x39_mx_tracer_green);
        descriptionShort = CSTRING(30Rnd_65x39_mx_tracer_green_description);
    };
    class ACE_30Rnd_65x39_mx_tracer_yellow : 30Rnd_65x39_caseless_mag_tracer {
        ammo = "B_65x39_Caseless_yellow";
        picture = "a3\weapons_f\Data\UI\m_30stanag_caseless_yellow_CA.paa";
        STRINGS(30Rnd_65x39_mx_tracer_yellow);
        descriptionShort = CSTRING(30Rnd_65x39_mx_tracer_yellow_description);
    };

    class 100Rnd_65x39_caseless_mag;
    class ACE_100Rnd_65x39_mx_green : 100Rnd_65x39_caseless_mag {
        ammo = "B_65x39_Caseless_green";
        STRINGS(100Rnd_65x39_mx_green);
    };
    class ACE_100Rnd_65x39_mx_yellow : 100Rnd_65x39_caseless_mag {
        ammo = "B_65x39_Caseless_yellow";
        STRINGS(100Rnd_65x39_mx_yellow);
    };

    class 100Rnd_65x39_caseless_mag_tracer;
    class ACE_100Rnd_65x39_mx_tracer_green : 100Rnd_65x39_caseless_mag_tracer {
        ammo = "B_65x39_Caseless_green";
        picture = "a3\weapons_f\Data\UI\M_100Rnd_65x39_green_CA.paa";
        STRINGS(100Rnd_65x39_mx_tracer_green);
        descriptionShort = CSTRING(100Rnd_65x39_mx_tracer_green_description);
    };
    class ACE_100Rnd_65x39_mx_tracer_yellow : 100Rnd_65x39_caseless_mag_tracer {
        ammo = "B_65x39_Caseless_yellow";
        picture = "a3\weapons_f\Data\UI\M_100Rnd_65x39_yellow_CA.paa";
        STRINGS(100Rnd_65x39_mx_tracer_yellow);
        descriptionShort = CSTRING(100Rnd_65x39_mx_tracer_yellow_description);
    };

    // 6.5mm Caseless Katiba
    class 30Rnd_65x39_caseless_green;
    class ACE_30Rnd_65x39_katiba_red : 30Rnd_65x39_caseless_green {
        ammo = "B_65x39_Caseless";
        STRINGS(30Rnd_65x39_katiba_red);
    };
    class ACE_30Rnd_65x39_katiba_yellow : 30Rnd_65x39_caseless_green {
        ammo = "B_65x39_Caseless_yellow";
        STRINGS(30Rnd_65x39_katiba_yellow);
    };

    class 30Rnd_65x39_caseless_green_mag_Tracer;
    class ACE_30Rnd_65x39_katiba_tracer_red : 30Rnd_65x39_caseless_green_mag_Tracer {
        ammo = "B_65x39_Caseless";
        picture = "a3\weapons_f\Data\UI\m_20stanag_red_CA.paa";
        STRINGS(30Rnd_65x39_katiba_tracer_red);
        descriptionShort = CSTRING(30Rnd_65x39_katiba_tracer_red_description);
    };
    class ACE_30Rnd_65x39_katiba_tracer_yellow : 30Rnd_65x39_caseless_green_mag_Tracer {
        ammo = "B_65x39_Caseless_yellow";
        picture = "a3\weapons_f\Data\UI\m_20stanag_yellow_CA.paa";
        STRINGS(30Rnd_65x39_katiba_tracer_yellow);
        descriptionShort = CSTRING(30Rnd_65x39_katiba_tracer_yellow_description);
    };

    // 6.5mm Cased
    class 200Rnd_65x39_cased_Box;
    class ACE_200Rnd_65x39_cased_Box_green : 200Rnd_65x39_cased_Box {
        ammo = "B_65x39_Case_green";
        STRINGS(200Rnd_65x39_cased_Box_green);
        descriptionShort = CSTRING(200Rnd_65x39_cased_Box_green_description);
    };
    class ACE_200Rnd_65x39_cased_Box_red : 200Rnd_65x39_cased_Box {
        ammo = "B_65x39_Case";
        STRINGS(200Rnd_65x39_cased_Box_red);
        descriptionShort = CSTRING(200Rnd_65x39_cased_Box_red_description);
    };

    class 200Rnd_65x39_cased_Box_tracer;
    class ACE_200Rnd_65x39_cased_Box_tracer_green : 200Rnd_65x39_cased_Box_tracer {
        ammo = "B_65x39_Case_green";
        picture = "a3\weapons_f\Data\UI\M_200Rnd_65x39_green_CA.paa";
        STRINGS(200Rnd_65x39_cased_Box_tracer_green);
        descriptionShort = CSTRING(200Rnd_65x39_cased_Box_tracer_green_description);
    };
    class ACE_200Rnd_65x39_cased_Box_tracer_red : 200Rnd_65x39_cased_Box_tracer {
        ammo = "B_65x39_Case";
        picture = "a3\weapons_f\Data\UI\M_200Rnd_65x39_red_CA.paa";
        STRINGS(200Rnd_65x39_cased_Box_tracer_red);
        descriptionShort = CSTRING(200Rnd_65x39_cased_Box_tracer_red_description);
    };

    // 7.62x51 (NATO)
    class ACE_20Rnd_762x51_Mag_tracer;
    class ACE_20Rnd_762x51_Mag_tracer_green : ACE_20Rnd_762x51_Mag_tracer {
        ammo = "B_762x51_tracer_green";
        STRINGS(20Rnd_762x51_Mag_tracer_green);
        descriptionShort = CSTRING(20Rnd_762x51_Mag_tracer_green_description);
    };
    class ACE_20Rnd_762x51_Mag_tracer_yellow : ACE_20Rnd_762x51_Mag_tracer {
        ammo = "B_762x51_tracer_yellow";
        STRINGS(20Rnd_762x51_Mag_tracer_yellow);
        descriptionShort = CSTRING(20Rnd_762x51_Mag_tracer_green_description);
    };

    // 7.62x54 (Russian)
    class 150Rnd_762x54_Box;
    class ACE_150Rnd_762x54_Box_red : 150Rnd_762x54_Box {
        ammo = "B_762x54_tracer_red";
        STRINGS(150Rnd_762x54_Box_red);
    };
    class ACE_150Rnd_762x54_Box_yellow : 150Rnd_762x54_Box {
        ammo = "B_762x54_tracer_yellow";
        STRINGS(150Rnd_762x54_Box_yellow);
    };

    class 150Rnd_762x54_Box_tracer;
    class ACE_150Rnd_762x54_Box_tracer_red : 150Rnd_762x54_Box_tracer {
        ammo = "B_762x54_tracer_red";
        STRINGS(150Rnd_762x54_Box_tracer_red);
        descriptionShort = CSTRING(150Rnd_762x54_Box_tracer_red_description);
    };
    class ACE_150Rnd_762x54_Box_tracer_yellow : 150Rnd_762x54_Box_tracer {
        ammo = "B_762x54_tracer_yellow";
        STRINGS(150Rnd_762x54_Box_tracer_yellow);
        descriptionShort = CSTRING(150Rnd_762x54_Box_tracer_yellow_description);
    };

    // 9.3x64
    class 150Rnd_93x64_Mag;
    class ACE_150Rnd_93x64_Mag_red : 150Rnd_93x64_Mag {
        ammo = "ACE_93x64_tracer_red";
        STRINGS(150Rnd_93x64_Mag_red);
    };
    class ACE_150Rnd_93x64_Mag_yellow : 150Rnd_93x64_Mag {
        ammo = "ACE_93x64_tracer_yellow";
        STRINGS(150Rnd_93x64_Mag_yellow);
    };

    // .338 NM
    class 130Rnd_338_Mag;
    class ACE_130Rnd_338_Mag_green : 130Rnd_338_Mag {
        ammo = "ACE_338_NM_tracer_green";
        STRINGS(130Rnd_338_Mag_green);
    };
    class ACE_130Rnd_338_Mag_yellow : 130Rnd_338_Mag {
        ammo = "ACE_338_NM_tracer_yellow";
        STRINGS(130Rnd_338_Mag_yellow);
    };
};
