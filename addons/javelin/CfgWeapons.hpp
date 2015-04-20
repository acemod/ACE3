class CfgWeapons {
    class Launcher;
    class MissileLauncher;
    
    class Launcher_Base_F : Launcher {
        class WeaponSlotsInfo; 
    };

    // @TODO: AA by default, motherfuckers
    class missiles_titan : MissileLauncher {
        
    };
    
    class missiles_titan_at : missiles_titan {
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = PATHTOF(data\reticle_titan.p3d);
         
        canLock = 0;
        magazines[] = {"1Rnd_GAT_missiles"};
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
    class missiles_titan_static_at : missiles_titan_at { };
    
    // @TODO: AA by default, motherfuckers
    class launch_Titan_base : Launcher_Base_F {};
    
    class launch_Titan_short_base : launch_Titan_base {
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = PATHTOF(data\reticle_titan.p3d);
         
        canLock = 0;
        
         
        lockingTargetSound[] = {"",0,1};
        lockedTargetSound[] = {"",0,1};
    };
};