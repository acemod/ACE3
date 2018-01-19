class CfgWeapons {
    class missiles_DAGR;
    class GVAR(dagr): missiles_DAGR {
        canLock = 0;
        magazines[] = {"6Rnd_ACE_Hydra70_DAGR","12Rnd_ACE_Hydra70_DAGR","24Rnd_ACE_Hydra70_DAGR"};
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
    
    class RocketPods;
    class Bomb_04_Plane_CAS_01_F: RocketPods {
        ace_laser_canSelect = 1;
        ace_laser_showHud = 1;
        canLock = 0;
        weaponLockSystem = 0;
    };
};
