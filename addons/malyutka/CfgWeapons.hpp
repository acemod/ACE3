class CfgWeapons {
    class MissileLauncher;
	class GVAR(9m14): MissileLauncher {
        scope = 2;
        displayName = CSTRING(9m14_missile);
        magazines[] = { QGVAR(9m14) };
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

