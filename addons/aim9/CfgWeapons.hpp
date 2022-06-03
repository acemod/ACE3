class CfgWeapons {
    // AIM-9
    class Missile_AA_04_Plane_CAS_01_F;
    class GVAR(m): Missile_AA_04_Plane_CAS_01_F {
        lockAcquire = 1; // auto lock

        author = "Dani (TCVM)";
        displayName = CSTRING(m);
        weaponLockDelay = 0.5;
        magazines[] = {QGVAR(2Rnd_Missile_9m), QGVAR(PylonRack_1Rnd_Missile_9m), QGVAR(PylonMissile_1Rnd_Missile_9m)};
    };

    class weapon_BIM9xLauncher;
    class GVAR(x): weapon_BIM9xLauncher {
        lockAcquire = 1; // auto lock

        author = "Dani (TCVM)";
        displayName = CSTRING(x);
        weaponLockDelay = 0.5;
        magazines[] = { QGVAR(magazine_Missile_9x), QGVAR(PylonMissile_Missile_9x), QGVAR(PylonRack_Missile_9x), QGVAR(PylonRack_Missile_9x_2) };
    };

    // ASRAAM
    class missiles_ASRAAM;
    class GVAR(aim132): missiles_ASRAAM {
        lockAcquire = 1; // auto lock

        author = "Dani (TCVM)";
        displayName = CSTRING(aim132);
        weaponLockDelay = 0.5;
        magazines[] = {
            QGVAR(aim132_2Rnd),
            QGVAR(aim132_2Rnd_MI02),
            QGVAR(aim132_2Rnd_MI06),
            QGVAR(aim132_4Rnd),
            QGVAR(aim132_4Rnd_MI02),
            QGVAR(PylonRack_1Rnd_aim132),
            QGVAR(PylonMissile_1Rnd_aim132)
        };
    };

    // R-73
    class weapon_R73Launcher;
    class GVAR(r73): weapon_R73Launcher {
        lockAcquire = 1; // auto lock

        author = "Dani (TCVM)";
        displayName = CSTRING(r73);
        weaponLockDelay = 0.5;

        magazines[] = {
            QGVAR(r73),
            QGVAR(PylonMissile_Missile_R73_x1)
        };
    };

    class Missile_AA_03_Plane_CAS_02_F;
    class GVAR(r74): Missile_AA_03_Plane_CAS_02_F {
        lockAcquire = 1; // auto lock

        author = "Dani (TCVM)";
        displayName = CSTRING(r74);
        weaponLockDelay = 0.5;

        magazines[] = {
            QGVAR(2Rnd_Missile_R74),
            QGVAR(PylonRack_1Rnd_Missile_R74),
            QGVAR(PylonMissile_1Rnd_Missile_R74)
        };
    };
};

