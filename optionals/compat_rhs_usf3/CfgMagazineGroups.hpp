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
    class GVAR(48Rnd_40mm_MK19_M1001) {
        RHS_48Rnd_40mm_MK19_M1001 = 1;
        RHS_96Rnd_40mm_MK19_M1001 = 1;
    };
};

