class CfgVehicles {
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
        // icon = QUOTE(PATHTOF(UI\Icon_.paa));
        functionPriority = 0;
        class Arguments {
            class disableComputerRangefinder {
                displayName = "Remove MK6 Computer/Rangefinder";
                description = "Removes Computer and Rangefinder (these should be removed if you enable air resistance)";
                typeName = "BOOL";
                defaultValue = 1;
            };
            class airResistanceEnabled {
                displayName = "Air Resitance";
                description = "For Player Shots, Model Air Restiance and Wind Effects";
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "";
        };
    };
};
