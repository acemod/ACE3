class CfgVehicles {
    class Man;
    class CAManBase: Man {
        class ACE_SelfActions {
            class ACE_Equipment {
                class GVAR(rangetable) {
                    displayName = "$STR_ACE_MK6MORTAR_rangetable_action";
                    condition = QUOTE(_this call FUNC(rangeTableCanUse));
                    statement = QUOTE(_this call FUNC(rangeTableOpen));
                    priority = 0;
                    icon = QUOTE(PATHTOF(UI\icon_rangeTable.paa));
                    exceptions[] = {"notOnMap", "isNotInside"};
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
            class MainTurret: MainTurret {
            };
        };
    };
    class Mortar_01_base_F: StaticMortar {
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                turretInfoType = "ACE_Mk6_RscWeaponRangeArtillery";
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
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "$STR_ACE_mk6mortar_Module_DisplayName";
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 0;
        icon =  QUOTE(PATHTOF(UI\Icon_Module_mk6_ca.paa));
        functionPriority = 0;
        class Arguments {
            class airResistanceEnabled {
                displayName = "$STR_ACE_mk6mortar_airResistanceEnabled_DisplayName";
                description = "$STR_ACE_mk6mortar_airResistanceEnabled_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class allowComputerRangefinder {
                displayName = "$STR_ACE_mk6mortar_allowComputerRangefinder_DisplayName";
                description = "$STR_ACE_mk6mortar_allowComputerRangefinder_Description";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class allowCompass {
                displayName = "$STR_ACE_mk6mortar_allowCompass_DisplayName";
                description = "$STR_ACE_mk6mortar_allowCompass_Description";
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription {
            description = "$STR_ACE_mk6mortar_Module_Description";
        };
    };
};