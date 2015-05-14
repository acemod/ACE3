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

    class Logic;
    class Module_F: Logic {
        class ModuleDescription {};
    };
    class GVAR(module): Module_F {
        author = "$STR_ACE_Common_ACETeam";
        category = "ACE";
        displayName = "MK6 Settings";
        function = QFUNC(moduleInit);
        scope = 2;
        isGlobal = 0;
        icon =  QUOTE(PATHTOF(UI\Icon_Module_mk6_ca.paa));
        functionPriority = 0;
        class Arguments {
            class airResistanceEnabled {
                displayName = "Air Resistance";
                description = "For Player Shots, Model Air Resistance and Wind Effects";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class allowComputerRangefinder {
                displayName = "Allow MK6 Computer";
                description = "Show the Computer and Rangefinder (these NEED to be removed if you enable air resistance)";
                typeName = "BOOL";
                defaultValue = 0;
            };
            class allowCompass {
                displayName = "Allow MK6 Compass";
                description = "Show the MK6 Digital Compass";
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "";
        };
    };
};
