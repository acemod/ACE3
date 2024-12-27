class CfgWeapons {
    class LauncherCore;
    class RocketPods: LauncherCore {};
    class weapon_AGM_65Launcher: RocketPods {};

    class MissileLauncher: LauncherCore {};
    class Missile_AGM_02_Plane_CAS_01_F: MissileLauncher {};

    class GVAR(D_Launcher): Missile_AGM_02_Plane_CAS_01_F {
        author = "Dani (TCVM)";
        displayname = CSTRING(D);
        magazines[] = {QGVAR(D_magazine), QGVAR(D_pylonRack_1Rnd), QGVAR(D_pylonRack_3Rnd)};
        weaponLockDelay = 0.1;
        weaponLockSystem = 2;
    };

    class GVAR(G_Launcher): weapon_AGM_65Launcher {
        author = "Dani (TCVM)";
        displayname = CSTRING(G);
        magazines[] = {QGVAR(G_magazine_x1), QGVAR(G_pylonmissile_x1), QGVAR(G_pylonmissile_x2), QGVAR(G_pylonRack_1Rnd), QGVAR(G_PylonRack_3Rnd), QGVAR(G_PylonRack_x1), QGVAR(G_PylonRack_x2)};
        weaponLockDelay = 0.1;
        weaponLockSystem = 2;
    };

    class GVAR(L_Launcher): weapon_AGM_65Launcher {
        author = "xrufix";
        displayname = CSTRING(L);
        magazines[] = {
            QGVAR(L_magazine_x1),
            QGVAR(L_pylonmissile_x1),
            QGVAR(L_pylonmissile_x2),
            QGVAR(L_pylonRack_1Rnd),
            QGVAR(L_PylonRack_3Rnd),
            QGVAR(L_PylonRack_x1),
            QGVAR(L_PylonRack_x2)
        };
        weaponLockDelay = 0.1;
        weaponLockSystem = 0;

        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 1; // show attack profile / lock on hud
        GVAR(enabled) = 1;
    };

    class GVAR(L_Launcher_Plane): Missile_AGM_02_Plane_CAS_01_F {
        author = "xrufix";
        displayname = CSTRING(L);
        magazines[] = {
            QGVAR(L_magazine_x1),
            QGVAR(L_pylonmissile_x1),
            QGVAR(L_pylonmissile_x2),
            QGVAR(L_pylonRack_1Rnd),
            QGVAR(L_PylonRack_3Rnd),
            QGVAR(L_PylonRack_x1),
            QGVAR(L_PylonRack_x2)
        };
        weaponLockDelay = 0.1;
        weaponLockSystem = 0;

        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 1; // show attack profile / lock on hud
        GVAR(enabled) = 1;
    };

    class weapon_AGM_KH25Launcher: MissileLauncher {};
    class ace_kh25ml_launcher: weapon_AGM_KH25Launcher {
        author = "xrufix";
        displayName = CSTRING(KH25ML);
        magazines[] = {
            "ace_kh25ml_pylonrack_x1",
            "ace_kh25ml_magazine_x1",
            "ace_kh25ml_pylonmissile_x1",
            "ace_kh25ml_pylonmissile_int_x1"
        };
        weaponLockDelay = 0.1;
        weaponLockSystem = 0;

        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 1; // show attack profile / lock on hud
        GVAR(enabled) = 1;
    };
};
