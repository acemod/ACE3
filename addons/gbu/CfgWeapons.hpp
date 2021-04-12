class CfgWeapons {
    class weapon_LGBLauncherBase;
    class GVAR(12): weapon_LGBLauncherBase {
        displayName = "GBU-12 [ACE]";
        magazines[] = { QGVAR(2Rnd_12), QGVAR(1_PylonMissile_1Rnd_12) };

        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 1; // show attack profile / lock on hud
    };

    class GVAR(lom250): weapon_LGBLauncherBase {
        displayName = "FAB-250M-54 [ACE]";
        magazines[] = {"2Rnd_Bomb_03_F","PylonMissile_1Rnd_Bomb_03_F"};

        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 1; // show attack profile / lock on hud
    };
};

