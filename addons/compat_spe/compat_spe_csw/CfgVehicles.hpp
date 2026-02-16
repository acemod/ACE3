class CfgVehicles {
    class All;
    class AllVehicles: All {};
    class Land: AllVehicles {};
    class LandVehicle: Land {};
    class StaticWeapon: LandVehicle {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };

    // --- Gun Turrets -------------------------------------------------------------
    class StaticMGWeapon: StaticWeapon {};
    class SPE_StaticMGWeapon_base: StaticMGWeapon {};
    class SPE_M2_M3: SPE_StaticMGWeapon_base {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = "zamerny";
            };
        };
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(M2_proxy);
            magazineLocation = "";
            disassembleWeapon = "SPE_M2_50";
            disassembleTurret = QGVAR(m3Tripod);
            ammoLoadTime = 10;
            ammoUnloadTime = 8;
            desiredAmmo = 100;
        };
    };
    class SPE_M2_M3_Trench: SPE_M2_M3 {
        class ace_csw: ace_csw {
            disassembleWeapon = "";
            disassembleTurret = "";
        };
    };


    class SPE_M1919_M2: SPE_StaticMGWeapon_base {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(M1919A4_proxy);
            magazineLocation = "_target selectionPosition ['magazine', 'FireGeometry', 'AveragePoint']";
            disassembleWeapon = "SPE_M1919A4";
            disassembleTurret = QGVAR(m2Tripod);
            ammoLoadTime = 8;
            ammoUnloadTime = 6;
            desiredAmmo = 100;
        };
    };
    class SPE_M1919_M2_Trench_Deployed: SPE_M1919_M2 {
        class ace_csw: ace_csw {
            disassembleWeapon = "";
            disassembleTurret = "";
        };
    };


    class SPE_MG42_Lafette: SPE_StaticMGWeapon_base {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(alterHeight) {
                    condition = "getText (configOf _target >> 'SPE_AltHeight_Tripod_Name') != '' && {[_target, true] call SPE_WEAPONS_STATIC_fnc_can_alter_height}";
                    displayName = "$STR_SPE_DN_ASSETS_VEHICLES_ADJUST_TRIPOD_HEIGHT";
                    statement = "[_target, getText (configOf _target >> 'SPE_AltHeight_Tripod_Name'), true] call SPE_Weapons_Static_fnc_alter_height";
                    icon = "\A3\Ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";
                    modifierFunction = "(_this select 3) set [1, format [localize 'STR_SPE_DN_ASSETS_VEHICLES_ADJUST_TRIPOD_HEIGHT', getText (configOf _target >> 'displayName')]]";
                };
            };
        };
    };
    class SPE_MG42_Lafette_Deployed: SPE_MG42_Lafette {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(MG42_proxy);
            magazineLocation = "";
            disassembleWeapon = "SPE_MG42";
            disassembleTurret = QGVAR(LafetteTripod);
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
            desiredAmmo = 100;
        };
    };
    class SPE_MG34_Lafette_Deployed: SPE_MG42_Lafette {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(MG34_proxy);
            magazineLocation = "";
            disassembleWeapon = "SPE_MG34";
            disassembleTurret = QGVAR(LafetteTripod);
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
            desiredAmmo = 100;
        };
    };

    class SPE_MG42_Lafette_low;
    class SPE_MG42_Lafette_low_Deployed: SPE_MG42_Lafette_low {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(MG42_proxy);
            magazineLocation = "";
            disassembleWeapon = "SPE_MG42";
            disassembleTurret = QGVAR(LafetteTripodLow);
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
            desiredAmmo = 100;
        };
    };
    class SPE_MG42_Lafette_trench_Deployed: SPE_MG42_Lafette_low_Deployed {
        class ace_csw: ace_csw {
            disassembleWeapon = "";
            disassembleTurret = "";
        };
    };

    class SPE_MG34_Lafette_low_Deployed: SPE_MG42_Lafette_low {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(MG34_proxy);
            magazineLocation = "";
            disassembleWeapon = "SPE_MG34";
            disassembleTurret = QGVAR(LafetteTripodLow);
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
            desiredAmmo = 100;
        };
    };
    class SPE_MG34_Lafette_Trench_Deployed: SPE_MG34_Lafette_low_Deployed {
        class ace_csw: ace_csw {
            disassembleWeapon = "";
            disassembleTurret = "";
        };
    };


    class SPE_MG_Bipod_base;
    class SPE_M1919A6_Bipod: SPE_MG_Bipod_base {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(M1919A6_proxy);
            magazineLocation = "";
            disassembleWeapon = "";
            disassembleTurret = "";
            ammoLoadTime = 8;
            ammoUnloadTime = 6;
            desiredAmmo = 100;
        };
    };


    class SPE_MG42_Bipod: SPE_MG_Bipod_base {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(MG42_proxy);
            magazineLocation = "";
            disassembleWeapon = "";
            disassembleTurret = "";
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
            desiredAmmo = 100;
        };
    };
    class SPE_MG34_Bipod: SPE_MG_Bipod_base {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(MG34_proxy);
            magazineLocation = "";
            disassembleWeapon = "";
            disassembleTurret = "";
            ammoLoadTime = 7;
            ammoUnloadTime = 5;
            desiredAmmo = 100;
        };
    };


    class ThingX;
    class EGVAR(csw,baseTripod): ThingX {
        class ACE_Actions {
            class ACE_MainActions;
        };
    };
    class GVAR(m3Tripod): EGVAR(csw,baseTripod) {
        scope = 2;
        displayName = "$STR_DN_SPE_M3_Tripod";
        model = "\WW2\SPE_Assets_m\Vehicles\StaticWeapons_U1_m\SPE_M3_Tripod.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_U1_t\Weapons\Launchers\Gear_M3_Tripod_X_ca.paa";
        class ace_csw {
            disassembleTo = "SPE_M3_Tripod";
        };
    };

    class GVAR(m2Tripod): EGVAR(csw,baseTripod) {
        scope = 2;
        displayName = "$STR_DN_SPE_M2_Tripod";
        model = "\WW2\SPE_Assets_m\Vehicles\StaticWeapons_m\SPE_M2_Tripod_Low.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_M2_Tripod_X_ca.paa";
        class ace_csw {
            disassembleTo = "SPE_M2_Tripod";
        };
    };

    class GVAR(LafetteTripodLow): EGVAR(csw,baseTripod) {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                class GVAR(alterHeight) {
                    condition = "getText (configOf _target >> 'SPE_AltHeight_Tripod_Name') != '' && {[_target, true] call SPE_WEAPONS_STATIC_fnc_can_alter_height}";
                    displayName = "$STR_SPE_DN_ASSETS_VEHICLES_ADJUST_TRIPOD_HEIGHT";
                    statement = "[_target, getText (configOf _target >> 'SPE_AltHeight_Tripod_Name'), true] call SPE_Weapons_Static_fnc_alter_height";
                    icon = "\A3\Ui_f\data\IGUI\Cfg\Actions\repair_ca.paa";
                    modifierFunction = "(_this select 3) set [1, format [localize 'STR_SPE_DN_ASSETS_VEHICLES_ADJUST_TRIPOD_HEIGHT', getText (configOf _target >> 'displayName')]]";
                };
            };
        };
        scope = 2;
        displayName = "$STR_DN_SPE_Lafette_Tripod";
        model = "\WW2\SPE_Assets_m\Vehicles\StaticWeapons_m\SPE_Lafette_Tripod_Low.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_Lafette_Tripod_X_ca.paa";
        SPE_AltHeight_Tripod_Name = QGVAR(LafetteTripod);
        class ace_csw {
            disassembleTo = "SPE_Lafette_Tripod";
        };
    };

    class GVAR(LafetteTripod): GVAR(LafetteTripodLow) {
        model = "\WW2\SPE_Assets_m\Vehicles\StaticWeapons_m\SPE_Lafette_Tripod_High.p3d";
        SPE_AltHeight_Tripod_Name = QGVAR(LafetteTripodLow);
        class ace_csw {
            disassembleTo = "SPE_Lafette_Tripod";
        };
    };

    // --- Mortars -----------------------------------------------------------------
    class StaticMortar: StaticWeapon {};
    class SPE_StaticMortar_base: StaticMortar {};
    class SPE_US_Mortar_base: SPE_StaticMortar_base {};
    class SPE_M1_81: SPE_US_Mortar_base {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = "zamerny";
            };
        };
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(M1_proxy);
            magazineLocation = "_target selectionPosition 'usti hlavne'";
            disassembleWeapon = "SPE_M1_81_Barrel";
            disassembleTurret = QGVAR(m1Baseplate);
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
            desiredAmmo = 1;
            allowFireOnLoad = 2;
        };
    };


    class SPE_FR_Mortar_base: SPE_StaticMortar_base {};
    class SPE_MLE_27_31: SPE_FR_Mortar_base {
        class ACE_Actions: ACE_Actions {
            class ACE_MainActions: ACE_MainActions {
                position = "";
                selection = "zamerny";
            };
        };
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(MLE_27_31_proxy);
            magazineLocation = "_target selectionPosition 'usti hlavne'";
            disassembleWeapon = "SPE_MLE_27_31_Barrel";
            disassembleTurret = QGVAR(MLE_27_31_baseplate);
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
            desiredAmmo = 1;
            allowFireOnLoad = 2;
        };
    };

    class SPE_GrW278_1: SPE_MLE_27_31 {
        class ace_csw {
            enabled = 1;
            proxyWeapon = QGVAR(GrW278_1_proxy);
            magazineLocation = "_target selectionPosition 'usti hlavne'";
            disassembleWeapon = "SPE_GrW278_1_Barrel";
            disassembleTurret = QGVAR(GrW278_baseplate);
            ammoLoadTime = 3;
            ammoUnloadTime = 3;
            desiredAmmo = 1;
            allowFireOnLoad = 2;
        };
    };


    class GVAR(m1Baseplate): EGVAR(csw,baseTripod) {
        scope = 2;
        displayName = "$STR_DN_SPE_M1_81_STAND";
        model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_M1_81_Stand_X_ca.paa";
        class ace_csw {
            disassembleTo = "SPE_M1_81_Stand";
        };
    };

    class GVAR(MLE_27_31_baseplate): EGVAR(csw,baseTripod) {
        scope = 2;
        displayName = "$STR_DN_SPE_MLE_27_31_STAND";
        model = "\WW2\SPE_Assets_m\Weapons\Mortars_m\SPE_M1_Mortar_Stand_Deployed.p3d";
        picture = "\WW2\SPE_Assets_t\Weapons\Equipment_t\Weapons\Launchers\Gear_MLE_27_31_Stand_X_ca.paa";
        hiddenSelections[] = {"camo_0","camo_1"};
        hiddenSelectionsTextures[] = {"ww2\spe_assets_t\weapons\mortars_t\m1_mortar\Brandt_81mm_Mortar_French_co.paa","WW2\SPE_Assets_t\Weapons\Mortars_t\M1_Mortar\Brandt_81mm_Sight_French_co.paa"};
        class ace_csw {
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
        class ace_csw {
            disassembleTo = "SPE_GrW278_1_Stand";
        };
    };
};
