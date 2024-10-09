class CfgVehicles {
    class LandVehicle;
    class StaticWeapon: LandVehicle {
        class Turrets;
    };
    class StaticMGWeapon: StaticWeapon {
        class Turrets: Turrets {
            class MainTurret;
        };
    };
    
    // RIM-162
    class SAM_System_02_base_F: StaticMGWeapon {
        displayName = CSTRING(essm);
        class AnimationSources {
            class Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(RIM162);
            };
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                gunnerName = CSTRING(essm_operator);
                weapons[] = {
                    QGVAR(RIM162)
                };
                magazines[] = {
                    QGVAR(RIM162)
                };
            };
        };
    };
    // Patriot
    class SAM_System_03_base_F: StaticMGWeapon {
        displayName = CSTRING(patriot);
        class AnimationSources {
            class Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(patriot);
            };
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                gunnerName = CSTRING(patriot_operator);
                weapons[] = {
                    QGVAR(patriot)
                };
                magazines[] = {
                    QGVAR(patriot)
                };
            };
        };
    };
    // S-400
    class SAM_System_04_base_F: StaticMGWeapon {
        displayName = CSTRING(s400);
        class AnimationSources {
            class Missiles_revolving {
                source = "revolving";
                weapon = QGVAR(s400);
            };
        };
        class Turrets: Turrets {
            class MainTurret: MainTurret {
                gunnerName = CSTRING(s400_operator);
                weapons[] = {
                    QGVAR(s400)
                };
                magazines[] = {
                    QGVAR(s400)
                };
            };
        };
    };
};