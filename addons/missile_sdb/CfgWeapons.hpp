class CfgWeapons {
    class weapon_SDBLauncher;
    class GVAR(sdb): weapon_SDBLauncher {
        author = "tcvm";
        displayName = CSTRING(39);
        magazines[] = {
            QGVAR(magazine_bomb_SDB_x1),
            QGVAR(PylonRack_bomb_SDB_x4)
        };
    };
};

