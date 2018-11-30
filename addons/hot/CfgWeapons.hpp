class CfgWeapons {
    class RocketPods;
    class GVAR(hot1_launcher): RocketPods {
        displayName = "HOT 1";
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
    class GVAR(hot2_launcher): GVAR(hot1_launcher) {
        displayName = "HOT 2";
        magazines[] = {"6Rnd_ACE_HOT2", "PylonMissile_1Rnd_ACE_HOT2", "PylonRack_1Rnd_ACE_HOT2", "PylonRack_3Rnd_ACE_HOT2", "PylonRack_4Rnd_ACE_HOT2"};
    };
    class GVAR(hot2mp_launcher): GVAR(hot1_launcher) {
        displayName = "HOT 2MP";
        magazines[] = {"6Rnd_ACE_HOT2MP", "PylonMissile_1Rnd_ACE_HOT2MP", "PylonRack_1Rnd_ACE_HOT2MP", "PylonRack_3Rnd_ACE_HOT2MP", "PylonRack_4Rnd_ACE_HOT2MP"};
    };
    class GVAR(hot3_launcher): GVAR(hot1_launcher) {
        displayName = "HOT 3";
        magazines[] = {"6Rnd_ACE_HOT3", "PylonMissile_1Rnd_ACE_HOT3", "PylonRack_1Rnd_ACE_HOT3", "PylonRack_3Rnd_ACE_HOT3", "PylonRack_4Rnd_ACE_HOT3"};
    };
};
