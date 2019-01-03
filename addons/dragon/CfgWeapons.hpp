class Mode_SemiAuto;
class CfgWeapons {
    class launch_Titan_F;
    class ACE_M47_Dragon: launch_Titan_F {
        model = QPATHTOF(models\ace_m47_magazine.p3d);
        picture = QPATHTOF(data\m47_dragon_item_ca.paa);
        magazines[] = {};
        displayName = "M47 Dragon Carry";
        scope = 2;
        
        class ACE_CSW {
            type = "mount";
            deployTime = 2;
            pickupTime = 2;
            deploy = "ACE_M47_Dragon_NoSight";
        };
    };
    
    class missiles_titan_static;
    class ACE_M47_Dragon_static: missiles_titan_static {
        displayName = "M47 Dragonzzz2222";
        magazines[] = {"ace_m47_dragon"};
    };
    
    class launch_NLAW_F;
    class ACE_M47_Daysight: launch_NLAW_F {
        displayName = "M47 TODO Balls";    // Stay next to tubes in gear dialogs
        model = QPATHTOF(models\ace_m47_optic.p3d);
        picture = QPATHTOF(data\m47_daysight_item_ca.paa);
        optics = 1;
        weaponInfoType = "RscWeaponEmpty";
        modelOptics = QPATHTOF(models\optics_m47);
        reloadaction = "";
        showSwitchAction = 1;
        useAsBinocular = 1;
        uipicture = "";
        descriptionshort = "SU-36/P Daysight";
        ace_disposable = 0;
        magazines[] = {};
        type = 4096;
        opticsPPEffects[] = {"OpticsCHAbera1","OpticsBlur1"};
        opticsZoomMin = 0.015;
        opticsZoomMax = 0.015;
        scope = 2;
        class ACE_CSW {
            type = "weapon";
            deployTime = 2;
            pickupTime = 1;
            class assembleTo {
                ACE_M47_Dragon_NoSight = "ACE_M47_Dragon_Sight";
            };
        };
    };
};