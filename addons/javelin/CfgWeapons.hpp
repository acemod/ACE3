class CfgWeapons {
    class Launcher;
    class Launcher_Base_F : Launcher {
        class WeaponSlotsInfo; 
	};
    
    class launch_Titan_base : Launcher_Base_F {
        weaponInfoType = "ACE_RscOptics_javelin";
        modelOptics = PATHTOF(data\reticle_titan.p3d);
         
        canLock = 1;
        
         
        lockingTargetSound[] = {"",0,1};
		lockedTargetSound[] = {"",0,1};
    };
};