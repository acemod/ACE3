#define CREATE_MAGAZINE_GROUP(ammo) class GVAR(ammo) { rhs_##ammo = 1; }
class ace_csw_groups {
    CREATE_MAGAZINE_GROUP(mag_TOW);
    CREATE_MAGAZINE_GROUP(mag_TOWB);
    CREATE_MAGAZINE_GROUP(mag_ITOW);
    CREATE_MAGAZINE_GROUP(mag_TOW2);
    CREATE_MAGAZINE_GROUP(mag_TOW2A);
    CREATE_MAGAZINE_GROUP(mag_TOW2b);
    CREATE_MAGAZINE_GROUP(mag_TOW2b_aero);
    CREATE_MAGAZINE_GROUP(mag_TOW2bb);
    class GVAR(48Rnd_40mm_MK19) {
        RHS_48Rnd_40mm_MK19 = 1;
        RHS_96Rnd_40mm_MK19 = 1;
    };
    class GVAR(48Rnd_40mm_MK19_M430I) {
        RHS_48Rnd_40mm_MK19_M430I = 1;
        RHS_96Rnd_40mm_MK19_M430I = 1;
    };
    class GVAR(48Rnd_40mm_MK19_M430A1) {
        RHS_48Rnd_40mm_MK19_M430A1 = 1;
        RHS_96Rnd_40mm_MK19_M430A1 = 1;
    };
    class GVAR(48Rnd_40mm_MK19_M1001) {
        RHS_48Rnd_40mm_MK19_M1001 = 1;
        RHS_96Rnd_40mm_MK19_M1001 = 1;
    };
    class rhs_mag_762x51_M240_200 {
        rhs_mag_762x51_M240_200 = 1;    // just like vanilla for the titan, just give something already made.
    };
    CREATE_MAGAZINE_GROUP(mag_400rnd_127x99_mag);
    CREATE_MAGAZINE_GROUP(mag_400rnd_127x99_mag_Tracer_Red);
    CREATE_MAGAZINE_GROUP(mag_400rnd_127x99_SLAP_mag);
    CREATE_MAGAZINE_GROUP(mag_400rnd_127x99_SLAP_mag_Tracer_Red);
};

