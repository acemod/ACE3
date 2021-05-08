class CfgWeapons {
    class MissileLauncher;
	class GVAR(9m14): MissileLauncher {
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

    // dummy weapon meant to allow the ability to shoot "connected" malyutkas
    class GVAR(9s415_dummy_weapon): MissileLauncher {
        displayName = CSTRING(9m14_missile); // intended to be 9m14
        magazines[] = { QGVAR(9s415_dummy) };
        initSpeed = 100;
        autoFire = 0;
        canLock = 0;
        weaponLockSystem = 0;
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
        soundFly[] = {"",1,1.1,700};
        nameSound = "";
        sounds[] = {""};        
        class StandardSound {
            begin1[] = {"",1.12202,1.3,1000};
            soundBegin[] = {"",1};
            soundsetshot[] = {""};
        };
        cursor = "EmptyCursor";
        cursorAim = "missile";
        showAimCursorInternal = 0;
        
        autoReload = 1;
        magazineReloadTime = 0.2;
    };
};

