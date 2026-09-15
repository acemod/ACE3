class CfgMagazines {
    class CA_Magazine;
    class VehicleMagazine: CA_Magazine {};

    class magazine_Missile_AGM_02_x1: VehicleMagazine {};
    class PylonMissile_Missile_AGM_02_x1: magazine_Missile_AGM_02_x1 {};
    class PylonMissile_Missile_AGM_02_x2: magazine_Missile_AGM_02_x1 {};

    class 6Rnd_Missile_AGM_02_F: VehicleMagazine {};
    class PylonRack_1Rnd_Missile_AGM_02_F: 6Rnd_Missile_AGM_02_F {};
    class PylonRack_3Rnd_Missile_AGM_02_F: PylonRack_1Rnd_Missile_AGM_02_F {};

    class PylonRack_Missile_AGM_02_x1: magazine_Missile_AGM_02_x1 {};
    class PylonRack_Missile_AGM_02_x2: magazine_Missile_AGM_02_x1 {};

    // Optical Mavericks
    class GVAR(D_magazine): 6Rnd_Missile_AGM_02_F {
        ammo = QGVAR(D);
        author = "tcvm";
        displayName = CSTRING(d_mag_x1);
    };
    class GVAR(D_pylonRack_1Rnd): PylonRack_1Rnd_Missile_AGM_02_F {
        ammo = QGVAR(D);
        author = "tcvm";
        displayName = CSTRING(d_mag_x1);
        pylonWeapon = QGVAR(D_Launcher);
    };
    class GVAR(D_pylonRack_3Rnd): PylonRack_3Rnd_Missile_AGM_02_F {
        ammo = QGVAR(D);
        author = "tcvm";
        displayName = CSTRING(d_mag_x3);
        pylonWeapon = QGVAR(D_Launcher);
    };

    class GVAR(G_magazine_x1): magazine_Missile_AGM_02_x1 {
        ammo = QGVAR(G);
        author = "tcvm";
        displayName = CSTRING(g_mag_x1);
    };
    class GVAR(G_pylonmissile_x1): PylonMissile_Missile_AGM_02_x1 {
        ammo = QGVAR(G);
        author = "tcvm";
        displayName = CSTRING(g_mag_x1);
        pylonWeapon = QGVAR(G_Launcher);
    };
    class GVAR(G_pylonmissile_x2): PylonMissile_Missile_AGM_02_x2 {
        ammo = QGVAR(G);
        author = "tcvm";
        displayName = CSTRING(g_mag_x2);
        pylonWeapon = QGVAR(G_Launcher);
    };

    class GVAR(G_pylonRack_1Rnd): PylonRack_1Rnd_Missile_AGM_02_F {
        ammo = QGVAR(G);
        author = "tcvm";
        displayName = CSTRING(g_mag_x1);
        pylonWeapon = QGVAR(G_Launcher);
    };
    class GVAR(G_PylonRack_3Rnd): PylonRack_3Rnd_Missile_AGM_02_F {
        ammo = QGVAR(G);
        author = "tcvm";
        displayName = CSTRING(g_mag_x3);
        pylonWeapon = QGVAR(G_Launcher);
    };

    class GVAR(G_PylonRack_x1): PylonRack_Missile_AGM_02_x1 {
        ammo = QGVAR(G);
        author = "tcvm";
        displayName = CSTRING(g_mag_x1);
        pylonWeapon = QGVAR(G_Launcher);
    };
    class GVAR(G_PylonRack_x2): PylonRack_Missile_AGM_02_x2 {
        ammo = QGVAR(G);
        author = "tcvm";
        displayName = CSTRING(g_mag_x2);
        pylonWeapon = QGVAR(G_Launcher);
    };

    // Laser Mavericks
    class GVAR(L_magazine_x1): magazine_Missile_AGM_02_x1 {
        ammo = QGVAR(L);
        author = "xrufix";
        descriptionShort = CSTRING(L_MAG_DESCR);
        displayName = CSTRING(L_MAG_x1);
        displayNameShort = CSTRING(L_MAG_short);
    };

    class GVAR(L_pylonmissile_x1): PylonMissile_Missile_AGM_02_x1 {
        ammo = QGVAR(L);
        author = "xrufix";
        descriptionShort = CSTRING(L_MAG_DESCR);
        displayName = CSTRING(L_MAG_x1);
        displayNameShort = CSTRING(L_MAG_short);
        pylonWeapon = QGVAR(L_Launcher);
    };
    class GVAR(L_pylonmissile_x2): PylonMissile_Missile_AGM_02_x2 {
        ammo = QGVAR(L);
        author = "xrufix";
        descriptionShort = CSTRING(L_MAG_DESCR);
        displayName = CSTRING(L_MAG_x1);
        displayNameShort = CSTRING(L_MAG_short);
        pylonWeapon = QGVAR(L_Launcher);
    };

    class GVAR(L_pylonRack_1Rnd): PylonRack_1Rnd_Missile_AGM_02_F {
        ammo = QGVAR(L);
        author = "xrufix";
        descriptionShort = CSTRING(L_MAG_DESCR);
        displayName = CSTRING(L_MAG_x1);
        displayNameShort = CSTRING(L_MAG_short);
        pylonWeapon = QGVAR(L_Launcher_Plane);
    };
    class GVAR(L_PylonRack_3Rnd): PylonRack_3Rnd_Missile_AGM_02_F {
        ammo = QGVAR(L);
        author = "xrufix";
        descriptionShort = CSTRING(L_MAG_DESCR);
        displayName = CSTRING(L_MAG_x3);
        displayNameShort = CSTRING(L_MAG_short);
        pylonWeapon = QGVAR(L_Launcher_Plane);
    };

    class GVAR(L_PylonRack_x1): PylonRack_Missile_AGM_02_x1 {
        ammo = QGVAR(L);
        author = "xrufix";
        descriptionShort = CSTRING(L_MAG_DESCR);
        displayName = CSTRING(L_MAG_x1);
        displayNameShort = CSTRING(L_MAG_short);
        pylonWeapon = QGVAR(L_Launcher);
    };
    class GVAR(L_PylonRack_x2): PylonRack_Missile_AGM_02_x2 {
        ammo = QGVAR(L);
        author = "xrufix";
        descriptionShort = CSTRING(L_MAG_DESCR);
        displayName = CSTRING(L_MAG_x2);
        displayNameShort = CSTRING(L_MAG_short);
        pylonWeapon = QGVAR(L_Launcher);
    };

    // KH-25
    class 4Rnd_Missile_AGM_01_F;
    class PylonRack_1Rnd_Missile_AGM_01_F: 4Rnd_Missile_AGM_01_F {};
    class magazine_Missile_AGM_KH25_x1: VehicleMagazine {};
    class PylonMissile_Missile_AGM_KH25_x1: magazine_Missile_AGM_KH25_x1 {};
    class PylonMissile_Missile_AGM_KH25_INT_x1: PylonMissile_Missile_AGM_KH25_x1 {};

    class ace_kh25ml_pylonrack_x1: PylonRack_1Rnd_Missile_AGM_01_F {
        ammo = "ace_kh25ml";
        author = "xrufix";
        descriptionShort = CSTRING(KH25ML_MAG_DESCR);
        displayName = CSTRING(KH25ML_MAG_x1);
        displayNameShort = CSTRING(L_MAG_short);
        pylonWeapon = "ace_kh25ml_launcher";
    };
    class ace_kh25ml_magazine_x1: magazine_Missile_AGM_KH25_x1 {
        ammo = "ace_kh25ml";
        author = "xrufix";
        descriptionShort = CSTRING(KH25ML_MAG_DESCR);
        displayName = CSTRING(KH25ML_MAG_x1);
        displayNameShort = CSTRING(L_MAG_short);
    };
    class ace_kh25ml_pylonmissile_x1: PylonMissile_Missile_AGM_KH25_x1 {
        ammo = "ace_kh25ml";
        author = "xrufix";
        descriptionShort = CSTRING(KH25ML_MAG_DESCR);
        displayName = CSTRING(KH25ML_MAG_x1);
        displayNameShort = CSTRING(L_MAG_short);
        pylonWeapon = "ace_kh25ml_launcher";
    };
    class ace_kh25ml_pylonmissile_int_x1: PylonMissile_Missile_AGM_KH25_INT_x1 {
        ammo = "ace_kh25ml";
        author = "xrufix";
        descriptionShort = CSTRING(KH25ML_MAG_DESCR);
        displayName = CSTRING(KH25ML_MAG_x1);
        displayNameShort = CSTRING(L_MAG_short);
        pylonWeapon = "ace_kh25ml_launcher";
    };
};
