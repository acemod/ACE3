class CfgWeapons {
    class RocketPods;
    class GVAR(launcher): RocketPods {
        displayName = "AGM-114K Hellfire II";
        GVAR(enabled) = 1; // handle adding interactions and adding Laser Designator
        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 1; // show attack profile / lock on hud
        magazines[] = {"6Rnd_ACE_Hellfire_AGM114K", "PylonMissile_1Rnd_ACE_Hellfire_AGM114K", "PylonRack_1Rnd_ACE_Hellfire_AGM114K", "PylonRack_3Rnd_ACE_Hellfire_AGM114K", "PylonRack_4Rnd_ACE_Hellfire_AGM114K"};
        
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
    class GVAR(launcher_N): GVAR(launcher) {
        displayName = "AGM-114N Hellfire II";
        magazines[] = {"6Rnd_ACE_Hellfire_AGM114N", "PylonMissile_1Rnd_ACE_Hellfire_AGM114N", "PylonRack_1Rnd_ACE_Hellfire_AGM114N", "PylonRack_3Rnd_ACE_Hellfire_AGM114N", "PylonRack_4Rnd_ACE_Hellfire_AGM114N"};
    };
};
