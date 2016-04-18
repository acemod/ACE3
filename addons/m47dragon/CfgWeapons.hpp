class Mode_SemiAuto;
class CfgWeapons {
    class Launcher_Base_F;
    class ACE_M47_Dragon: Launcher_Base_F {
        scope = 2;
        displayName = "M47 Dragon (M222)";
        model = QUOTE(PATHTOF(models\ace_m47_magazine.p3d));
        picture = QUOTE(PATHTOF(data\m47_dragon_item_ca.paa));
        //modelOptics = QUOTE(PATHTOF(models\optics_m47));
        canlock = 0;
        weaponlocksystem = 0;
    };
    
    class MissileLauncher;
    class ACE_M47_Dragon_static: MissileLauncher {
        displayName = "M47 Dragon";
        magazines[] = {"ace_m47_dragon"};
        distanceZoomMin = 1500;
        distanceZoomMax = 200;
        muzzlepos = = "spice rakety"; 
        canlock = 0;
        weaponlocksystem = 0;        
    };
    
    class launch_NLAW_F;
    class ACE_M47_Daysight: launch_NLAW_F {
        displayName = "SU-36/P Daysight";    // Stay next to tubes in gear dialogs
        model = QUOTE(PATHTOF(models\ace_m47_optic.p3d));
        picture = QUOTE(PATHTOF(data\m47_daysight_item_ca.paa));
        optics = 1;
        weaponInfoType = "RscWeaponEmpty";
        modelOptics = QUOTE(PATHTOF(models\optics_m47));
        reloadaction = "";
        showSwitchAction = 1;
        useAsBinocular = 1;
        uipicture = "";
        descriptionshort = "M47 Dragon SU-36/P Daysight with 6x magnification.";
        ace_disposable = 0;
        magazines[] = {};
        type = 4096;
        opticsPPEffects[] = {"OpticsCHAbera1","OpticsBlur1"};
        opticsZoomMin = 0.015;
        opticsZoomMax = 0.015;
    };
};