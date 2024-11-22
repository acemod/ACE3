class CfgVehicles {
    class All {
        class EventHandlers;
    };
    class AllVehicles: All {};
    class Land: AllVehicles {};
    class LandVehicle: Land {};
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions;
        };
        class Turrets {
            class MainTurret;
        };
        class UserActions;
    };

    // --- Mortars -----------------------------------------------------------------
    class StaticMortar: StaticWeapon {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class SPE_StaticMortar_base: StaticMortar {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
        class EventHandlers: EventHandlers {
            class SPE_StaticWeaponsHandler {
                init = "";
            };
        };
    };

    class SPE_US_Mortar_base: SPE_StaticMortar_base {};
    class SPE_M1_81: SPE_US_Mortar_base {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {};
            };
        };
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = "zamerny";
            };
        };
        class UserActions {
            delete Prepare_WP_Selected;
            delete Prepare_WP;
            delete Prepare_Smoke_Selected;
            delete Prepare_Smoke;
            delete Prepare_HE_Selected;
            delete Prepare_HE;
            delete Reload;
            delete Unload;
        };
        class ACE_CSW {
            enabled = 1;
            proxyWeapon = "SPE_M1_81_proxy";
            magazineLocation = "_target selectionPosition 'usti hlavne'";
            disassembleWeapon = "SPE_M1_81_Barrel";
            disassembleTurret = QGVAR(M1_81_baseplate);
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
            desiredAmmo = 1;
        };
    };

    class SPE_FR_Mortar_base: SPE_StaticMortar_base {};
    class SPE_MLE_27_31: SPE_FR_Mortar_base {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {};
            };
        };
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = "zamerny";
            };
        };
        class UserActions {
            delete Prepare_Illu_Selected;
            delete Prepare_Illu;
            delete Prepare_Smoke_Selected;
            delete Prepare_Smoke;
            delete Prepare_HE_Selected;
            delete Prepare_HE;
            delete Reload;
            delete Unload;
        };
        class ACE_CSW {
            enabled = 1;
            proxyWeapon = "SPE_MLE_27_31_proxy";
            magazineLocation = "_target selectionPosition 'usti hlavne'";
            disassembleWeapon = "SPE_MLE_27_31_Barrel";
            disassembleTurret = QGVAR(MLE_27_31_baseplate);
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
            desiredAmmo = 1;
        };
    };

    class SPE_GrW278_1: SPE_MLE_27_31 {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                magazines[] = {};
            };
        };
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = "zamerny";
            };
        };
        class UserActions {
            delete Prepare_Illu_Selected;
            delete Prepare_Illu;
            delete Prepare_Smoke_Selected;
            delete Prepare_Smoke;
            delete Prepare_HE_Selected;
            delete Prepare_HE;
            delete Reload;
            delete Unload;
        };
        class ACE_CSW {
            enabled = 1;
            proxyWeapon = "SPE_GrW278_1_proxy";
            magazineLocation = "_target selectionPosition 'usti hlavne'";
            disassembleWeapon = "SPE_GrW278_1_Barrel";
            disassembleTurret = QGVAR(GrW278_baseplate);
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
            desiredAmmo = 1;
        };
    };


    class EGVAR(csw,baseTripod);

    class GVAR(MLE_27_31_baseplate): EGVAR(csw,baseTripod) {
        scope = 2;
        displayName = "$STR_DN_SPE_MLE_27_31_STAND";
        model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_MLE_27_31_Stand_X_ca.paa";
        hiddenSelections[] = {"camo_0","camo_1"};
        hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_French_co.paa","WW2\SPE_Assets_t\Weapons\Mortars_t\M1_Mortar\Brandt_81mm_Sight_French_co.paa"};
        class ACE_CSW {
            disassembleTo = "SPE_MLE_27_31_Stand";
        };
    };

    class GVAR(GrW278_baseplate): EGVAR(csw,baseTripod) {
        scope = 2;
        displayName = "$STR_DN_SPE_GrW278_1_STAND";
        model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_GrW278_1_Stand_X_ca.paa";
        hiddenSelections[] = {"camo_0"};
        hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_Gelb_co.paa"};
        class ACE_CSW {
            disassembleTo = "SPE_GrW278_1_Stand";
        };
    };

    class GVAR(M1_81_baseplate): EGVAR(csw,baseTripod) {
        scope = 2;
        displayName = "$STR_DN_SPE_M1_81_STAND";
        model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_M1_81_Stand_X_ca.paa";
        class ACE_CSW {
            disassembleTo = "SPE_M1_81_Stand";
        };
    };


    class ACE_SPE_M1_81_Stand_Deployed: EGVAR(csw,baseTripod) {
        author = "SPE";
        scope = 2;
        displayName = "$STR_DN_SPE_M1_81_STAND";
        model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_M1_81_Stand_X_ca.paa";
        class assembleInfo {
            base = "";
            primary = 0;
            displayName = "";
            assembleTo = "";
            class SPE_M1_81_Barrel {
                deployTime = 0;
                assembleTo = "";
            };
        };
        class ACE_CSW {
            disassembleTo = "SPE_M1_81_Stand";
        };
    };
    class ACE_SPE_GrW278_1_Stand_Deployed: EGVAR(csw,baseTripod) {
        author = "SPE";
        scope = 2;
        displayName = "$STR_DN_SPE_GrW278_1_STAND";
        model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_GrW278_1_Stand_X_ca.paa";
        hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_Gelb_co.paa","WW2\SPE_Assets_t\Weapons\Mortars_t\M1_Mortar\Brandt_81mm_Sight_Gelb_co.paa"};
        class assembleInfo {
            base = "";
            primary = 0;
            displayName = "";
            assembleTo = "";
            class SPE_GrW278_1_Barrel {
                deployTime = 0;
                assembleTo = "";
            };
        };
        class ACE_CSW {
            disassembleTo = "SPE_GrW278_1_Stand";
        };
    };
    class ACE_SPE_MLE_27_31_Stand_Deployed: EGVAR(csw,baseTripod) {
        author = "SPE";
        scope = 2;
        displayName = "$STR_DN_SPE_MLE_27_31_STAND";
        model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_MLE_27_31_Stand_X_ca.paa";
        hiddenSelections[] = {"camo_0","camo_1"};
        hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_French_co.paa","WW2\SPE_Assets_t\Weapons\Mortars_t\M1_Mortar\Brandt_81mm_Sight_French_co.paa"};
        class assembleInfo {
            base = "";
            primary = 0;
            displayName = "";
            assembleTo = "";
            class SPE_MLE_27_31_Barrel {
                deployTime = 0;
                assembleTo = "";
            };
        };
        class ACE_CSW {
            disassembleTo = "SPE_MLE_27_31_Stand";
        };
    };
};
