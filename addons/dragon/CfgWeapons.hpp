class CfgWeapons {
    class launch_Titan_base;
    class Launcher_Base_F;
    class missiles_titan;
    class Binocular;
    class Default;
    class missiles_titan_static: missiles_titan {
        class WeaponSlotsInfo;
    };
    class launch_Titan_F: launch_Titan_base {
        class WeaponSlotsInfo;
    };

    class GVAR(super): launch_Titan_F {
        model = QPATHTOF(models\ace_m47_magazine.p3d);
        picture = QPATHTOF(data\m47_dragon_item_ca.paa);
        magazines[] = {};
        displayName = CSTRING(dragonNameCarry); // add [CSW] prefix to make it clearer in arsenal that this is a deployable weapon
        descriptionShort = CSTRING(dragonDescription);
        scope = 2;

        class ACE_CSW {
            type = "mount";
            deployTime = 2;
            pickupTime = 2;
            deploy = QGVAR(staticBase);
        };

        class WeaponSlotsInfo: WeaponSlotsInfo {
            mass = 253;
        };
        modes[] = {};
    };

    class GVAR(superStatic): missiles_titan_static {
        EGVAR(overpressure,angle) = 90;
        EGVAR(overpressure,range) = 30;
        EGVAR(overpressure,damage) = 0.85;

        initSpeed = 120;

        displayName = CSTRING(dragonName);
        descriptionShort = CSTRING(dragonDescription);
        magazines[] = { QGVAR(super) };
    };

    // need a weapon in order to rotate turret
    class GVAR(dummyStatic): Default {
        cursor = "";
        cursorAim = "";
        scope = 1;
        displayName = CSTRING(dragonName);
        reloadTime = 0;
        canLock = 0;
        optics = 0;
        enableAttack = 0;
    };

    class GVAR(sight): Binocular {
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
        descriptionShort = CSTRING(sightDescription);
        ace_disposable = 0;
        magazines[] = {};
        type = 4096;
        opticsPPEffects[] = {"OpticsCHAbera1","OpticsBlur1"};
        opticsZoomMin = 0.055;
        opticsZoomMax = 0.055;
        scope = 2;
        class ACE_CSW {
            type = "weapon";
            deployTime = 2;
            pickupTime = 1;
            class assembleTo {
                GVAR(super_noSight) = QGVAR(super_sight);
            };
        };
        class WeaponSlotsInfo {
            mass = 68;
        };
    };
};
