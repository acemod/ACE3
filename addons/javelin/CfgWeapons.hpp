class CfgWeapons {
    class Launcher;
    class Launcher_Base_F : Launcher {
        class WeaponSlotsInfo; 
	};
    
    class launch_Titan_base : Launcher_Base_F {
        weaponInfoType = "ACE_RscOptics_javelin";
        
        lockingTargetSound[] = {"",0,1};
		lockedTargetSound[] = {"",0,1};
    };
};