class Mode_SemiAuto;
class CfgWeapons {
    class CannonCore;
    class LauncherCore;
    
    class RocketPods: LauncherCore {
        // canLock = 1;
    };
    class missiles_DAGR : RocketPods {
        canLock = 1;
        magazines[] += {"24Rnd_ACE_Hydra70_DAGR", "12Rnd_ACE_Hydra70_DAGR", "6Rnd_ACE_Hydra70_DAGR", "24Rnd_ACE_Hellfire_AGM114K", "12Rnd_ACE_Hellfire_AGM114K", "6Rnd_ACE_Hellfire_AGM114K" };
    };
};