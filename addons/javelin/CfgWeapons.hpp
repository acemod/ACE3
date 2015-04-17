class CfgWeapons {
    class Launcher;
    class MissileLauncher;
    
    class Launcher_Base_F : Launcher {
        class WeaponSlotsInfo; 
    };
    
    class missiles_titan : MissileLauncher {
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = PATHTOF(data\reticle_titan.p3d);
         
        canLock = 0;

        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
    
    class launch_Titan_base : Launcher_Base_F {
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = PATHTOF(data\reticle_titan.p3d);
         
        canLock = 0;
        
         
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
};