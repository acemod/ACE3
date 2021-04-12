class CfgWeapons {
    class missiles_DAGR;

    class GVAR(dagr): missiles_DAGR {
        EGVAR(laser,canSelect) = 1; // can ace_laser lock (allows switching laser code)
        EGVAR(laser,showHud) = 1; // show attack profile / lock on hud
        magazines[] = {"6Rnd_ACE_Hydra70_DAGR","12Rnd_ACE_Hydra70_DAGR","24Rnd_ACE_Hydra70_DAGR","PylonRack_6Rnd_ACE_DAGR","PylonRack_12Rnd_ACE_DAGR","PylonRack_24Rnd_ACE_DAGR"};

        autoFire = 0;
        canLock = 0;
        weaponLockSystem = 0;
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
};
