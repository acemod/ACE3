class CfgWeapons {
    class RocketPods;
    class MissileLauncher;
    class GVAR(1_launcher): RocketPods {
        displayName = CSTRING(hot1);
        magazines[] = {QGVAR(1_6Rnd), QGVAR(1_2Rnd), QGVAR(1_PylonMissile_1Rnd), QGVAR(1_PylonRack_1Rnd), QGVAR(1_PylonRack_3Rnd), QGVAR(1_PylonRack_4Rnd)};
        initSpeed = 100;
        autoFire = 0;
        canLock = 0;
        weaponLockSystem = 0;
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
        soundFly[] = {"A3\Sounds_F\weapons\Rockets\rocket_fly_1",1,1.1,700};
        nameSound = "MissileLauncher";
        sounds[] = {"StandardSound"};        
        class StandardSound {
            begin1[] = {"A3\Sounds_F\weapons\Rockets\missile_1",1.12202,1.3,1000};
            soundBegin[] = {"begin1",1};
            soundsetshot[] = {"RocketsMedium_Shot_SoundSet"};
        };
        cursor = "EmptyCursor";
        cursorAim = "missile";
        showAimCursorInternal = 0;
    };
    class GVAR(2_launcher): GVAR(1_launcher) {
        displayName = CSTRING(hot2);
        magazines[] = {QGVAR(2_6Rnd), QGVAR(2_2Rnd), QGVAR(2_PylonMissile_1Rnd), QGVAR(2_PylonRack_1Rnd), QGVAR(2_PylonRack_3Rnd), QGVAR(2_PylonRack_4Rnd)};
    };
    class GVAR(2mp_launcher): GVAR(1_launcher) {
        displayName = CSTRING(hot2mp);
        magazines[] = {QGVAR(2MP_6Rnd), QGVAR(2MP_2Rnd), QGVAR(2MP_PylonMissile_1Rnd), QGVAR(2MP_PylonRack_1Rnd), QGVAR(2MP_PylonRack_3Rnd), QGVAR(2MP_PylonRack_4Rnd)};
    };
    class GVAR(3_launcher): GVAR(1_launcher) {
        displayName = CSTRING(hot3);
        magazines[] = {QGVAR(3_6Rnd), QGVAR(3_2Rnd), QGVAR(3_PylonMissile_1Rnd), QGVAR(3_PylonRack_1Rnd), QGVAR(3_PylonRack_3Rnd), QGVAR(3_PylonRack_4Rnd)};
    };
    class GVAR(generic_launcher): MissileLauncher {
        displayName = CSTRING(hotMissile);
        magazines[] = {QGVAR(1_6Rnd), QGVAR(1_2Rnd), QGVAR(2_6Rnd), QGVAR(2_2Rnd), QGVAR(2MP_6Rnd), QGVAR(2MP_2Rnd), QGVAR(3_6Rnd), QGVAR(3_2Rnd)};
        initSpeed = 100;
        autoFire = 0;
        canLock = 0;
        weaponLockSystem = 0;
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
        soundFly[] = {"A3\Sounds_F\weapons\Rockets\rocket_fly_1",1,1.1,700};
        nameSound = "MissileLauncher";
        sounds[] = {"StandardSound"};        
        class StandardSound {
            begin1[] = {"A3\Sounds_F\weapons\Rockets\missile_1",1.12202,1.3,1000};
            soundBegin[] = {"begin1",1};
            soundsetshot[] = {"RocketsMedium_Shot_SoundSet"};
        };
        cursor = "EmptyCursor";
        cursorAim = "missile";
        showAimCursorInternal = 0;
        
        autoReload = 1;
        magazineReloadTime = 20;
    };
};

