class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(rangetable) {
                    displayName = CSTRING(rangetable_action);
                    condition = QUOTE(_this call FUNC(rangeTableCanUse));
                    statement = QUOTE(_this call FUNC(rangeTableOpen));
                    priority = 0;
                    icon = QUOTE(PATHTOF(UI\icon_rangeTable.paa));
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
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                turretInfoType = "ACE_Mk6_RscWeaponRangeArtillery";
                discreteDistance[] = {};
                discreteDistanceInitIndex = 0;
            };
        };
        class ACE_Actions {
            class ACE_MainACtions {
                class GVAR(loadMagazine_HE) {
                    displayName = CSTRING(loadMagazine_HE);
                    distance = 4;
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canLoadMagazine));
                    statement = QUOTE([ARR_3(_player,_target,'HE')] call FUNC(loadMagazine));
                    icon = "";
                    class GVAR(loadMagazine_Smoke) {
                        displayName = CSTRING(loadMagazine_Smoke);
                        distance = 4;
                        condition = QUOTE([ARR_3(_player,_target,'Smoke')] call FUNC(canLoadMagazine));
                        statement = QUOTE([ARR_3(_player,_target,'Smoke')] call FUNC(loadMagazine));
                        icon = "";
                    };
                    class GVAR(loadMagazine_Illum) {
                        displayName = CSTRING(loadMagazine_Illum);
                        distance = 4;
                        condition = QUOTE([ARR_3(_player,_target,'Illum')] call FUNC(canLoadMagazine));
                        statement = QUOTE([ARR_3(_player,_target,'Illum')] call FUNC(loadMagazine));
                        icon = "";
                    };
                };
                class GVAR(unloadMagazine) {
                    displayName = CSTRING(unloadMagazine);
                    distance = 4;
                    condition = QUOTE([ARR_2(_player,_target)] call FUNC(canUnloadMagazine));
                    statement = QUOTE([ARR_2(_player,_target)] call FUNC(unloadMagazine));
                    icon = "";
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
        scope = 2;
        isGlobal = 0;
        isSingular = 1;
        icon =  QUOTE(PATHTOF(UI\Icon_Module_mk6_ca.paa));
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
        };
        class ModuleDescription {
            description = CSTRING(Module_Description);
        };
    };
};
