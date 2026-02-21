class CfgWeapons {
    class weapon_rim116Launcher;
    class GVAR(rim116): weapon_rim116Launcher {
        author = "tcvm";
        displayName = CSTRING(rim116);
        magazines[] = { QGVAR(rim116) };
        weaponLockDelay = 0.5;
    };

    class missiles_SAAMI;
    class GVAR(FIM92): missiles_SAAMI {
        author = "tcvm";
        displayName = CSTRING(stinger);
        magazines[] = { QGVAR(stinger) };
        weaponLockDelay = 0.5;
    };

    class Launcher_Base_F;
    class launch_Titan_base: Launcher_Base_F {
        magazines[] = {QGVAR(stinger_man)};
    };

    #ifdef CREATE_MOCK_PLATFORMS
    class launch_RPG7_F;
    class GVAR(mockStinger): launch_RPG7_F {
        displayName = "Test Stinger";
        canLock = 0;
        magazineWell[] = {};
        magazines[] = {QGVAR(stinger_man)};
        GVAR(enabled) = 1;
        GVAR(lockAngle) = 3;
        GVAR(lockingTimeMin) = 2;
        GVAR(lockingTimeMax) = 4;
        GVAR(lockingSound) = QGVAR(stinger_locking);
        GVAR(lockedSound) = QGVAR(stinger_locked);
    };
    #endif
};

