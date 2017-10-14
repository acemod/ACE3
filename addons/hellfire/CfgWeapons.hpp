class CfgWeapons {
    class missiles_SCALPEL;
    class GVAR(launcher): missiles_SCALPEL {
        displayName = "AGM-114K Hellfire II";
        GVAR(enabled) = 1; // handle adding interactions and adding Laser Designator
        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 1; // show attack profile / lock on hud
        canLock = 0;
        weaponLockSystem = 0;
        magazines[] = {"6Rnd_ACE_Hellfire_AGM114K", "PylonMissile_1Rnd_ACE_Hellfire_AGM114K", "PylonRack_1Rnd_ACE_Hellfire_AGM114K", "PylonRack_3Rnd_ACE_Hellfire_AGM114K", "PylonRack_4Rnd_ACE_Hellfire_AGM114K"};
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
    class GVAR(launcher_N): GVAR(launcher) {
        displayName = "AGM-114N Hellfire II";
        magazines[] = {"6Rnd_ACE_Hellfire_AGM114N", "PylonMissile_1Rnd_ACE_Hellfire_AGM114N", "PylonRack_1Rnd_ACE_Hellfire_AGM114N", "PylonRack_3Rnd_ACE_Hellfire_AGM114N", "PylonRack_4Rnd_ACE_Hellfire_AGM114N"};
    };
};
