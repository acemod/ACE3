class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(rangetable) {
                    displayName = CSTRING(rangetable_action);
                    condition = QUOTE(_this call FUNC(rangeTableCanUse));
                    statement = QUOTE(_this call FUNC(rangeTableOpen));
                    icon = QPATHTOF(UI\icon_rangeTable.paa);
                    exceptions[] = {"notOnMap", "isNotInside", "isNotSitting"};
                };
            };
        };
    };

    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class Turrets {
            class MainTurret;
        };
    };
    class StaticMortar: StaticWeapon {
        class Turrets: Turrets {
            class MainTurret: MainTurret {};
        };
    };
    class Mortar_01_base_F: StaticMortar {
        class ace_csw {
            proxyWeapon = QFUNC(csw_getProxyWeapon);
            magazineLocation = "_target selectionPosition 'usti hlavne'";
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                turretInfoType = "ACE_Mk6_RscWeaponRangeArtillery";
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
            };
        };
        class ACE_SelfActions {
            class GVAR(toggleMils) {
                displayName = "Toggle MILS";
                condition = QUOTE(true);
                statement = QUOTE(_this call FUNC(toggleMils));
                exceptions[] = {};
            };
        };
    };

    class ACE_Module;
    class GVAR(module): ACE_Module {
        author = ECSTRING(common,ACETeam);
        category = "ACE";
        displayName = CSTRING(Module_DisplayName);
        function = QFUNC(moduleInit);
        scope = 1;
        isGlobal = 1;
        isSingular = 1;
        icon =  QPATHTOF(UI\Icon_Module_mk6_ca.paa);
        functionPriority = 0;
        class Arguments {
            class airResistanceEnabled {
                displayName = CSTRING(airResistanceEnabled_DisplayName);
                description = CSTRING(airResistanceEnabled_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class allowComputerRangefinder {
                displayName = CSTRING(allowComputerRangefinder_DisplayName);
                description = CSTRING(allowComputerRangefinder_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
            class allowCompass {
                displayName = CSTRING(allowCompass_DisplayName);
                description = CSTRING(allowCompass_Description);
                typeName = "BOOL";
                defaultValue = 1;
            };
            class useAmmoHandling {
                displayName = CSTRING(useAmmoHandling_DisplayName);
                description = CSTRING(useAmmoHandling_Description);
                typeName = "BOOL";
                defaultValue = 0;
            };
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };

    class Box_NATO_AmmoOrd_F;
    class ACE_Box_82mm_Mo_HE: Box_NATO_AmmoOrd_F {
        displayName = CSTRING(HEBox_DisplayName);
        author = ECSTRING(common,ACETeam);
        maximumLoad = 400;
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_1Rnd_82mm_Mo_HE,8);
        };
        class TransportItems {};
        class TransportWeapons {};
    };
    class ACE_Box_82mm_Mo_Smoke: ACE_Box_82mm_Mo_HE {
        displayName = CSTRING(SmokeBox_DisplayName);
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_1Rnd_82mm_Mo_Smoke,8);
        };
    };
    class ACE_Box_82mm_Mo_Illum: ACE_Box_82mm_Mo_HE {
        displayName = CSTRING(IllumBox_DisplayName);
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_1Rnd_82mm_Mo_Illum,8);
        };
    };
    class ACE_Box_82mm_Mo_Combo: ACE_Box_82mm_Mo_HE {
        displayName = CSTRING(ComboBox_DisplayName);
        maximumLoad = 2400;
        class TransportMagazines {
            MACRO_ADDMAGAZINE(ACE_1Rnd_82mm_Mo_HE,32);
            MACRO_ADDMAGAZINE(ACE_1Rnd_82mm_Mo_Smoke,8);
            MACRO_ADDMAGAZINE(ACE_1Rnd_82mm_Mo_Illum,8);
        };
    };
};
