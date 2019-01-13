class CfgWeapons {
    class launch_Titan_F;
    class launch_NLAW_F;
    class missiles_titan_static;
    class GVAR(super): launch_Titan_F {
        model = QPATHTOF(models\ace_m47_magazine.p3d);
        picture = QPATHTOF(data\m47_dragon_item_ca.paa);
        magazines[] = {};
        displayName = CSTRING(dragonName);
        scope = 2;
        
        class ACE_CSW {
            type = "mount";
            deployTime = 2;
            pickupTime = 2;
            deploy = QGVAR(super_noSight);
        };
        
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 253;
        };
    };
    
    class GVAR(superStatic): missiles_titan_static {
        displayName = CSTRING(dragonName);
        magazines[] = { QGVAR(super) };
    };
    
    class GVAR(sight): launch_NLAW_F {
        displayName = CSTRING(sightName);
        model = QPATHTOF(models\ace_m47_optic.p3d);
        picture = QPATHTOF(data\m47_daysight_item_ca.paa);
        optics = 1;
        weaponInfoType = "RscWeaponEmpty";
        modelOptics = QPATHTOF(models\optics_m47);
        reloadaction = "";
        showSwitchAction = 1;
        useAsBinocular = 1;
        uipicture = "";
        descriptionshort = CSTRING(sightDescription);
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
                GVAR(super_noSight) = QGVAR(super_sight);
            };
        };
        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 68;
        };
    };
};

