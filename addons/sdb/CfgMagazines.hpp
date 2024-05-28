class CfgMagazines {
    class magazine_Bomb_SDB_x1;
    class PylonRack_Bomb_SDB_x4;
    class GVAR(magazine_bomb_SDB_x1): magazine_Bomb_SDB_x1 {
        displayName = CSTRING(39_1x);
        author = "Dani (TCVM)";
        ammo = QGVAR(sdb);
    };

    class GVAR(PylonRack_bomb_SDB_x4): PylonRack_Bomb_SDB_x4 {
        displayName = CSTRING(39_4x);
        author = "Dani (TCVM)";
        ammo = QGVAR(sdb);
        pylonWeapon = QGVAR(sdb);
    };
};

