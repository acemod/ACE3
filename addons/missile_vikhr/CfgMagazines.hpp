class CfgMagazines {
    class 2Rnd_LG_scalpel;
    class 6Rnd_LG_scalpel;
    class 8Rnd_LG_scalpel;
    class PylonRack_1Rnd_LG_scalpel;
    class PylonMissile_1Rnd_LG_scalpel;
    class PylonRack_3Rnd_LG_scalpel;
    class PylonRack_4Rnd_LG_scalpel;

    class GVAR(2Rnd): 2Rnd_LG_scalpel {
        author = "tcvm";
        displayName = CSTRING(2x);
        ammo = QGVAR(9k121);
    };

    class GVAR(6Rnd): 6Rnd_LG_scalpel {
        author = "tcvm";
        displayName = CSTRING(6x);
        ammo = QGVAR(9k121);
    };

    class GVAR(8Rnd): 8Rnd_LG_scalpel {
        author = "tcvm";
        displayName = CSTRING(8x);
        ammo = QGVAR(9k121);
    };

    class GVAR(PylonRack_1Rnd): PylonRack_1Rnd_LG_scalpel {
        author = "tcvm";
        displayName = CSTRING(1x);
        ammo = QGVAR(9k121);
        pylonWeapon = QGVAR(9k121);
    };
    class GVAR(PylonMissile_1Rnd): PylonMissile_1Rnd_LG_scalpel {
        author = "tcvm";
        displayName = CSTRING(1x);
        ammo = QGVAR(9k121);
        pylonWeapon = QGVAR(9k121);
    };
    class GVAR(PylonRack_3Rnd): PylonRack_3Rnd_LG_scalpel {
        author = "tcvm";
        displayName = CSTRING(3x);
        ammo = QGVAR(9k121);
        pylonWeapon = QGVAR(9k121);
    };
    class GVAR(PylonRack_4Rnd): PylonRack_4Rnd_LG_scalpel {
        author = "tcvm";
        displayName = CSTRING(4x);
        ammo = QGVAR(9k121);
        pylonWeapon = QGVAR(9k121);
    };
};

