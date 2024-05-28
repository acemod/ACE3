class CfgWeapons {
    class weapon_LGBLauncherBase;
    class GVAR(12): weapon_LGBLauncherBase {
        displayName = CSTRING(12);
        magazines[] = {
            QGVAR(2Rnd_12),
            QGVAR(2Rnd_GBU12_LGB_MI10),
            QGVAR(4Rnd_GBU12),
            QGVAR(gbu12),
            QGVAR(1_PylonMissile_1Rnd_12),
            QGVAR(PylonMissile_Bomb_GBU12_x1),
            QGVAR(PylonRack_Bomb_GBU12_x2)
        };

        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 1; // show attack profile / lock on hud
    };

    class GVAR(FAB250): weapon_LGBLauncherBase {
        displayName = CSTRING(fab250);
        magazines[] = {
            QGVAR(1Rnd_FAB250),
            QGVAR(2Rnd_FAB250),
            QGVAR(1_PylonMissile_1Rnd_FAB250),
            QGVAR(PylonMissile_1Rnd_FAB250)
        };

        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 1; // show attack profile / lock on hud
    };
};

