class CfgWeapons {
    class RocketPods;
    class GVAR(launcher): RocketPods {
        displayName = "HOT 1";
        EGVAR(laser,canSelect) = 0; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 0; // show attack profile / lock on hud
        magazines[] = {"6Rnd_ACE_HOT1", "PylonMissile_1Rnd_ACE_HOT1", "PylonRack_1Rnd_ACE_HOT1", "PylonRack_3Rnd_ACE_HOT1", "PylonRack_4Rnd_ACE_HOT1"};
        
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
};
