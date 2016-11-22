class CfgMagazines {
    class CA_Magazine;

    // A3 .50 BMG (12.7x99mm)
    class ACE_100Rnd_127x99_Ball_carryable: CA_Magazine {
        scope = 2;
        displayName = "$STR_A3_CfgMagazines_100Rnd_127x99_mag0";
        count = 100;
        ammo = "B_127x99_Ball"; // doesn't matter
        mass = 240; // Will only fit in large backpacks
        descriptionShort = CSTRING(genericDescription);
        picture = QPATHTOF(ui\ammoBox_50bmg_ca.paa);
        model = "\A3\Structures_F_EPB\Items\Military\Ammobox_rounds_F.p3d";
        ACE_isBelt = 1; // ace_magRepack would technically work
    };
    class ACE_100Rnd_127x99_Red_carryable: ACE_100Rnd_127x99_Ball_carryable {
        displayName = "$STR_A3_CfgMagazines_100Rnd_127x99_mag_Tracer_Red0";
    };
    class ACE_100Rnd_127x99_Green_carryable: ACE_100Rnd_127x99_Ball_carryable {
        displayName = "$STR_A3_CfgMagazines_100Rnd_127x99_mag_Tracer_Green0";
    };
    class ACE_100Rnd_127x99_Yellow_carryable: ACE_100Rnd_127x99_Ball_carryable {
        displayName = "$STR_A3_CfgMagazines_100Rnd_127x99_mag_Tracer_Yellow0";
    };

    
    // A3 20mm GMG
    class ACE_40Rnd_20mm_g_belt_carryable: ACE_100Rnd_127x99_Ball_carryable {
        displayName = "$STR_A3_CfgMagazines_40Rnd_20mm_G_belt0";
        count = 40;
    };
    
    // Soviet HMG (12.7x108mm)
    class ACE_50Rnd_127x108_carryable: ACE_100Rnd_127x99_Ball_carryable {
        displayName = CSTRING(mag_127x108);
        count = 50;
    };
};
