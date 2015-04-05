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
            class noComputer {
                displayName = "No Computer";
                description = "Removes Computer and Rangefinder";
                typeName = "BOOL";
                defaultValue = 1;
            };
        };
        class ModuleDescription: ModuleDescription {
            description = "";
        };
    };
};
